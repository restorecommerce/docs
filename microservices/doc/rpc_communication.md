# RPC based Communication

[Remote procedure call](https://en.wikipedia.org/wiki/Remote_procedure_call)
based communication allows for direct interaction between services.
Servies might reach out to other services in order to generate a response
(cascading).

Technically, RPC is based on [GRPC](https://www.grpc.io/docs/) and
thus [Protocol Buffers](https://developers.google.com/protocol-buffers/).

## Service Discovery

In order to invoke a remote service
via an RPC interface, the service needs
to be _known_. Obviously this is not required
for event collaboration.

While there are multiple patterns and technologies for
service discovery, the most simple one is employed
for Restorecommerce ‒ static configuration.
The configuration is a simple map which
assigns a service name such as "cart" to a network end point.

## Common Interface

describe common interface, for example

- command interface
- health check
- introspection

