---
title: Qoolife API V1 Conversations Listing
---

# Conversations Listing

You can get all conversations for the authenticated user from:

    GET /api/v1/conversations

The response will be a JSON array with all the conversations for the user, including an array of posts for each individual conversation.

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/conversations

Response:

    HTTP/1.1 200 OK

    { 'conversations':
      {
        'id':1,
        'user_id':1,
        'title':'Id autem',
        'created_at':'2011-07-19T09:41:47+02:00',
        'updated_at':'2011-11-30T16:48:24+01:00',
        'type_human':'private message',
        'status':'resolved',
        'unread':'false',
        'last_viewed_at':'2011-11-30T16:48:24+01:00',
        'watchers': [
          {
            'id':1,
            'first_name':'Robb',
            'last_name':'Murtin',
            'about_me':'Neither thin nor fat, neither rich nor poor. Common people.',
            'professional_roles':'Médico',
            'avatar':'https://secure.gravatar.com/avatar/1422885fa18378ece1b688d22abd551f.jpg%3Fsize=48&d=https://qoolife.com/assets/icons/avatar-small.png',
            'slug':'robb-murtin',
            'created_at':'2012-03-18T10:40:30+01:00',
            'updated_at':'2012-03-18T10:40:30+01:00'
          },
          {
            'id':2,
            'first_name':'Mutt',
            'last_name':'Robbin',
            'about_me':'Neither thin nor fat, neither rich nor poor. Common people.',
            'professional_roles':'',
            'avatar':'https://secure.gravatar.com/avatar/1422885fa18378ece1b688d22abd551f.jpg%3Fsize=48&d=https://qoolife.com/assets/icons/avatar-small.png',
            'slug':'mutt-robbin',
            'created_at':'2012-03-18T10:40:30+01:00',
            'updated_at':'2012-03-18T10:40:30+01:00'
          }
        ],
        'posts': [
          {
            'id':1,
            'user_id':1,
            'conversation_id':1,
            'body':'Lorem Ipsum',
            'created_at':'2011-07-19T09:41:47+02:00',
            'updated_at':'2011-11-30T16:48:24+01:00',
            'attachment':null
          },
          {
            'id':2,
            'user_id':2,
            'conversation_id':1,
            'body':'Mamet rosam',
            'created_at':'2011-07-19T09:41:47+02:00',
            'updated_at':'2011-11-30T16:48:24+01:00',
            'attachment':null
          }
        ]
      }
    }


The response can be filtered by posted date using the ```posted_after``` param and providing a datetime timestamp:

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/conversations?posted_after=1378917499

will return conversations posted after 11st of september of 2013 (1378917499 seconds since epoch or ``Time.at(1378917499)`` if you prefer the Ruby style)