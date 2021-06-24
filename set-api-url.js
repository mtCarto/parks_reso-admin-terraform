function handler(event) {
  var request = event.request;
  var headers = request.headers;

  // Set the cache-control header
  headers['api-url'] = {value: 'https://pkqlwkdzka.execute-api.ca-central-1.amazonaws.com/dev'};

  // Return response to viewers
  return request;
}