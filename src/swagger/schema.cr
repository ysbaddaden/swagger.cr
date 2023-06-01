class Swagger
  class Schema
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    include YAML::Serializable
    include YAML::Serializable::Unmapped

    @[YAML::Field(ignore: true)]
    @json_unmapped : Hash(String, JSON::Any)

    @[JSON::Field(ignore: true)]
    @yaml_unmapped : Hash(String, YAML::Any)

    @[JSON::Field(key: "$ref")]
    @[YAML::Field(key: "$ref")]
    property? ref : String?

    property title : String?
    property! type : String # String | Array(String)
    property format : String?
    property description : String?
    property? allOf : Array(Schema)?
    property! items : Array(String) | Schema
    property! properties : Hash(String, Schema)
    property required : Array(String)?
    property additionalProperties : Bool | Schema | Nil

    @[JSON::Field(key: "x-nullable")]
    @[YAML::Field(key: "x-nullable")]
    property? nullable : Bool = true

    def enum?
      (json_unmapped["enum"]? || yaml_unmapped["enum"]?).try(&.as_a?)
    end

    def enum
      (json_unmapped["enum"]? || yaml_unmapped["enum"]).as_a
    end
  end
end
