# defmodule Wfloat.AIHubVoiceModels.VoiceModelBackupURL do
#   @enforce_keys [:id, :url, :voice_model_id]
#   defstruct [:id, :url, :voice_model_id]

#   @type t :: %__MODULE__{
#           id: String.t(),
#           url: String.t(),
#           voice_model_id: String.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.AIHubVoiceModelBackupUrlsEdge do
#   @enforce_keys [ :node ]
#   defstruct [:node]

#   @type t :: %__MODULE__{
#           node: Wfloat.AIHubVoiceModels.VoiceModelBackupURL.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.AIHubVoiceModelBackupUrlsConnection do
#   defstruct [:edges]

#   @type t :: %__MODULE__{
#           edges: [Wfloat.AIHubVoiceModels.AIHubVoiceModelBackupUrlsEdge.t()]
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.VoiceModelProfile do
#   @enforce_keys [ :accent, :confidence, :fictional, :gender, :id, :model_trained_on_english_probability, :voice_model_profile_name, :native_language, :relevant_tags, :voice_model_id ]
#   defstruct [ :accent, :confidence, :fictional, :gender, :id, :model_trained_on_english_probability, :voice_model_profile_name, :native_language, :relevant_tags, :voice_model_id ]

#   @type t :: %__MODULE__{
#           accent: String.t(),
#           confidence: float(),
#           fictional: boolean(),
#           gender: String.t(),
#           id: String.t(),
#           model_trained_on_english_probability: float(),
#           voice_model_profile_name: String.t(),
#           native_language: String.t(),
#           relevant_tags: [String.t()],
#           voice_model_id: String.t()
#         }
# end


# defmodule Wfloat.AIHubVoiceModels.AIHubVoiceModel do
#   @enforce_keys [:download_count, :filename, :checksum_md5_for_weights, :backup_urls]
#   defstruct [ :download_count, :filename, :ai_hub_voice_model_name, :checksum_md5_for_weights, :inferred_profile, :backup_urls ]

#   @type t :: %__MODULE__{
#           download_count: float(),
#           filename: String.t(),
#           ai_hub_voice_model_name: String.t() | nil,
#           checksum_md5_for_weights: String.t(),
#           inferred_profile: VoiceModelProfile.t() | nil,
#           backup_urls: Wfloat.AIHubVoiceModels.AIHubVoiceModelBackupUrlsConnection.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.AIHubVoiceModelsEdge do
#   @enforce_keys [:node]
#   defstruct [:node]

#   @type t :: %__MODULE__{
#           node: Wfloat.AIHubVoiceModels.AIHubVoiceModel.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.PageInfo do
#   @enforce_keys [:has_next_page, :has_previous_page]
#   defstruct [:end_cursor, :has_next_page, :has_previous_page, :start_cursor]

#   @type t :: %__MODULE__{
#           end_cursor: String.t() | nil,
#           has_next_page: boolean(),
#           has_previous_page: boolean(),
#           start_cursor: String.t() | nil
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.AIHubVoiceModelsConnection do
#   @enforce_keys [:has_next_page]
#   defstruct [:page_info, :edges]

#   @type t :: %__MODULE__{
#           page_info: PageInfo.t(),
#           edges: [Wfloat.AIHubVoiceModels.AIHubVoiceModelsEdge.t()]
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.DataClass do
#   @enforce_keys [:ai_hub_voice_models]
#   defstruct [:ai_hub_voice_models]

#   @type t :: %__MODULE__{
#           ai_hub_voice_models: Wfloat.AIHubVoiceModels.AIHubVoiceModelsConnection.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.Error do
#   @enforce_keys [:message]
#   defstruct [:message]

#   @type t :: %__MODULE__{
#           message: String.t()
#         }
# end

# defmodule Wfloat.AIHubVoiceModels.Result do
#   defstruct [:data, :errors]

#   @type t :: %__MODULE__{
#           data: Wfloat.AIHubVoiceModels.DataClass.t() | nil,
#           errors: [Wfloat.AIHubVoiceModels.Error.t()] | nil
#         }
# end
