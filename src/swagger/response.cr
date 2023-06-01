class Swagger
  class Response
    include JSON::Serializable
    include YAML::Serializable

    property! description : String
    property! schema : Schema
    property! headers : Hash(String, Header)
  end
end
