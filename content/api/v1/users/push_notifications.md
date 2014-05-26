---
title: Qoolife API V1 User Notifications
---

# Device registration - ACS tokens

Users (or Apps) can register their devices in Qoolife to receive Push Notifications. This section is particularly designed for Appcelerator ACS Push Notifications. There are basically to actions available: register and destroy a device through a ACS token:

    POST /api/v1/pushable_devices
    DELETE /api/v1/pushable_devices/<token>

Example request (*create*):

    curl -v -u 'user@example.com:sekret' -X POST -d 'pushable_device[token]=AAABBBCCCZZZ' https://qoolife.com/api/v1/pushable_devices

Response:

    HTTP/1.1 201 OK

    {
      'token':AAABBBCCCZZZ,
      'created_at': "2014-05-26T19:50:51+02:00',
      'updated_at":"2014-05-26T19:50:51+02:00'
    }

Example request (*delete*):

    curl -v -u 'user@example.com:sekret' -X DELETE https://qoolife.com/api/v1/pushable_devices/AAABBBCCCZZZ

Response:

    HTTP/1.1 204 OK

    {}

# Checking pending use's push notifications

This notifications represent the pending of Questionnaires and Conversations for
a given user at a given point of time. "Pending" means *unread* or *to fill in*
depending the case.

This actions are specifically designed for PUSH notifications within an App.

    GET /api/v1/push_notifications/questionnaires
    GET /api/v1/push_notifications/conversations

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/push_notifications/questionnaires

Response:

    HTTP/1.1 200 OK

    {
      'count':13
    }
