# autosd-starter-template

This repository contains instructions and base templates to use AutoSD at the Eclipse SDV Hackathon.

## Contact and Support

Reach out to to "lrossett" in Eclipse SDV's slack channel for help.

Eclipse SDV's slack channel URL can be found at https://eclipsesdv.org/get-involved/.

## Repository Structure

Check the desired template folder for detailed instuctions to use each respective AutoSD template.

```
├── guides: getting started guides for some tools
│   └── jumpstarter: guide to setup and use Jumpstarter for device testing
│       ├── exporters: jumpstarer exporters
│       │   └── qemu.yml: jumpstarter exportet config to easily test apps with QEMU
└── templates: templates folder
    └── freestyle: basic generic templates
        ├── bazel: base template to use AutoSD with Bazel
        ├── docker: base template for docker/podman (includes docker/podman machine and compose)
        └── eclipse-score: base template to build and run Eclipse S-CORE components in AutoSD
```

## What is AutoSD

AutoSD is the upstream binary Linux distribution that serves as the public, in-development preview of Red Hat In-Vehicle Operating System (RHIVOS).
Built on CentOS Stream with automotive-specific optimizations, AutoSD enables mixed-criticality workloads for modern Software-Defined Vehicles.

Container images can be used to test/run applications or workloads,
base images can be found at: https://github.com/orgs/eclipse-autosd/packages?repo_name=eclipse-autosd.

Images are split per platform or target, so `eclipse-autosd-bootc-$target`. You can rely on the qemu ones for development and switch to "ebbr" targets
to test it in boards available via jumpstarter. Disk images can be found at https://download.eclipse.org/autosd/disk-images/.

A more detailed integration workflow can be found at: https://github.com/eclipse-autosd/eclipse-autosd.

### Workloads

Workloads in AutoSD are defined using Systemd, which also supports containerized workloads using podman and quadlets: https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html.

The following file is an example of how to run Eclipse Kuksa Databroker using quadlet:

``` 
[Unit]
Description=kuksa-databroker
WantedBy=default.target

[Container]
ContainerName=kuksa-databroker
Image=ghcr.io/eclipse-kuksa/kuksa-databroker:0.7.1
Network=host
HostName=kuksa-databroker
PublishPort=55556:55556
PublishPort=55555:55555
Environment=KUKSA_DATABROKER_PORT=55556
Environment=KUKSA_DATA_BROKER_ADDR=0.0.0.0

[Install]
WantedBy=multi-user.target default.target
```

Saving that file in `/etc/containers/systemd/kuksa-databroker.container`, will result in a Systemd service that will run Kuksa Databroker in a container
using podman.

## Jumpstarter (Device Testing)

Jumpstarter (https://jumpstarter.dev/main/index.html) can be used to test your applications in two platforms: `qemu` (local VM) or `j784s4evm` (remote Texas Instruments automotive board).

The typical Jumpstarter workflow would be:

* powering a device on
* Flash an image
* Reboot or boot (depends on the platform)
* Run tests over ssh
* Cleanup storage (unflash)
* Power off

Check [guides/jumpstarter](./guides/jumpstarter) for usage details.

## Templates

This section gives an overview of each available template.

Detailed instructions are available in each template folder, respecively.

### Freestyle Templates

This section contains instructions for base templates that are challenge neutral for "freestyle" projects.

* [Bazel](./templates/freestyle/bazel)
* [Devcontainer](./teamplates/freestyle/devcontainer)
* [Docker](./templates/freestyle/docker) 
* [Eclipse S-CORE](./templates/freestyle/eclipse-score)

## License

[Apache-2.0](./LICENSE)
