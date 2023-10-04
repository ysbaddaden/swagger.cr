require "json"
require "yaml"
require "./swagger/*"

class Swagger
  include JSON::Serializable
  include YAML::Serializable

  def self.from_file(path : Path | String)
    case File.extname(path).downcase
    when ".json"
      File.open(path, "r") { |io| from_json(io) }
    when ".yml", ".yaml"
      File.open(path, "r") { |io| from_yaml(io) }
    else
      raise "fatal: unknown file type at #{path.inspect}"
    end
  end

  property swagger : String
  property basePath : String
  property info : Info
  property tags : Array(Tag)?
  property consumes : Array(String)?
  property produces : Array(String)?
  property definitions : Hash(String, Schema) = {} of String => Schema
  property parameters : Hash(String, Parameter) = {} of String => Parameter
  property responses : Hash(String, Response) = {} of String => Response
  # property securityDefinitions : Hash(String, SecurityScheme)
  property paths : Hash(String, PathItem)

  def find(ref : String) : Schema | Parameter | Response
    find?(ref) || raise "No ref found for #{ref}"
  end

  def find?(ref : String) : Schema | Parameter | Response | Nil
    if ref =~ %r{^#/(.+?)/(.+?)$}
      case $1
      when "definitions"
        definitions[$2]?
      when "parameters"
        parameters[$2]?
      when "responses"
        responses[$2]?
      end
    end
  end
end
