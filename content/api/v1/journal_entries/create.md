---
title: Qoolife API V1 Journal Entries Creation
---

# Journal Entries Creation

You can create a new journal entry for the authenticated user submitting its data to:

    POST /api/v1/journal_entries

<dl>
	<dt>
	  <code>
	    journal_entry[body]
	  </code>
	  </dt>
	<dd>Text for the entry body</dd>
	<dt>
	  <code>
	    journal_entry[date]
	  </code>
	</dt>
	<dd>Date for the entry</dd>
</dl>

Example request:

    curl -u 'user@example.com:sekret' -X POST -d 'journal_entry[body]=a private entry for October 5th 15:35;journal_entry[date]=2012-10-05T15:35;journal_entry[private]=1' https://qoolife.com/api/v1/journal_entries

Response:

    HTTP/1.1 201 Created

    {
      'journal_entry':
        {
          'id':609,
          'user_id':1,
          'author_id':1,
          'body':'a private entry for October 5th 15:35',
          'date':'2012-10-05T15:35:00+02:00',
          'created_at':'2012-03-18T10:40:30+01:00',
          'updated_at':'2012-03-18T10:40:30+01:00',
          'measurements': []
        }
    }

# Measurements and Questionnaires

You can add measurements to the journal entry, according to variables the user chooses to track, or to variable sets (Questionnaires) the user is assigned to fill in.

See more about this in the (Measurements section)[/journal_entries/measurements] and (Questionnaires section)[/journal_entries/measurements#questionnaires]
