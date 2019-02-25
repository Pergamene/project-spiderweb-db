
# Project Spiderweb - Database

## License; use, modification, sharing, and distribution

* This project does **not** have an Open Source license and its copyright is only extended to the specified authors.
* You are not permitted to share the software.
* You are not permitted to distribute the software.
* You are not permitted to modify the software.
* You are not permitted to use the software, except at its hosted URL.

* You are, however, permitted to view and fork this repo.

You can read more about our permissions at https://choosealicense.com/no-permission/

## Setup

You must have Docker installed to run this database instance. Check the official [Docker Installation Guide](https://docs.docker.com/engine/installation/) if it isn't installed on your machine.

## Run

To start or stop the database, build the image and run it:

```bash
make build
make run-dev
```
Allow up to 2 minutes for mysql to start up after `run-dev` before testing the connection.

You should be aware that if you remove the docker container, any data added to the database beyond what is in setup.sql will be wiped.  This is intentional so that you can quickly revert to a clean slate whenever you desire.

If you alter setup.sql, make sure to `make build` again to copy those changes into the docker image.  Make sure to test your changes before `make build`, otherwise `make run-dev` will not be able to run the MySQL instance and it will kill the container.

## Accessing the database

You should now have a database reachable at localhost:3306.

* Username: "spiderweb_dev",
* Database: "spiderweb_dev",
* Password: "password"

This is automatically configured in the [project-spiderweb-app](https://github.com/Pergamene/project-spiderweb-app).  I recommend also configuring it in a MySQL management application for ease of debugging.  I recommend [Sequel Pro](https://www.sequelpro.com/) if you have a Mac, or [Workbench](https://www.mysql.com/products/workbench/) otherwise.

## Notes

This repo is based off of [https://github.com/dwmkerr/node-docker-microservice](https://github.com/dwmkerr/node-docker-microservice).  You can read more about it here: [http://www.dwmkerr.com/learn-docker-by-building-a-microservice/](http://www.dwmkerr.com/learn-docker-by-building-a-microservice/)
