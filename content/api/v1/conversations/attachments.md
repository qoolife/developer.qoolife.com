---
title: Qoolife API V1 Attachments
---

# Uploading a file as an attachment

You can attach a file as an attachment to any Post. The file should be uploaded using ```multipart/form-data Content-Type```.

## On conversation creation

If you want to upload a file while creating the conversation, you only need to provide the file using the param ``conversation[first_post_attachment_asset]``:

    POST /api/v1/conversations

<dl>
  <dt>conversation[title]</dt>
  <dd>Title for the message</dd>
  <dt>conversation[first_post_body]</dt>
  <dd>Body of the message to send</dd>
  <dt>conversation[user_id]</dt>
  <dd>id for the recipient User to start the conversation with</dd>

  <dt>conversation[first_post_attachment_asset]</dt>
  <dd>** encoded file **</dd>
</dl>

The response will be the same JSON response as when creating a Conversation, with the addition of the ``attachment`` attributes.

Example request:

    curl -u 'user@example.com:sekret' -F 'conversation[title]=a title' -F 'conversation[first_post_body]=Wow folks whats app' -F 'conversation[user_id]=1' -F 'conversation[first_post_attachment_asset]=@myfile' https://qoolife.com/api/v1/conversations

## On reply (new post)

<dl>
  <dt>post[body]</dt>
  <dd>Look at my pics :-P</dd>

  <dt>post[attachment_asset]</dt>
  <dd>** encoded file **</dd>
</dl>

Example request:

    curl -u 'user@example.com:sekret' -F 'post[body]=I say your message' -F 'post[attachment_asset]=@myfile' https://qoolife.com/api/v1/conversations/1/posts

The response will be the same JSON response as when creating a new Post, with the addition of the ``attachment`` attributes.

    HTTP/1.1 201 Created

    {
      'conversation':
        {
          'id':1,
          'user_id':2,
          'title':'a title',
          'date':'2012-10-05T15:35:00+02:00',
          'created_at':'2012-03-18T10:40:30+01:00',
          'updated_at':'2012-03-18T10:40:30+01:00',
          'type_human':'private message',
          'status':'resolved',
          'unread':'false',
          'last_viewed_at':'2011-11-30T16:48:24+01:00',
          'posts': [{
            'id': 1,
            'user_id': 1,
            'conversation_id': 1,
            'body': 'Wow folks whats app',
            'created_at':'2012-03-18T10:40:30+01:00',
            'updated_at':'2012-03-18T10:40:30+01:00',
            'attachment': {
              "id": 1,
              "asset_file_name": "example.jpg",
              "asset_content_type":"image/jpeg",
              "asset_file_size":1328944,
              "asset_updated_at":"2013-09-09T14:23:23+02:00",
              "download_url":"http://localhost:3000/api/v1/attachments/1/download"
            }
          },
          {
            'id': 2,
            'user_id': 2,
            'conversation_id': 1,
            'body': 'I saw your message',
            'created_at':'2012-03-18T10:40:30+01:00',
            'updated_at':'2012-03-18T10:40:30+01:00'
          }
          ]
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
          ]
        }
    }


# Downloading an attachment

Attachments are included in the json response as another nested attribute, if present.

The response will be either the final (Amazon S3) attachment url in JSON format, or the file itself, depending if the request ``send_file`` attribute is set:

    curl -u 'user@example.com:sekret' https://qoolife.com/api/v1/attachments/1/download?send_file=1

will return the file in the response

    curl -u 'user@example.com:sekret' https://qoolife.com/api/v1/attachments/1/download?send_file=0

will return the url


Response for the second request:

  {
    "download_url": "http://bucketname.s3-eu-west-1.amazonaws.com/1-file.png?AWSAccessKeyId=XXX&Signature=XXX%3D&Expires=1378916987"
  }