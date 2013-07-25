---
title: Qoolife API V1 Journal Entries Update
---

# Updating Journal Entries

You can update a present journal entry that the authenticated user is able to update (own or permissions granted by the journal owner). For this you can use this API call:

<pre>
PUT /api/v1/journal_entry/609
</pre>

<dl>
	<dt>journal_entry[id]</dt>
	<dd>entry's ID to be updated</dd>
	<dt>journal_entry[body]</dt>
	<dd>New text for the entry body</dd>
	<dt>journal_entry[date]</dt>
	<dd>Date for the entry can be updated</dd>
	<dt>journal_entry[measurements_attributes]</dt>
	<dd>Array containing the measurement attributes. Identify different measurements by *id*</dd>
	<dl>
  	<dt>journal_entry[measurements_attributes][1][value]</dt>
  	<dd>Value of the measurement to update</dd>
	</dl>
</dl>

Notes: the measurement's variable_id cannot be updated.

You can update journal entries and measurements using this API call:

<pre class="console">
curl -u 'user@example.com:sekret' -X PUT -d "journal_entry[id]=609;journal_entry[body]=this is my new comments;journal_entry[date]=2010-10-05T15:35;journal_entry[measurements_attributes][10][value]=120;" http://localhost:3000/api/v1/journal_entry/609
</pre>

Response:

<pre>
HTTP/1.1 200 Accepted

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
    			"id":8305,
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
</pre>

Note that at the moment you need to know the variable_id in advance. Use 1 (Weight) for testing purposes.
