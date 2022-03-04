class BackgroundsSerializer
  include JSONAPI::Serializer
  attributes :id, :photographer, :url, :alt
end
