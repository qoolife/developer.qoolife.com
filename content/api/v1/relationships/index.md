---
title: Qoolife API V1 Listing relationships
---

# Listing contacts

You can get all contact relationships for the authenticated user using:

    GET /api/v1/relationships

The response will be a JSON array with all the contact relationships for the authenticated user, including the contact User attributes nested to the relationship.

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/relationships

Response:

    HTTP/1.1 200 OK

    {
      "relationships":
       [{
          "id":1,
          "user_id":1,
          "contact_id":2,
          "type":"Relationships::PhysicianRelationship",
          "created_at":"2012-03-18T10:40:30+01:00",
          "updated_at":"2012-03-18T10:40:30+01:00",
          "contact": {
            "id":2,
            "first_name":"Mutt",
            "last_name":"Robbin",
            "about_me":"Neither thin nor fat, neither rich nor poor. Common people.",
            "professional_roles":"",
            "avatar":"https://secure.gravatar.com/avatar/1422885fa18378ece1b688d22abd551f.jpg%3Fsize=48&d=https://qoolife.com/assets/icons/avatar-small.png",
            "slug":"mutt-robbin",
            "created_at":"2012-03-18T10:40:30+01:00",
            "updated_at":"2012-03-18T10:40:30+01:00"
          }
        },
        {
          "id":2,
          "user_id":1,
          "contact_id":3,
          "type":"Relationships::FriendRelationship",
          "created_at":"2012-03-18T10:40:30+01:00",
          "updated_at":"2012-03-18T10:40:30+01:00",
          "contact": {
            "id":3,
            "first_name":"Groove",
            "last_name":"Morrins",
            "about_me":"Your contact",
            "professional_roles":"",
            "avatar":"https://secure.gravatar.com/avatar/1422885fa18378ece1b688d22abd551f.jpg%3Fsize=48&d=https://qoolife.com/assets/icons/avatar-small.png",
            "slug":"groove-morrins",
            "created_at":"2012-03-18T10:40:30+01:00",
            "updated_at":"2012-03-18T10:40:30+01:00"
          }
        }
      ]
    }