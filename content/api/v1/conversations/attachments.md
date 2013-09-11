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

The response will be the same JSON response as when creating a Conversation.

Example request:

    curl -u 'user@example.com:sekret' -F 'conversation[title]=a title' -F 'conversation[first_post_body]=Wow folks whats app' -F 'conversation[user_id]=1' -F 'conversation[first_post_attachment_asset]=@myfile' https://qoolife.com/api/v1/conversations

## On reply (new post)

<dl>
  <dt>post[body]</dt>
  <dd>Look at my pics :-P</dd>

  <dt>post[attachment_asset]</dt>
  <dd>** encoded file **</dd>
</dl>

The response will be the same JSON response as when creating a new Post.

Example request:

    curl -u 'user@example.com:sekret' -F 'post[body]=I say your message' -F 'post[attachment_asset]=@myfile' https://qoolife.com/api/v1/conversations/1/posts

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