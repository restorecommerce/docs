# Event driven Communication

Events are published on application wide [Kafka](http://kafka.apache.org/)
instance as a logical stream. Microservices observe this stream
acting as stream processors which transform input data to some output.
The output might be new events and/ or trigger a local state change in the
consuming service. Services are able to subscribe and unsubscribe dynamically
as they join and leave the system.

## Events

A sound concept for naming and structuring events is essential for event
collaboration.
There must be conventions for naming, granularity and the format,
otherwise the service interaction is likely to end up as
distributed spaghetti code. The anatomy of events is described in the following.

### Naming

In general, events are:

- Named __not__ after services but after domain entities
- Name in past tense (e. g. _CartItemAdded_)

The naming after domain entities has a practical reason:
In a distributed system, services, classes, data models etc.
tend to change often while domain entities remain.

### Event Types

There are the two categories of events as described below.

#### Resource Events

Changes to resources can be tracked by consuming resource events.
All resources have the same events (`putted`, `deleted`, `patched`, `posted`).

TODO: rename `putted` in `replaced`, `posted` in `created`

#### Domain Events

The high-level business events have different names on the same topic.
Example for such events are the completion of an order or expiration of a
reservation.

## Serialization

The data format used for event collaboration are serialized protobufs.

TODO: Shouldn't we also binary protobufs here?

## State Changes

Any significant state change is eventually represented by a published event.
As events are side-effect free, the current persistent state of any service
can be restored by just consuming the relevant events.

This has the following benefits:

- micro services to be built after the
[Event Sourcing](http://martinfowler.com/eaaDev/EventSourcing.html)
principle.

As Kafka allows to retain events in a persistent manner, it is also possible to
replay the event stream which in turn is beneficial to:

- Re-process data with a changed business logic,
- Restore the state of a service to recover from a previous failure,

### Cache

The restore-cache module provides caching of a specific resources.
By using a cache the startup time is reduced by only consuming the missing
event messages. Without a cache all the messages of a resource topic would be
needed to restore a correct state of the resource.

TODO: this concept should be renamed to snapshotting or checkpointing. Where is what saved?

### Offset Management

The no-kafka client does not provide a dedicated function for resetting the offset.
The chassis-srv events provider provides a private function which allows resetting by
forcing a hard reset.
This reset method is used in the `CommandInterface` for restoring a state of a micro service.


## Topics

Technically, events are published under Kafka topics which can be seen as
stream. Topic names include the resource name from the resources model with the
following naming pattern:

`io.restorecommerce.<resource name>.resource`.

### Topic Creation

The no-kafka client does not provide a way to manage topics.
The required topics need to be created before starting a micro service.
Most services use a prestart (npm) script to ensure the Kafka topics exist.
It is recommended to create the Kafka topics manually to ensure the right setup
parameters.

TODO: update after migration!

