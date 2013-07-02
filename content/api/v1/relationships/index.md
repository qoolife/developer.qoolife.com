---
title: Qoolife API V1 Listing relationships
---

# Listing contacts

You can get all contact relationships for the authenticated user using:

<pre>
GET /api/v1/relationships
</pre>

The response will be a JSON array with all the contact relationships for the authenticated user, including the contact User attributes nested to the relationship.

Example request:

<pre class="console">
curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/relationships
</pre>

Response:

<pre>
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
        "id": 2,
        "name": "Pancho",
        "slug": "pancho",
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
        "id": 3,
        "name": "Juancho",
        "slug": "juancho",
        "created_at":"2012-03-18T10:40:30+01:00",
        "updated_at":"2012-03-18T10:40:30+01:00"
      }
    }
  ]
}
</pre>
