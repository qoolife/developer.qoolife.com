---
title: Qoolife API V1 Adding Measurements to Journal Entries
---

# <a id='measurements'></a> Measurements in Journal Entries

You can add measurements to the journal entry by nesting the measurement attributes like this:

    curl -u 'user@example.com:sekret' -X POST -d 'journal_entry[body]=a private entry for October 5th 15:35;journal_entry[date]=2012-10-05T15:35;journal_entry[measurements_attributes][0][value]=80;journal_entry[measurements_attributes][0][variable_id]=1;' http://localhost:3000/api/v1/journal_entries

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
          'measurements':
            [{
              'id':8305,
              'journal_entry_id':609,
              'user_id':1,
              'int_value':null,
              'float_value':80.0,
              'text_value':'80',
              'variable_id':1,
              'variable_type':'float',
              'name':'Peso',
              'created_at':'2013-04-19T13:32:42+02:00',
              'updated_at':'2013-04-19T13:32:42+02:00'
            }],
          'comments': []
        }
    }

Notes:

* That at the moment you need to know the variable_id in advance. Use 1 (Weight) for testing purposes.
* ``Variable_type`` can take the following values: ``float``, ``boolean``, ``text``, ``likert``, ``file``, ```date```, ```bmi```, ```edd``` and ```blood_pressure```. See (tracked variables section)[#tracked_variables] for more details on this.

# ¿Which variables to measure?

## <a id='tracked_variables'></a> Tracked variables

Tracked variables are variables that the user selected to track over time. Any number of this values can be measured with the corresponding Measurement, sent along with the JournalEntry data, under the attribute **measurements_attributes** (see (section above)[#measurements]).

Use this request to get the list of variables the logged user is currently tracking:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/variables

Response:

    HTTP/1.1 200 OK

    {
      'variables':
        [{
          'id':1,
          'name':'Weight',
          'variable_type':'float',
          'unit':'kg',
          'options':null,
          'description':null
        },
        {
          'id':2,
          'name':'How are you feeling today?',
          'variable_type':'likert',
          'unit':null,
          'options':{
            { 1:'Hell',
              2:'Not Bad',
              3:'Fine, thanks'
              4:'Gorgeous'
          },
          'description':null
        },
        {
          'id':3,
          'name':'Do you smoke?',
          'variable_type':'boolean',
          'unit':null,
          'options':null,
          'description':null
        },
        {
          'id':4,
          'name':'Tell me about your feelings today',
          'variable_type':'text',
          'unit':null,
          'options':null,
          'description':null
        },
        {
          'id':5,
          'name':'Date of last menstrual period',
          'variable_type':'date',
          'unit':null,
          'options':null,
          'description':null
        }
      ]
    }

# <a id='questionnaires'></a> Questionnaires

Questionnaires are sets of variables in a certain order, assigned by a Service or doctor to the patient. Questionnaires can be filled up using the JournalEntry create API entry, one by one or multiple Questionnaires at a time.

Use this request to list the Questionnaires assigned to the logged user.

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/questionnaires

Response:

    HTTP/1.1 200 OK

    {
      'questionnaires':
        [{
          'id':1,
          'name':'Control del riesgo cardiovascular',
          'assignment_id':1,
          'due_date':null,
          'service': {
            'id':525082,
            'name':'Clínica Qoolife',
            'logo':'https://s3-eu-west-1.amazonaws.com/qoolife-development-logos/525082-original-qoolife-no-text-60.png?1365761810'
          },
          'variables':
            [{
              'id':1,
              'name':'Weight',
              'variable_type':'float',
              'unit':'kg',
              'options':null,
              'description':null
            },
            {
              'id':2,
              'name':'How are you feeling today?',
              'variable_type':'likert',
              'unit':null,
              'options':{
                { 1:'Hell',
                  2:'Not Bad',
                  3:'Fine, thanks'
                  4:'Gorgeous'
              },
              'description':null
            }]
          },{
            'id':1,
            'name':'Control del riesgo cardiovascular - Diario',
            'assignment_id':1,
            'due_date':'2013-04-19T13:32:42+02:00',
            'service': { ... }
            'variables': [{ .... }]
          }
        ]
    }

## Writing a questionnaire within a Journal Entry

You can fill in a Questionnaire with a Questionnaire Response using the JournalEntry API endpoint:

You need to provide the following params structure:

    POST /api/v1/journal_entries

<dl>
  <dt>journal_entry[questionnaire_response_attributes]</dt>
  <dd>Array of questionnaire responses, each one for a different questionnaire</dd>
  <dt>journal_entry[questionnaire_response_attributes][0][questionnaire_id]</dt>
  <dd>Id of the Questionnaire to be answered</dd>
  <dt>journal_entry[questionnaire_response_attributes][0][assignment_id]</dt>
  <dd>Param needed to mark dated assignments as done. Get this ID from the Questionnaires index request</dd>
  <dt>journal_entry[questionnaire_response_attributes][0][measurements_attributes]</dt>
  <dd>Array of measurements (see Measurement section)</dd>
</dl>

Example request:

    curl -u 'user@example.com:sekret' -X POST -d 'journal_entry[body]=a text;journal_entry[date]=2012-10-05T15:35;journal_entry[questionnaire_responses_attributes][0][questionnaire_id]=1;journal_entry[questionnaire_responses_attributes][0][assignment_id]=13;journal_entry[questionnaire_responses_attributes][0][measurements_attributes][0][value]=80;journal_entry[questionnaire_responses_attributes][0][measurements_attributes][0][variable_id]=53;journal_entry[questionnaire_responses_attributes][0][measurements_attributes][1][value]=3;journal_entry[questionnaire_responses_attributes][0][measurements_attributes][0][variable_id]=123;' https://qoolife.com/api/v1/journal_entries

The response includes the measurements grouped under the *questionnaire_responses* attribute instead of the top-level *measurements*.

    HTTP/1.1 201 Created

    {
      'journal_entry':
        {
          'id':1,
          'user_id':1,
          'author_id':1,
          'body':'a private entry for October 5th 15:35',
          'date':'2012-10-05T15:35:00+02:00',
          'created_at':'2012-03-18T10:40:30+01:00',
          'updated_at':'2012-03-18T10:40:30+01:00',
          'measurements': [],
          'comments': [],
          'questionnaire_responses':
          [{
            'id':1,
            'questionnaire_id':1,
            'assignment_id':1,
            'responseable_id':1,
            'measurements':
              [{
                'id':1,
                'journal_entry_id':1,
                'user_id':1,
                'int_value':null,
                'float_value':80.0,
                'text_value':'80',
                'variable_id':1,
                'variable_type':'float',
                'name':'Weight',
                'created_at':'2013-04-19T13:32:42+02:00',
                'updated_at':'2013-04-19T13:32:42+02:00'
              },
              {
                'id':2,
                'journal_entry_id':1,
                'user_id':1,
                'int_value':3,
                'float_value':null,
                'text_value':'Fine, thanks',
                'variable_id':2,
                'variable_type':'likert',
                'name':'How are you feeling today?',
                'created_at':'2013-04-19T13:32:42+02:00',
                'updated_at':'2013-04-19T13:32:42+02:00'
              }
            ]
          }]
        }
    }
