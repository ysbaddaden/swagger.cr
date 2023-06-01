class Swagger
  class PathItem
    include JSON::Serializable
    include YAML::Serializable

    @[JSON::Field(key: "$ref")]
    @[YAML::Field(key: "$ref")]
    property ref : String?
    property get : Operation?
    property put : Operation?
    property post : Operation?
    property delete : Operation?
    property options : Operation?
    property head : Operation?
    property patch : Operation?
    property parameters : Array(Parameter)?
  end
end
