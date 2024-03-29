defmodule MyConnection do
  @behaviour Neuron.Connection

  @impl Neuron.Connection
  def call(body, options) do
    IO.inspect("NEURON CALLED")
    Neuron.Connection.Http.call(body, options)
  end
end

defmodule WfloatWeb.CreateTTSLive do
  use WfloatWeb, :live_view
  alias Wfloat.Text_to_speeches.TextToSpeech

  def mount(_params, _session, socket) do
    changeset = TextToSpeech.changeset(%TextToSpeech{}, %{})
    socket = assign(socket, form: changeset)
    socket = assign(socket, :message, nil)
    socket = assign(socket, :message_content, nil)
    socket = assign(socket, :character_id, nil)
    socket = assign(socket, :auth_token, nil)
    socket = assign(socket, :output_url, nil)
    {:ok, assign(socket, text: "Hello, World!")}
  end

  def handle_event("autofill_weather", _params, socket) do
    weather_report = "Today's weather is sunny with a high of 75 degrees and a low of 65."
    new_socket = assign(socket, :message_content, weather_report)
    {:noreply, new_socket}
  end

  def handle_event("select_character", %{"character_id" => character_id}, socket) do
    # Your logic here, for example:

    # Now you can use character_id and message_content as needed
    # Update the socket or perform actions
    new_socket = assign(socket, :character_id, character_id)
    {:noreply, new_socket}
end

  def handle_event("process_message", %{"character_id" => character_id, "message_content" => message_content}, socket) do
    # Now you have character_id and message_content from the form
    # Add your code here to process these values
    IO.puts("Character ID: #{character_id}")
    # IO.puts("Message Content: #{message_content}")

    auth_token = socket.assigns[:auth_token]
    IO.inspect(auth_token, label: "auth")

    response = Neuron.query("""
    mutation Mutation($input: CreateTextToSpeechInput!) {
      createTextToSpeech(input: $input) {
        id
        inputText
        outputUrl
        voiceModelId
      }
    }
    """,
    %{input: %{
      inputText: message_content,
      voiceModelId: character_id
    }},
    url: "http://localhost:4000",
    headers: [authorization: auth_token]
    )

      new_socket = case response do
        {:ok, %Neuron.Response{body: %{"data" => data}}} ->
          output_url = data["createTextToSpeech"]["outputUrl"]
          IO.puts(output_url)
          new_socket = socket
          |> assign(:message, "hello")
          |> assign(:message_content, message_content)
          |> assign(:character_id, character_id)
          |> assign(:output_url, output_url)
        {:error, _error} ->
          new_socket = assign(socket, :output_url, nil)
      end


    {:noreply, new_socket}
  end

  def handle_event("validate_auth_key", %{"auth_token" => auth_token}, socket) do
    response = Neuron.query("""
    query VoiceModels($first: Int) {
      VoiceModels(first: $first) {
        edges {
          node {
            id
            name
          }
        }
      }
    }
    """,
    %{first: 100},
    url: "http://localhost:4000",
    headers: [authorization: auth_token]
    )

    new_socket = case response do
      {:ok, %Neuron.Response{body: %{"data" => _data}}} ->
        IO.puts(auth_token)
        IO.inspect(response, label: "GraphQL Response")
        # assign(socket, :message, "working!")
        assign(socket, :auth_token, auth_token)

      {:error, _error} ->
        IO.inspect(response, label: "GraphQL Response")
        assign(socket, :auth_token, nil)
    end

    # new_socket = assign(socket, auth_token: auth_token)

    {:noreply, new_socket}
  end

  def handle_event("execute_action", _params, socket) do
    # Your Elixir code to be executed when the button is clicked
    IO.puts("Button clicked")


    res = Neuron.query("""
    query VoiceModels($first: Int) {
      VoiceModels(first: $first) {
        edges {
          node {
            id
            name
          }
        }
      }
    }
    """,
    %{first: 100},
    url: "http://localhost:4000"
    # headers: [authorization: "7fe604399352f2b3f53a2b8e8450771d"]
    )
    IO.inspect(res, label: "GraphQL Response")

    # IO.puts(res)

    {:noreply, socket}
  end
end
