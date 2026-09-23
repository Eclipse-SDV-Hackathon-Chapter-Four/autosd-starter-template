# AutoSD Devcontainer Template

This folder contains the basic setup to develop apps in AutoSD using Devcontainers.

## Project Structure

* `.devcontainer`: the devcontainer folder with a `devcontainer` file
* `src`: your source code

## Usage

You can just open this folder in an editor that supports Devcontainers, such as VSCode, or use the Devcontainer CLI:

```
$ devcontainer up
```

If you are using podman:

```
devcontainer up --docker-path /usr/bin/podman
```

The list of pre-built AutoSD images can be found at: https://github.com/orgs/eclipse-autosd/packages?tab=packages&q=-bootc

## Building a Custom Image

The devcontainer file uses an existing pre-built image, if you want to customize one, removed the "image" field and add:

```
"build": {
    "dockerfile": "Dockerfile"
},
```

You also need to create `Dockerfile` (path is relative to the `devcontainer.json` file):

```
FROM ghcr.io/eclipse-autosd/eclipse-autosd-bootc-qemu:latest

# add your custom instructions here
```

## License

[Apache-2](./LICENSE)

