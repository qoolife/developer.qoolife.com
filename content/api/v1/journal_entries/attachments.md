---
title: Qoolife API V1 Journal Entry Attachments
---

# Uploading a file as an attachment

You can attach a file as an attachment to any JournalEntry's Measurement of type File. The file should be uploaded using ```multipart/form-data Content-Type```.

If you want to upload a file while creating the conversation, you only need to provide the file as the ```measurement``` param:

<pre class="console">
curl -u 'user@example.com:sekret' -F "journal_entry[body]=a private entry for October 5th 15:35" -F "journal_entry[date]=2012-10-05T15:35" -F "journal_entry[measurements_attributes][0][variable_id]=100" -F "journal_entry[measurements_attributes][0][value]=@myfile" https://qoolife.com/api/v1/journal_entries
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
    			"float_value":null,
    			"text_value":"null,
    			"variable_id":100,
					"name":"Archivo",
    			"created_at":"2013-04-19T13:32:42+02:00",
    			"updated_at":"2013-04-19T13:32:42+02:00"
    		}]
    }
}
</pre>

Note that at the moment you need to know the variable_id in advance. Use 100 (File) for testing purposes.
