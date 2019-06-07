# Jupyter Conda Lab

This repository contains a Docker file to create a container that has
conda installed and uses Jupyter notebooks. It also has installed
node, npm, ijavascript and some JS dependencies.

I use the Dockerfile to create containers in which I can test my Python
and JavaScript code taking advantage of Jupyter's features.

## Building image

In order to build the image using the provided Dockerfile run:

```bash
docker build -t conda-stack-overflow . # you can provide your custom name after -t
```

## Creating a container

Once the image has been built, you can create a container running the following command:

```bash
docker run --volume /host/path/to/jupyter_notebooks:/opt/notebooks --rm -it -p 8888:8888 --name condasflow conda-stack-overflow # you can also provide your custom name after --name
```

Using `--volume` allows us to persist data once the container has been removed. Please, provide your custom
path to a directory that will be bind with the container `/opt/notebooks`. Using `--rm` tells Docker
to remove the container once this is stopped. Using `--name` allows us to give a name to our container.

If you want to use your current directory as your host directory you can run the following command:

```bash
docker run --volume $(pwd):/opt/notebooks --rm -it -p 8888:8888 --name condasflow conda-stack-overflow
```

## Running a command while our container is running

If you have to run a command, e.g, you need to install a JS or Python dependency. In order to start
a terminal following commands:

```bash
docker exec -it condasflow bash # starts a terminal inside the container
```

Once you are inside the container you can run any command you want.
