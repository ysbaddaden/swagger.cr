class Swagger
  class Header
    include JSON::Serializable
    include YAML::Serializable

    property description : String?
    property type : String # string number integer boolean array
    property format : String?
    property! items : String
    property collectionFormat : String?
    property enum : Array(String)?
  end
end
