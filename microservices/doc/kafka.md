# Apache Kafka

is at the heart of the micro services architecture of Restore to enable event driven communication.

## Architecture

- Zookeeper for cluster consensus (still required by Kafka)
- Single Broker (thus no replication)
- No partitioning

Currently we rely on Kafka's ordering guarantee for restoring data which **only holds true
if partitioning is not used**. This and due to further reasons stated below why we cannot use
partitioning across entities.

## Consumers and Consumer Groups

Each microservice forms a single consumer, multiple instances of a micro service cannot be run in parallel.

## Delivery Semantics and Commit Offset

All micro services applies the 'At-most-once' semantics by only committing messages after
they have been processed.
The high water mark is currently ignored as it is irrelevant in a setup without replication.

## Data Retention

Data is currently held infinitly; we make no use of 'Retention by Time', 'Retention by Size' or 'Log Compaction'.
In the future we might introduce a checkpointing feature.

