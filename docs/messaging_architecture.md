# Messaging Platform Architecture

We would like to architect/design a system (or set of systems) that allows for our care coordinators to have a unified messaging platform with which to message patients. The requirements of the system are:

1. Patients can message Karuna from various different mediums (Facebook Messenger, SMS, etc.)
2. The same patient can contact us on different mediums at different times, and receive responses on the last medium they used
3. Messages from patients can get routed to the correct coordinator, based on a set of rules
4. Coordinators have a UI which shows all their routed messages in one place
5. Coordinators can respond to messages without worrying about which medium will be used
6. Coordinators can "hand off" a patient to another coordinator
7. Audio and video interactions are recorded and transcribed
8. Both incoming and outgoing messages are delivered in-order and exactly-once
9. The external systems for delivering messages can be easily changed
10. Various metrics (such as the maximum time a patient waits for a response) can be reported and alerted on

This is intentionally a very open-ended question. There are hundreds of different aspects you can think through, from the data models, to the interactions between microservices (if indeed there are any), to the external APIs used for delivery. We are not asking you to cover every possible question - just the ones you think are most important.

Your deliverable has two pieces. The first is a defining set of questions: what are the most important aspects of this system to think through? We will use this to learn how you approach ambiguity, and how you bring structure to new problems. The second piece is to answer all your own questions, to whatever degree of thoroughness you deem necessary. Please do not spend more than an hour on this question. You are free to make this question as technical or visual as you wish. We're not looking for the "right" answer, just an example of how you form and communicate plans.
