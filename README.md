# Linux Beginner Lab

This repository is meant as a first starting point for beginners to learn using Linux and Bash. It consists of documentation and explanations and exercises. The exercises are bundled into a Docker Image such that you can get hands-on experience with Linux and Bash even if you are running Windows or MacOS.

## 1 Make your first steps 

1. Install Docker from their official website
2. Start the ready-to-use Docker container, which contains all examples (see section 2)
3. Read the beginner script located at `docs/script/script.pdf`. For each chapter of the script there is an exercise in the docker image for you to follow along and practice. All exercises are located in their own directory inside the users home directory in the docker container (`/home/myuser/` in the docker container)

## 2 Use the docker image

The docker image has been pushed to docker Hub, so there is no need for you to build it yourself. There are basically three commands which you will need in order to use the docker image:

**1) Run the image for the fist time**. This triggers a download and start:

```console
docker run --name ubuntu-playground-c -it jonaswessner/ubuntu-playground:latest
```

**2) Restart the container after it has exited**. The container will have the same state as before, you can therefore continue where you left of.

```console
docker start -i ubuntu-playground-c
```

**3) Remove the container and its data/state**. This is rarely necessary, because the container itself can be restored from a backup as explained in the last chapter of the `docs/script/script.pdf` :

```console
docker container rm ubuntu-playground-c
```
