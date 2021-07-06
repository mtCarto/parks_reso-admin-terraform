function handler(event) {
  var response = event.response;
  var headers = response.headers;

  // todo have github actions use sed to set endpoint from env var
  headers['api-url'] = {value: 'api-endpoint-placeholder'};
  // response.headers = headers;
  return response;
}