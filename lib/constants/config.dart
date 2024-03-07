class Config {
  static const GIT_REST_BASE_URL = String.fromEnvironment('GIT_REST_BASE_URL',
      defaultValue: 'https://api.github.com');

  static const GIT_GRAPHQL_BASE_URL = String.fromEnvironment(
      'GIT_GRAPHQL_BASE_URL',
      defaultValue: 'https://api.github.com/graphql');

  /// HERE IT IS => YOUR TURN TO PLACE THIS THING HERE
  static const GIT_TOKEN =
      String.fromEnvironment('GIT_TOKEN', defaultValue: "***");

  static const HTTP_CONNECTION_TIMEOUT_MS = String.fromEnvironment(
      "HTTP_CONNECTION_TIMEOUT_MS",
      defaultValue: "150000");

  static const HTTP_READ_TIMEOUT_MS =
      String.fromEnvironment("HTTP_READ_TIMEOUT_MS", defaultValue: "150000");

  static const HTTP_WRITE_TIMEOUT_MS =
      String.fromEnvironment("HTTP_WRITE_TIMEOUT_MS", defaultValue: "150000");
}
