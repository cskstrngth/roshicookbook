# roshicookbook

A Chef cookbook for a simple CRDT stack based on [roshi](https://github.com/soundcloud/roshi).

## Dependencies

```
depends 'apt', '~> 3.0.0'
depends 'firewall', '~> 2.5.0'
depends 'docker', '~> 2.0'
```

It has been tested on Ubuntu 14.04.

## Stack

 * nginx
   * acts as the frontend reverse proxy
   * installed from package
   * supervised by Upstart
 * roshi-server
   * runs in [a minimalist](https://github.com/cskstrngth/roshibuild) [docker container](https://github.com/cskstrngth/roshidocker)
     * container only includes a single statically-linked pre-built executable; total size ~7.5 MB
     * see [issue #3](https://github.com/cskstrngth/roshicookbook/issues/3) for more details
   * built from [source](https://github.com/soundcloud/roshi)
   * container is supervised as a docker daemon
 * redis
   * installed from package
   * supervised by Upstart

## Reference

 * [Chef tutorials](https://learn.chef.io/tutorials)
   * basic setup of Chef cookbook, test kitchen
 * [Create the Smallest Possible Docker Container](http://blog.xebia.com/create-the-smallest-possible-docker-container/)
   * for generating the pre-built statically-linked `roshi-server` binary in a `golang` Docker container
 * [Go in Production](https://peter.bourgon.org/go-in-production/)
   * best-practices for Go application deployment, written by the same people behind `roshi`
