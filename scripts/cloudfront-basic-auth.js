// CloudFront Function: Basic Auth (viewer-request)
// Credentials: stabbot:changeme
function handler(event) {
  var request = event.request;
  var headers = request.headers;

  var expected = 'Basic c3RhYmJvdDpjaGFuZ2VtZQ==';

  if (
    typeof headers.authorization === 'undefined' ||
    headers.authorization.value !== expected
  ) {
    return {
      statusCode: 401,
      statusDescription: 'Unauthorized',
      headers: {
        'www-authenticate': { value: 'Basic realm="bittikens.com"' },
        'content-type': { value: 'text/plain' },
      },
      body: 'Unauthorized',
    };
  }

  return request;
}
