---
title: Qoolife API V1 Journal Entries Listing
---

# Journal Entries Listing

You can get all journal entries for the authenticated user from:

<pre>
GET /api/v1/journal_entries
</pre>

The response will be a JSON array with all the journal entries for the user, including an array of measurements for each individual entry.

Example request:

<pre class="console">
curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/journal_entries
</pre>

Response:

<pre>
HTTP/1.1 200 OK

[
  {
    "id":202,
    "author_id":1,
    "user_id":1,
    "body":"Id autem",
    "body_html":"&lt;p&gt;Id autem&lt;/p&gt;",
    "comments_count":0,
    "private":false,
    "date":"2011-07-18T09:41:00+02:00",
    "created_at":"2011-07-19T09:41:47+02:00",
    "updated_at":"2011-11-30T16:48:24+01:00",
    "measurements":[
      {
        "created_at":"2011-07-19T09:41:47+02:00",
        "date":"2011-07-18T09:41:00+02:00",
        "float_value":68.0,
        "id":99,
        "int_value":null,
        "journal_entry_id":202,
        "text_value":"68.0",
        "updated_at":"2011-11-30T16:48:24+01:00",
        "user_id":1,
        "variable_id":1,
				"variable_name":"weight"
      },
      {
        "created_at":"2011-07-19T09:41:47+02:00",
        "date":"2011-07-18T09:41:00+02:00",
        "float_value":null,
        "id":100,
        "int_value":0,
        "journal_entry_id":202,
        "text_value":null,
        "updated_at":"2011-09-05T20:56:09+02:00",
        "user_id":1,
        "variable_id":3,
				"variable_name":"height"
      }
    ]
  }
]
</pre>
