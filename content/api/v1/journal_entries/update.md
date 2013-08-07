---
title: Qoolife API V1 Journal Entries Update
---

# Updating Journal Entries

You can update a present journal entry that the authenticated user is able to update (own or permissions granted by the journal owner). For this you can use this API call:

    PUT /api/v1/journal_entries/609

<dl>
  <dt>journal_entry[id]</dt>
  <dd>entry's ID to be updated</dd>
  <dt>journal_entry[body]</dt>
  <dd>New text for the entry body</dd>
  <dt>journal_entry[date]</dt>
  <dd>Date for the entry can be updated</dd>
  <dt>journal_entry[measurements_attributes]</dt>
  <dd>Array containing the measurement attributes.</dd>
  <dl>
    <dt>journal_entry[measurements_attributes][0][id]</dt>
    <dd>Id of the measurement to update</dd>
    <dt>journal_entry[measurements_attributes][0][value]</dt>
    <dd>Value of the measurement to update</dd>
    <dt>journal_entry[measurements_attributes][0][variable_id]</dt>
    <dd>Value of the measurement</dd>
    ...
    <dt>journal_entry[measurements_attributes][1][id]</dt>
    <dd>Id of the second measurement</dd>
  </dl>
</dl>

Notes:

* Measurement's *id* and *variable_id* cannot be updated but are mandatory.
* Every Measurement already in the Journal Entry must be provided, regardless if updated or not. Any Measurement not listed will be deleted (**important**).

You can update journal entries and measurements using this API call:

    curl -u 'user@example.com:sekret' -X PUT -d "journal_entry[id]=609;journal_entry[body]=this is my new comments;journal_entry[date]=2010-10-05T15:35;ournal_entry[measurements_attributes][0][id]=11122;journal_entry[measurements_attributes][0][value]=120;journal_entry[measurements_attributes][0][variable_id]=1;" http://localhost:3000/api/v1/journal_entries/609


Response:

    HTTP/1.1 200 OK

    {
      "journal_entry":
        {
          "id":609,
          "user_id":1,
          "author_id":1,
          "body":"this is my new comments",
          "date":"2010-10-05T15:35:00+02:00",
          "created_at":"2012-03-18T10:40:30+01:00",
          "updated_at":"2013-03-18T10:40:30+01:00",
          "measurements":
            [{
              "id":11122,
              "journal_entry_id":609,
              "user_id":1,
              "int_value":null,
              "float_value":120.0,
              "text_value":"120",
              "variable_id":1,
              "variable_type":"float",
              "name":"Peso",
              "created_at":"2013-04-19T13:32:42+02:00",
              "updated_at":"2013-04-19T13:32:42+02:00"
            }]
        }
    }

Note that at the moment you need to know the variable_id in advance. Use 1 (Weight) for testing purposes.
