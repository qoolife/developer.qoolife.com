---
title: Qoolife API V1 Conversations Creation
---

# Conversations Creation

You can create a conversation entry within the authenticated user and the recipient submitting its data to:

<pre>
POST /api/v1/conversations
</pre>

<dl>
	<dt>conversation[title]</dt>
	<dd>Title for the message</dd>
	<dt>conversation[first_post_body]</dt>
	<dd>Body of the message to send</dd>
	<dt>conversation[user_id]</dt>
	<dd>id for the recipient User to start the conversation with</dd>
</dl>

The response will be a JSON response containing the conversation and including an array of posts for each individual conversation and an array of conversation watchers.


Example request:

<pre class="console">
curl -u 'user@example.com:sekret' -X POST -d "conversation[title]=a title;conversation[first_post_body]=Wow folks whats app;conversation[user_id]=2" https://qoolife.com/api/v1/conversations
</pre>

Response:

<pre>
HTTP/1.1 201 Created

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
