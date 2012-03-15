---
title: Qoolife API V1 Hello
---

# Hello

A simple test to check you're making the requests properly is querying this:

    GET /api/v1/hello

If you don't authenticate, it will return:

    {:hello => 'world'}

If you do authenticate, it will return:

    {:hello => 'username'}
