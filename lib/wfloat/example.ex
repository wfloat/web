# defmodule VoiceModelBackupURL do
#   defstruct [:node]

#   # Assuming VoiceModelBackupURL struct is defined elsewhere
# end

# defmodule AIHubVoiceModelBackupUrlsEdge do
#   defstruct node: %VoiceModelBackupURL{}

#   def from_map(map) do
#     %AIHubVoiceModelBackupUrlsEdge{
#       node: VoiceModelBackupURL.from_map(map["node"])
#     }
#   end

#   def to_map(%AIHubVoiceModelBackupUrlsEdge{node: node}) do
#     %{"node" => VoiceModelBackupURL.to_map(node)}
#   end
# end

# defmodule AIHubVoiceModelBackupUrlsConnection do
#   defstruct edges: []

#   def from_map(map) do
#     edges = Enum.map(map["edges"], &AIHubVoiceModelBackupUrlsEdge.from_map(&1))
#     %AIHubVoiceModelBackupUrlsConnection{edges: edges}
#   end

#   def to_map(%AIHubVoiceModelBackupUrlsConnection{edges: edges}) do
#     %{"edges" => Enum.map(edges, &AIHubVoiceModelBackupUrlsEdge.to_map(&1))}
#   end
# end

# defmodule VoiceModelProfile do
#   defstruct [:accent, :confidence, :fictional, :gender, :id,
#              :model_trained_on_english_probability, :name,
#              :native_language, :relevant_tags, :voice_model_id]

#   def from_map(map) do
#     %VoiceModelProfile{
#       accent: map["accent"],
#       confidence: map["confidence"],
#       fictional: map["fictional"],
#       gender: map["gender"],
#       id: map["id"],
#       model_trained_on_english_probability: map["modelTrainedOnEnglishProbability"],
#       name: map["name"],
#       native_language: map["nativeLanguage"],
#       relevant_tags: map["relevantTags"],
#       voice_model_id: map["voiceModelId"]
#     }
#   end

#   def to_map(%VoiceModelProfile{} = profile) do
#     Map.from_struct(profile)
#   end
# end

# defmodule AIHubVoiceModel do
#   defstruct [:download_count, :filename, :name, :checksum_md5_for_weights,
#              :inferred_profile, :backup_urls]

#   def from_map(map) do
#     %AIHubVoiceModel{
#       download_count: map["downloadCount"],
#       filename: map["filename"],
#       name: map["name"],
#       checksum_md5_for_weights: map["checksumMD5ForWeights"],
#       inferred_profile: map["inferredProfile"] |> VoiceModelProfile.from_map(),
#       backup_urls: map["backupUrls"] |> AIHubVoiceModelBackupUrlsConnection.from_map()
#     }
#   end

#   def to_map(%AIHubVoiceModel{} = model) do
#     Map.from_struct(model)
#   end
# end

# defmodule AIHubVoiceModelsEdge do
#   defstruct node: %AIHubVoiceModel{}

#   def from_map(map) do
#     %AIHubVoiceModelsEdge{
#       node: AIHubVoiceModel.from_map(map["node"])
#     }
#   end

#   def to_map(%AIHubVoiceModelsEdge{node: node}) do
#     %{"node" => AIHubVoiceModel.to_map(node)}
#   end
# end
