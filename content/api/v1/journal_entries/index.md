---
title: Qoolife API V1 Journal Entries Listing
---

# Journal Entries Listing

You can get all journal entries for the authenticated user from:

    GET /api/v1/journal_entries

The response will be a JSON array with all the journal entries for the user, including an array of measurements for each individual entry.

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/journal_entries

Response:

    HTTP/1.1 200 OK

    {
      "journal_entries":
       [{
          "id":609,
          "user_id":1,
          "author_id":1,
          "body":"a private entry for October 5th 15:35",
          "date":"2012-10-05T15:35:00+02:00",
          "created_at":"2012-03-18T10:40:30+01:00",
          "updated_at":"2012-03-18T10:40:30+01:00",
          "measurements":
            [{
              "id":8305,
              "journal_entry_id":609,
              "user_id":1,
              "int_value":null,
              "float_value":80.0,
              "text_value":"80",
              "variable_id":1,
              "variable_type":"float",
              "name":"Peso",
              "created_at":"2013-04-19T13:32:42+02:00",
              "updated_at":"2013-04-19T13:32:42+02:00"
            }]
        },
        {
          "id":610,
          "user_id":1,
          "author_id":1,
          "body":"a private entry for October 6th 16:36",
          "date":"2012-10-05T15:35:00+02:00",
          "created_at":"2012-03-18T10:40:30+01:00",
          "updated_at":"2012-03-18T10:40:30+01:00",
          "measurements": []
        }
      ]
    }