# # defmodule Error do
# #   defstruct [:message]

# #   @type t :: %__MODULE__{
# #           message: String.t()
# #         }
# # end

# # defmodule VoiceModelBackupURL do
# #   defstruct [:url]

# #   @type t :: %__MODULE__{
# #           url: String.t()
# #         }
# # end

# defmodule Person do
#   @moduledoc """
#   A struct representing a person.
#   """

#   @enforce_keys [:name]
#   defstruct name: nil,
#             age: nil,
#             happy: true,
#             phone: nil

#   @typedoc "A person"
#   @type t() :: %__MODULE__{
#           name: String.t(),
#           age: non_neg_integer() | nil,
#           happy: boolean(),
#           phone: String.t() | nil
#         }
# end

# # defmodule Data do
# #   @enforce_keys [:createVoiceModelBackupUrl]
# #   defstruct [:createVoiceModelBackupUrl]

# #   @type t :: %__MODULE__{
# #           createVoiceModelBackupUrl: VoiceModelBackupURL.t()
# #         }
# # end

# # defmodule AIHubVoiceModels do
# #   defstruct data: nil, errors: []

# #   @type t :: %__MODULE__{
# #           data: Data.t() | nil,
# #           errors: [Error.t()]
# #         }
# # end

# # Example usage
# defmodule Temp do
#   def run do
#     # Create an example VoiceModelBackupURL
#     # backup_url = %VoiceModelBackupURL{}

#     # # Create an example Data struct
#     # data = %Data{createVoiceModelBackupUrl: backup_url}

#     # Create an AIHubVoiceModels struct without errors
#     # voice_models = %AIHubVoiceModels{data: data}

#     # # Print the structs to demonstrate
#     # IO.inspect(voice_models)

#     # Example with an error
#     # error = %Error{message: "Something went wrong",}
#     # voice_models_with_error = %AIHubVoiceModels{data: nil, errors: [error]}

#     # # Print the struct with an error
#     # IO.inspect(voice_models_with_error)
#     data = %Person{name: 1}
#     IO.inspect(data)
#   end
# end

# # Run the example
# Temp.run()

# defmodule Example do
#   @spec add_one(integer()) :: integer()
#   def add_one(number), do: number + "1"
# end
