---
title: Qoolife API V1 Journal Entries Creation
---

# Journal Entries Creation

You can create a new journal entry for the authenticated user submitting its data to:

<pre>
POST /api/v1/journal_entries
</pre>

<dl>
	<dt>journal_entry[body]</dt>
	<dd>Text for the entry body</dd>
	<dt>journal_entry[date]</dt>
	<dd>Date for the entry</dd>
</dl>

Example request:

<pre class="console">
curl -u 'user@example.com:sekret' -X POST -d "journal_entry[body]=a private entry for October 5th 15:35;journal_entry[date]=2012-10-05T15:35;journal_entry[private]=1" https://qoolife.com/api/v1/journal_entries
</pre>

Response:

<pre>
HTTP/1.1 201 Created

{
  "journal_entry":
    {
      "id":609,
      "user_id":1,
      "author_id":1,
      "body":"a private entry for October 5th 15:35",
      "date":"2012-10-05T15:35:00+02:00",
      "created_at":"2012-03-18T10:40:30+01:00",
      "updated_at":"2012-03-18T10:40:30+01:00",
      "measurements": []
    }
}
</pre>

## Measurements

You can add measurements to the journal entry by nesting the measurement attributes like this:

<pre class="console">
curl -u 'user@example.com:sekret' -X POST -d "journal_entry[body]=a private entry for October 5th 15:35;journal_entry[date]=2012-10-05T15:35;journal_entry[measurements_attributes][0][value]=80;journal_entry[measurements_attributes][0][variable_id]=1;" http://localhost:3000/api/v1/journal_entries
</pre>

Response:

<pre>
HTTP/1.1 201 Created

{
  "journal_entry":
    {
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
    }
}
</pre>

Notes:

* That at the moment you need to know the variable_id in advance. Use 1 (Weight) for testing purposes.
* Variable_type can take the following values: 'float', 'boolean', 'text', 'likert', 'file'.
