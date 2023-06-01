class Swagger
  class Operation
    include JSON::Serializable
    include YAML::Serializable

    property tags : Array(String)?
    property summary : String?
    property description : String?
    property operationId : String?
    property consumes : Array(String)?
    property produces : Array(String)?
    property parameters : Array(Parameter)?
    property responses : Hash(String, Response)
    property schemes : Array(String)?
    property deprecated : Bool = false
    # property security : Array(SecurityRequirement)?
  end
end
