class Swagger
  class Parameter
    include JSON::Serializable
    include YAML::Serializable

    property name : String
    property in : String
    property description : String?
    property required : Bool = false

    property! schema : Schema # in=body

    property! type : String? # string number integer boolean array file
    property format : String?
    property! items : Array(String) | Schema
    property allowEmptyValue : Bool = false
    property! collectionFormat : String?
    property enum : Array(String)?
    property! default : Bool | Int64 | String

    {% for value in %w[query header path formData body] %}
      def {{value.id}}? : Bool
        @in == {{value}}
      end
    {% end %}

    def required? : Bool
      path? || @required
    end
  end
end
