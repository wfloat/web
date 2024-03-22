defmodule Wfloat.Text_to_speeches.TextToSpeech do
  use Ecto.Schema
  import Ecto.Changeset

  schema "text_to_speeches" do
    field :voiceModelId, :string
    field :inputText, :string
    field :authHeader, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(text_to_speech, attrs) do
    text_to_speech
    |> cast(attrs, [:voiceModelId, :inputText, :authHeader])
    |> validate_required([:voiceModelId, :inputText, :authHeader])
  end
end
