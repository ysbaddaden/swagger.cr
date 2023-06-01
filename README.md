# Swagger parsers

Parse Swagger (OpenAPI 2.0) files as YAML or JSON.

Example:

```crystal
require "swagger"
document = Swagger.from_file("docker/v1.41.yaml")
```

## References

- <https://swagger.io/specification/v2>
- <https://github.com/OAI/OpenAPI-Specification/blob/main/versions/2.0.md>

## License

Distributed under the MIT license.
