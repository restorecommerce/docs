# Example Application


As an example, the _Account_ service of Restorecommerce is described
in its architectural aspects below.

## Account Service Example

The service manages user accounts (in essence login name, e-mail address,
password). It has the following RPC interface:

Account service:

- Read
- List (allows to list all in a paginated manner and optionally to filter)
- Create (allows for _create_ or _create or replace_ semantics)
- Patch
- Delete

Token service:

- Read
- Create
- Verify
- Invalidate

It consumes the following topic:

`io.restorecommerce.account.resource`

It emits events under the following topic:

`io.restorecommerce.account.resource`

## Stock Keeping Example

In order to keep track of the stock,
a stock keeping service subscribes to the following events
when it is started:

- new orders
- new shipments
- order cancellations
- order returns
