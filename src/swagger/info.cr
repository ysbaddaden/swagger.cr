class Swagger
  class Info
    include JSON::Serializable
    include YAML::Serializable

    property title : String
    property version : String?
    property description : String?
  end
end
