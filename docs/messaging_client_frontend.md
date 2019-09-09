# Messaging Client (Frontend)

We wish to build a client for the platform described in the [messaging architecture](messaging_architecture.md) spec.

Build a functional, standalone React app that displays a set of conversations, each with a series of messages between two parties. Assume the person viewing the app is one of the participants in each conversation (don't worry about supporting multiple users). The basic requirements are:

- Be able to view the list of conversations with others
   - Conversations are displayed in descending order of their last timestamp
   - Display a preview of each conversation (name, unread count, and last message time)
   - Search for a given conversation by the other person's name
- View the messages of a selected conversation in-order
   - Incoming vs outgoing messages must be visually distinct
   - Compose a new message (plain text is sufficient) and "send" a new message (storing the message in-memory and having it appear in the interface)
- If I am viewing a conversation and refresh the page, then I should still be viewing that conversation when the page reloads
  - Persisting new outgoing messages is optional

While you are free to store outgoing messages in-memory, please use the below API endpoints to fetch the set of existing conversations and messages.

If you have time, feel free to add creative extensions, such as fuzzy searching (of conversation names or message contents), persisting new outoging messages, rich-text composing, handling new realtime incoming messages, or anything else you can think of!

#### `GET /conversations`

This endpoint returns a list of conversations, which include the name of the other party, and an ID. You can use this ID to fetch the messages of a given conversation, as below.

```json
{
  "page": 0,
  "total": 1,
  "data": {
    "conversations": [
      {
        "uuid": "1FCA5132-535C-489E-B1C8-6ABDD34FFF8A",
        "name": "Yasyf Mohamedali",
        "unread": 1,
        "last_message": {
          "uuid": "89A76DA9-930D-4C31-9997-3878364F7559",
          "body": "Hello, World!",
          "direction": "incoming",
          "created_at": "2018-08-20T22:33:28.660Z"
        }
      }
    ]
  }
}
```

#### `GET /conversations/<uuid>`

This endpoint lists the messages of a given conversation. Each message has a timestamp, an ID, a body, and a direction (`outgoing|incoming`).

```json
{
  "page": 0,
  "total": 1,
  "data": {
    "messages": [
      {
        "uuid": "89A76DA9-930D-4C31-9997-3878364F7559",
        "body": "Hello, World!",
        "direction": "incoming",
        "created_at": "2018-08-20T22:33:28.660Z"
      }
    ]
  }
}
```
