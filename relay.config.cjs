module.exports = {
  src: "./src",
  schema: "./schema.graphql",
  artifactDirectory: "./src/__generated__",
  customScalarTypes: {
    DateTime: "DateTime",
    URI: "string",
  },
};
