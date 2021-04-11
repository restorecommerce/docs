# Restorecommerce Documentation

This is the docs builder for the Restorecommerce documentation based on
[Antora](https://antora.org/). The documentation content resides mostly in
the repositories of the respective services like the Identity Service.

## Installation

```sh
npm install
```

## Building

To build, you are optionally required to supply docsearch credentials.

You can get them from here: https://www.algolia.com/users/sign_up

**Note: This uses the public "Search-Only API Key"**

(if you are using their public docsearch, an account is not required).

```sh
SEARCH_API_KEY=<api-key> \
    SEARCH_APP_ID=<app-id> \
    SEARCH_INDEX_NAME=<index-name> \
    npm run build
```

The resulting site will be built into the `build/site` directory.

## Serving

### Development

```sh
npm run serve
```

### Production

In production, the docs should be served from a dedicated web server or CDN.

## Search Scraping

### Requirements

To run the scraper, you are required to have docker installed.

**Note: This uses the private "Admin API Key"**

### Development

```sh
API_KEY=<api-key> \
    APPLICATION_ID=<app-id> \
    npm run scrape:dev
```

### Production

```sh
API_KEY=<api-key> \
    APPLICATION_ID=<app-id> \
    npm run scrape:prod
```

## UI

So we don't have to continuously pull updates from the Antora UI repository and
maintain a fork, we have a patch file that gets applied every time the UI gets built.

The script `build_ui.sh` contains a commit hash that locks the UI to known working UI version.
As long as the patch applies correctly, this hash can be updated without any other changes.

You can make changes to the patch by:

1. Removing current UI directory: `rm -rf ui`
2. Cloning Antora UI: `git clone https://gitlab.com/antora/antora-ui-default.git ui && cd ui`
3. Checking out the current known working hash: `git checkout 4f54fb8f47a51bdb37140f176ddbe1a6a5ecb1c1`
4. Applying the current patch so you don't lose previous changes: `git apply ../restorecommerce-docs.patch`
5. Make any changes to the UI you wish. You can build the UI using: `$(npm bin)/gulp bundle` (don't forget to `npm install`)
6. Save the diff back into the patch file: `git add -A && git diff --cached > ../restorecommerce-docs.patch`
