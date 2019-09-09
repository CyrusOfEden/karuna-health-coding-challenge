# SQL

We are attempting to build a service which receives messages to be sent, and queues them locally so that they can be delivered to the recipient one at a time. Messages have a `medium` (such as "SMS") and an `identifier` (such as "+12345678900"), which together uniquely identify a recipient. The external service we use to send messages alerts us when a message has been delivered, so that the next message for a recipient (if any) can be sent out.

We wish to write a query that gives us the messages which are eligible to be sent at the given moment. It should preserve the ordering of messages, and ensure a message is only sent after the previous message for a recipient is delivered. This means we want to return, per recipient, the _earliest_ pending message, assuming there are no messages currently in-flight for that recipient. If there are any messages in-flight for that recipient, we want to return nothing.

Assume you have a table created with the following schema.

```sql
CREATE TABLE messages (
  id integer PRIMARY KEY,
  medium character varying NOT NULL,
  identifier character varying NOT NULL,
  status integer NOT NULL,
  body text NOT NULL,
  created_at timestamp without time zone NOT NULL
);
```

`status` is an enum, with the following value map.

```ruby
{
  0: :pending,
  1: :inflight,
  2: :succeeded,
}
```

Write a single query ([CTE](https://www.postgresql.org/docs/9.1/static/queries-with.html)s are allowed) which returns all rows `r` that satisfy the following:

- `r.status` is `pending`
- there are no rows with the same `(medium, identifier)` as `r` that are also `pending` but have an earlier `created_at` (this ensures the returned row is the earliest pending message for the recipient)
- there are no rows with the same `(medium, identifier)` as `r` that are `inflight`

If it helps, the formal definition of the set `R` of returned rows are as follows. Here, `U` is the set of all records in the database, and `M_r` is the set of records that have the same `medium` and `identifier` as a record `r`.

![formal definition of R](../images/sql.png)


```tex
M_r := \{r' \in U \setminus \{r\} : r'.\text{medium} = r.\text{medium} \land r'.\text{source} = r.\text{source}\}

R := \{r \in U : r.\text{status} = \text{``pending''} \land (\nexists r' \in M_r)\left[r'.\text{created\_at} < r.\text{created\_at} \lor r'.\text{status} = \text{``inflight''}\right]\}
```
