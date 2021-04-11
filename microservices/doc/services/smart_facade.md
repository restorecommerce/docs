# Smart Façade

The _smart facade_ exposes the functionality of a Restorecommerce based application
in its entirety as a REST API.
This means, the smart facade is the only micro services which is
exposed to the public (usually the Internet).
Other micro services may go through the service facade in case
RESTful interaction with the application is required,
for example if linked data resources need to be dereferenced.

Generally the following aspects are covered by the service facade:

- Resource engine for trivial resources (ones that are not backed by
  a micro service)
- Request dispatcher
  - invocation of micro services
  - emission of events
- Response generation
  - transformation of data into RESTful resource representation (JSON-LD)
  - enrichment with status and meta data (Hydra Core)
  - enrichtment with HATEOAS affordances (Hydra Core)
- Data sanity checks and message validation
- Caching
  - Entire request/ response pairs
  - Single resources
- Rate limiting
- Authentication (with help of micro service)
- Authorization (with help of micro service)
  - Backing micro services are not secured, so
    everything that gets past the smart facade
    must be properly authentication checked.
