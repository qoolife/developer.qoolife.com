---
title: Qoolife API V1 Showing a Conversation
---

# Show a Conversation

You can get show a particular conversation for the authenticated user using:

<pre>
GET /api/v1/conversations/1
</pre>

The response will be a JSON response containing the conversation and including an array of posts for each individual conversation and an array of conversation watchers.

The conversation will be automatically marked as viewed by the logged user when shown.

Example request:

<pre class="console">
curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/conversations/1
</pre>

Response:

<pre>
HTTP/1.1 200 OK

{
  "conversation":
    {
      "id":1,
      "user_id":2,
      "title":"a title",
      "date":"2012-10-05T15:35:00+02:00",
      "created_at":"2012-03-18T10:40:30+01:00",
      "updated_at":"2012-03-18T10:40:30+01:00",
			"type_human":"private message",
			"status":"resolved",
			"new":"false",
			"last_viewed_at":"2013-01-18T10:40:30+01:00",
      "posts": [{
        "id": 1,
        "user_id": 1,
        "conversation_id": 1,
        "body": "Wow folks whats app",
        "created_at":"2012-03-18T10:40:30+01:00",
        "updated_at":"2012-03-18T10:40:30+01:00"
      }]
      "watchers": [{
        "id": 1,
        "name": Pancho,
        "slug": pancho,
        "created_at":"2012-03-18T10:40:30+01:00",
        "updated_at":"2012-03-18T10:40:30+01:00"
      },
      {
        "id": 2,
        "name": Pincho,
        "slug": pincho,
        "created_at":"2012-03-18T10:40:30+01:00",
        "updated_at":"2012-03-18T10:40:30+01:00"
      }]
    }
}
</pre>
