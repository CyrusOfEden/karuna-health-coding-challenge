# Karuna Coding Challenge

This challenge consists of many questions, each designed to test a different skillset which we consider crucial to being part of our early-stage team. Skip ahead to [here](#questions) to get a preview of the questions.

## General Information

Each question should take at most an hour (with the exception of the React questions, see below). This is not meant to be a whiteboard exercise or something to test your memorization skills. We want to see how you problem-solve as an engineer. Feel free to use your standard environment, tools, resources, etc. You can Google anything you'd like, use public libraries, and do all thing things you'd normally do. We only request that your submission be self-contained (use standard mechanisms such as a `package.json` or `Gemfile` to pull in external dependencies if needed), and that you don't get anyone else to help you (no asking friends for tips and write all your own code).

Remember to focus on code quality. If you don't have time to implement everything exactly as you want to, leave comments letting us know how you would have done it better!

Additionally, we will ask you to submit a code sample. This should be the piece of code that you are most proud of. You could be proud of this code because of how elegant, efficient, or otherwise beautiful it is.

### Backend Roles

Please select 3 of the below Ruby or SQL challenges, and complete them.

### Fullstack Roles

Please select 1 of the below Ruby or SQL challenges, and 1 of the React challenges, and complete them.

### Frontend Roles

Select either one of the React challenges ([_Messaging Client (Frontend)_](#messaging-client-frontend) or [_`Brainfuck` Execution Visualizer_](brainfuck-execution-visualizer-frontend)), and complete it.

Since the React questions will take slightly longer than the others, we only ask that you complete one challenge.

## Respecting Your Time

We understand that asking you to take time out of your busy personal schedule to do our coding challenge is significant—we value your time! We've been on the other end of enough of these to know how it feels when your time is taken for granted, so we do a few things to mitigate that feeling.

1. A hard time limit: unless you _want_ to, please do not spend more than 3.5 hours on this challenge. Let us know if you hit this limit—it probably means we messed up.
2. Please give us feedback on how long each question takes you, and if any feel too short or too long.
3. This coding challenge is a part of our on-site. We're not taking time away from you in addition to a full day in our office. Instead, we understand that most people would prefer to write code on their own time, in their own environment, rather than on a whiteboard in our office. Therefore, we give you the bulk of the technical interview in the form of this challenge, and simply spend time in the office going over your solutions. For some roles, we might ask you to do one more hour of work during your onsite. If you'd prefer to come sit in our office and do this challenge right before your onsite, let us know and we can make that happen!
4. If you feel strongly that you must be compensated for your time spent on this, we understand. Please let us know, and we will gladly compensate you a fair (but startup-appropriate) amount.

## Environment

Some questions must be completed in Ruby (since this is the language the majority of our backend systems are currently written in). If you're unfamiliar with Ruby, check out this [migration guide](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/). Hopefully you don't feel too hindered by this restriction - feel free to include a note if you found it particularly annoying, or to let us know that you're strongest with another language.

The SQL question is run against an up-to-date Postgres instance.

The React questions can use any sane build setup you wish (including a simple static HTML file). We recommend using a standard framework like [create-react-app](https://github.com/facebook/create-react-app). We will run your code in a modern version of Chrome, unless you tell us to do something else.

## Submission

In the email you were sent with the link to this challenge you should have also received a link to upload your code. If you did not, please email someone on the team for help!

## API

Some questions will depend on an endpoint served by our coding challenge API. You can access this API at `https://sec.meetkaruna.com/api/v1`. Each request will require a `user_id` query parameter, for which you should use your GitHub username.

Most endpoints can be paginated using the `page` and `per_page` query params, which default to `0` and `10` respectively.

## Improvements

This coding challenge is very much in beta! Feel free to email us with improvements, or, better yet, submit pull requests with fixes and enhancements!

## Questions

We have provided a summary of each question below. There is a document linked for each which describes the requirements in detail.

### Rate Limiting

Design a class that allows for rate-limiting of arbitrary code blocks.

**Read more [here](docs/rate_limiting.md).**

### SQL

We are attempting to build a service which receives messages to be sent, and queues them locally so that they can be delivered to the recipient one at a time. Write a query that gives us the messages which are eligible to be sent at the given moment.

**Read more [here](docs/sql.md).**

### Messaging Client (Frontend)

We wish to build a client for the platform described in the [messaging architecture](docs/messaging_architecture.md) spec. Build a functional, standalone React app that displays a set of conversations, each with a series of messages between two parties.

**Read more [here](docs/messaging_client_frontend.md).**

### Messaging Client (Design)

We wish to design an interface for the platform described in the [messaging architecture](docs/messaging_architecture.md) spec.

**Read more [here](docs/messaging_client_design.md).**

### Creative Web

What is the most creative way you can get a circle to appear on the screen of a web browser?

**Read more [here](docs/creative_web.md).**

### `Brainfuck` Interpreter

Implement a `Brainfuck` interpreter (as a Ruby class), which takes in a script and executes it.

**Read more [here](docs/brainfuck_interpreter.md).**

### `Brainfuck` Execution Visualizer (Frontend)

You do not need any background context on compilers or the `Brainfuck` language to complete this challenge.

We want to build an _execution visualizer_, which is a web app that executes a program step by step, and can show at any given time where we are in the program's execution. An example of an execution visualizer can be found [here](https://goo.gl/nDth8B).

**Read more [here](docs/brainfuck_execution_visualizer.md).**

### Code Sample

Please include with it a brief description of what your code does, and why you're so proud of it.


