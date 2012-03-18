---
title: Qoolife API V1 Users Login
---

# User info

You can get all info for the authenticated user from

<pre>
GET /api/v1/users/login
</pre>

Example request:

<pre class="console">
curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/users/login
</pre>

Response:

<pre>
HTTP/1.1 200 OK

{
  "id":1,
  "email":"user@example.com",
  "first_name":"First Name",
  "last_name":"Last Name"
}
</pre>
