### Event Collaboration

[Event collaboration](http://martinfowler.com/eaaDev/EventCollaboration.html)
is a way of decoupling distributed systems.
In Restorecommerce, it is based on publish/ subscribe based messaging.
[Kafka](http://kafka.apache.org/) is used As middleware/ message bus for this.
The main reason for using Kafka is that it allows to persist any event
permanently instead of just until it is consumed by some service. This in turn
allows to replay all events or starting from a certain checkpoint.
This can be very handy in a recovery case but also for regular system evolution
[as also advocated here](http://movio.co/blog/microservices-rise-kafka/).

This interaction style is used for any interaction where at least
on of the following properties apply:

- not latency critical
  - such as responses to web clients
- sender does not expect a response (except for technical reasons)
