# Persistence Services

The following persistence services are required by a basic
Restorecommerce application:

- Arangodb
- Elasticsearch
- Kafka
- Redis
- Restorecommerce smart facade service for object storage

## Instance Sharing

In a blueprint micro services arrangement, every service has its
dedicated persistence service instance. While this is possible
it is neither appropriate in development nor for small scale production
setups because persistence services usually have a higher
resource consumption than typical micro services;
even if they idle and no data is stored.

This is why by default only a single instance of each persistence
service is used.

In order to prevent naming collisions, the name of
the administrative primitives like data bases, topics, keys etc.
are named after a scheme that includes the service name
for which they are created.

TODO: example for 2 services and their default DB names

