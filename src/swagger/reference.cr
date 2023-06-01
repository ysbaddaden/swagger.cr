class Swagger
  class Reference
    include JSON::Serializable
    include YAML::Serializable

    @[JSON::Field(key: "$ref")]
    @[YAML::Field(key: "$ref")]
    property ref : String
  end
end
