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
    ├── challenges: starting point each specific hackathon challenge 
    │   ├── doctor-whodunit: starting point to build and run doctor-whodunit challenge in AutoSD
    │   └── hack-to-the-future: starting point to build and run hack-to-the-future challenge in AutoSD
    └── freestyle: basic generic templates
        ├── bazel: base template to use AutoSD with Bazel
        ├── docker: base template for docker/podman (includes docker/podman machine and compose)
        └── eclipse-score: base template to build and run Eclipse S-CORE components in AutoSD
```


## What is AutoSD

AutoSD is the upstream binary Linux distribution that serves as the public, in-development preview of Red Hat In-Vehicle Operating System (RHIVOS).
Built on CentOS Stream with automotive-specific optimizations, AutoSD enables mixed-criticality workloads for modern Software-Defined Vehicles.

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

### Hackathon Challenges

Location: [./templates/challenges](./templates/challenges)

These templates provides a starting poing to work on the proposed hackathon challenges with AutoSD.

* [Hack to the Furue](./templates/challenges/hack-to-the-future)
* [Doctor Whodunit!!!](./templates/challenges/doctor-whodunit)

### Freestyle Templates

This section contains instructions for base templates that are challenge neutral for "freestyle" projects.

* [Docker](./templates/freestyle/docker) 
* [Bazel](./templates/freestyle/bazel)
* [Eclipse S-CORE](./templates/freestyle/eclipse-score)

## License

[Apache-2.0](./LICENSE)
