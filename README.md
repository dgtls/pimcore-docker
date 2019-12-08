# Docker Images for Pimcore 5 & 6

### What is this repository for? ###

A list of docker files used for common images, mainly Pimcore 5 and 6.
Using images from this repo should save a lot of time since all extra dependencies will be included within the already built images.

### Available images

You can build your own images for your own docker hub or you can use ours.

A complete list of repos can be accessed with
> http://144.76.62.83:5000/v2/_catalog

To see available tags for a repo use 
> http://144.76.62.83:5000/v2/{repo}/tags/list

### Supported versions
 - Apache 2.4 / PHP 7.2 / Xdebug
 - Apache 2.4 / PHP 7.3 / Xdebug

### How to use for building applications ###
Our docker hub is located at 144.76.62.83:5000.

#####For LINUX / Ubuntu (recommended):
Create or update the file /etc/docker/daemon.json with following content:
```
{
  "insecure-registries" : ["144.76.62.83:5000"]
}
```

#####For MAC:
In order to use the registry on mac you must first add this as an insecure registry:
Docker for Mac menubar icon -> Preferences -> Advanced -> add "144.76.62.83:5000" as an insecure registry.

When setting up an application and you want to use docker-compose, just use this registry and repo as the base image, for example:

Instead of `FROM php:73-apache` just write `FROM 144.76.62.83:5000/pimcorephp73apachedebug:latest`

That's it.

### Contribution guidelines ###

For any changes to existing images or new ideas for images we do not currently have, please send PR.
