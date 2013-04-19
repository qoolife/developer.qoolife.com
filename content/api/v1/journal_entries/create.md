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
	<dt>journal_entry[private]</dt>
	<dd>Boolean value to indicate if the entry will be marked as private. Can be 1 (true) or 0 (false). By default, it's false so you only need to include this param if you want to set it to true.</dd>
</dl>

Currently the API does not support creating measurements for the entries.

Example request:

<pre class="console">
curl -u 'user@example.com:sekret' -X POST -d "journal_entry[body]=a private entry for October 5th 15:35;journal_entry[date]=2012-10-05T15:35;journal_entry[private]=1" https://qoolife.com/api/v1/journal_entries
</pre>

Response:

<pre>
HTTP/1.1 201 Created

{
  "id":609,
  "user_id":1,
  "author_id":1,
  "body":"a private entry for October 5th 15:35",
  "body_html":"&lt;p&gt;a private entry for October 5th 15:35&lt;/p&gt;",
  "private":true,
  "date":"2012-10-05T15:35:00+02:00",
  "created_at":"2012-03-18T10:40:30+01:00",
  "updated_at":"2012-03-18T10:40:30+01:00",
  "comments_count":0,
  "measurements":[]
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
  "id":609,
  "user_id":1,
  "author_id":1,
  "body":"a private entry for October 5th 15:35",
  "body_html":"&lt;p&gt;a private entry for October 5th 15:35&lt;/p&gt;",
  "private":true,
  "date":"2012-10-05T15:35:00+02:00",
  "created_at":"2012-03-18T10:40:30+01:00",
  "updated_at":"2012-03-18T10:40:30+01:00",
  "comments_count":0,
  "measurements":
		[{
			"created_at":"2013-04-19T13:32:42+02:00",
			"date":"2012-10-05T15:35:00+02:00",
			"float_value":80.0,
			"id":8305,
			"int_value":null,
			"journal_entry_id":609,
			"questionnaire_response_id":null,
			"text_value":"80",
			"updated_at":"2013-04-19T13:32:42+02:00",
			"user_id":1,
			"variable_id":1
		}]
	}
}
</pre>

Note that at the moment you need to know the variable_id in advance. Use 1 (Weight) for testing purposes.

