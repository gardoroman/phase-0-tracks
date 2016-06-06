# Status Codes

## General Status Codes
* 1xx: Informational
* 2xx: Success
* 3xx: Redirection
* 4xx: Client Error
* 5xx: Server Erro

## Specific Status Codes

* 100: Continue
* 200: OK
* 204: No Content
* 300: Multiple Choices
* 302: Found
* 404: Not Found

## A Few Differences Between *GET* and *POST*

### GET
* Is used to retrieve resources from a web server. 
* A GET request should have no side effects.
* GET requests are visible in the URL and therefore can make sensitive data public.

### POST 
* Requests that the web server accept the information that is being sent. 
* A POST request may have side effects.
* Data in a POST request is not visible in the URL but is still visible in the body of the request.


## Uses for GET and POST
A GET request might be used to request a web page. A POST request might be used to submit a a form or update a status on a social media service.

## HTTP Cookie
A cookie is data sent from a web server to a client's web browser can perform several functions such as recording a user's previous interaction with that website, assist in verifying the identify of the user for security purposes.

## Cookies and HTTP Requests
When receiving a request, a web server can specify a cookie by sending a *Set-Cookie* header in the response. From then on, the cookie value is sent to the server with every request in the *Cookie* header.