# Docker Images for Pimcore 5 & 6

### What is this repository for? ###

A list of docker files used for common images, mainly Pimcore 5 and 6.
Using images from this repo should save a lot of time since all extra dependencies will be included within the already built images.

### Available images

You can build your own images for your own docker hub or you can use ours.

A complete list of repos can be accessed with
> http://dockerhub.dgtls.com:5000/v2/_catalog

To see available tags for a repo use 
> http://dockerhub.dgtls.com:5000/v2/{repo}/tags/list

### Supported versions
All images based on debian 10 (buster)
 - Apache 2.4 / PHP 7.4 / Xdebug
 - Apache 2.4 / PHP 7.3 / Xdebug
 - Apache 2.4 / PHP 7.2 / Xdebug

### How to use for building applications ###
Our docker hub is located at dockerhub.dgtls.com:5000.

##### For LINUX / Ubuntu (recommended):
Create or update the file /etc/docker/daemon.json with following content:
```
{
  "insecure-registries" : ["dockerhub.dgtls.com:5000"]
}
```

##### For MAC:
In order to use the registry on mac you must first add this as an insecure registry:
Docker for MAC menubar icon -> preferences -> advanced -> add "dockerhub.dgtls.com:5000" as an insecure registry.

When setting up an application and you want to use docker-compose, just use this registry and repo as the base image, for example:

Instead of `FROM php:74-apache` just write `FROM dockerhub.dgtls.com:5000/pimcorephp74apachedebug:latest`

That's it.

### Contribution guidelines ###

For any changes to existing images or new ideas for images we do not currently have, please send PR.
