class Swagger
  class Tag
    include JSON::Serializable
    include YAML::Serializable

    property name : String
    property description : String?
  end
end
