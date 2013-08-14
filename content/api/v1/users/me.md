---
title: Qoolife API V1 Users Profile
---

# User info

You can get the profile for the authenticated user from

    GET /api/v1/users/me

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/users/me

Response:

    HTTP/1.1 200 OK

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
    }
