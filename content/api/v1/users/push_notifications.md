---
title: Qoolife API V1 User Notifications
---

# User Push Notifications

This notifications represent the pending of Questionnaires and Conversations for
a given user at a given point of time. "Pending" means *unread* or *to fill in*
depending the case.

This actions are specifically designed for PUSH notifications within an App.

    GET /api/v1/users/push_notifications/questionnaires
    GET /api/v1/users/push_notifications/conversations

Example request:

    curl -v -u 'user@example.com:sekret' https://qoolife.com/api/v1/users/push_notifications/questionnaires

Response:

    HTTP/1.1 200 OK

    {
      'count':13
    }
