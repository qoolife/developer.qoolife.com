---
title: Qoolife API V1 Conversations Listing
---

# Conversations Listing

You can get all conversations for the authenticated user from:

<pre>
GET /api/v1/conversations
</pre>

The response will be a JSON array with all the conversations for the user, including an array of posts for each individual conversation.

Example request:

<pre class="console">
curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/conversations
</pre>

Response:

<pre>
HTTP/1.1 200 OK

[
  { "conversations":
    {
      "id":1,
      "user_id":1,
      "title":"Id autem",
      "created_at":"2011-07-19T09:41:47+02:00",
      "updated_at":"2011-11-30T16:48:24+01:00",
  		"watchers": [
  			{
  				"id":1,
  			  "first_name":"Robb",
  			  "last_name":"Murtin"
  			},
  			{
  				"id":2,
  			  "first_name":"Mutt",
  			  "last_name":"Robbin"
  			}
  		],
      "posts": [
        {
  				"id":1,
  				"user_id":1,
          "conversation_id":1,
          "body":"Lorem Ipsum",
          "created_at":"2011-07-19T09:41:47+02:00",
          "updated_at":"2011-11-30T16:48:24+01:00"
        },
        {
  				"id":2,
  				"user_id":2,
          "conversation_id":1,
          "body":"Mamet rosam",
          "created_at":"2011-07-19T09:41:47+02:00",
          "updated_at":"2011-11-30T16:48:24+01:00"
        }
      ]
    }
  }
]
</pre>
