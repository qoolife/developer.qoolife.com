---
title: Qoolife API V1 Conversations Posting (replying)
---

# Replying to a Conversation

You can reply to an existing conversation submitting its data to:

<pre>
POST /api/v1/conversations/1/posts
</pre>

<dl>
	<dt>post[body]</dt>
	<dd>I say your message</dd>
</dl>

The response will be a JSON response containing the conversation and including an array of posts for each individual conversation, including the posted one, and an array of conversation watchers.


Example request:

<pre class="console">
curl -u 'user@example.com:sekret' -X POST -d "post[body]=I say your message" https://qoolife.com/api/v1/conversations/1/posts
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
      },
      {
        "id": 2,
        "user_id": 2,
        "conversation_id": 1,
        "body": "I saw your message",
        "created_at":"2012-03-18T10:40:30+01:00",
        "updated_at":"2012-03-18T10:40:30+01:00"
      }
      ]
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
