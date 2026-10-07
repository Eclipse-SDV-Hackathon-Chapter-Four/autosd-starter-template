# Jumpstarter

Jumpstarter is a developer's tool that allows one to perform hardware automation for application testing, such as:

* power management (on, off, recycle)
* storage management (flash images)
* serial console streaming
* run ssh commands
* etc.

Upstream documentation: https://jumpstarter.dev/main/

The Jumpstarter community can be found in Matrix: https://matrix.to/#/#jumpstarter:matrix.org

## Installation

The most basic way to install Jumpstarter:

```
$ curl -fsSL https://raw.githubusercontent.com/jumpstarter-dev/jumpstarter/main/python/install.sh | bash
```

Check the upstream documentation for detailed instructions or troubleshooting: https://jumpstarter.dev/main/getting-started/installation/packages.html

## Usage

Once installed, a python virtual env will be installed at `source $HOME/.local/jumpstarter`, which you can activate by running:

```
$ source $HOME/.local/jumpstarter/venv/bin/activate
```

That virtual environment enables the usage of the `jmp` CLI:

```
$ jmp
Usage: jmp [OPTIONS] COMMAND [ARGS]...

  The Jumpstarter CLI

Options:
  --log-level [DEBUG|INFO|WARNING|ERROR|CRITICAL]
                                  Set the log level
  --help                          Show this message and exit.

Commands:
  admin       Jumpstarter Kubernetes cluster admin CLI tool
  auth        Authentication and token management commands.
  completion  Generate shell completion script.
  config      Manage local configurations
  create      Create a resource
  delete      Delete resources
  driver      Jumpstarter driver CLI tool
  get         Display one or many resources
  login       Login
  mcp         MCP server for AI agent interaction with Jumpstarter hardware.
  run         Run an exporter locally.
  shell       Spawns a shell (or custom command) connecting to a local or...
  update      Update a resource
  version     Get the current Jumpstarter version

```

Run the following in case you want to exit that virtual environment:

```
$ deactivate
```

## The Hackathon Device Farm Cluster

Jumpstarter allows participants to flash and test their applications in automotive boards (available in a remote cluster)  via Jumpstarter.

The devices in question are:

* Renesas R-Car S4
* Texas Instruments J784S4 EVM (j784s4evm)

There are 8 of each board available.

### Cluster Access

Access is proxied via a Github OAuth application, so you need to share your Github username/handler with
Leonardo Rossetti (lrossett) in the hackathon Slack channel.
Your username will be added as a member of a Github organization for authenticaiton only purposes.

Run the following command to login after your usernamed is already part the expected Github organization:

```
$ jmp login $GH_USERNAME@jumpstarter-login.apps.automotive1.ocp.automotive.sig.centos.org:443

Fetching configuration from jumpstarter-login.apps.automotive1.ocp.automotive.sig.centos.org:443...
Retrieved CA certificate from login service.
Allow unsafe driver client imports? [y/N]: y
Please open the URL in browser: $OAUTH_URL.
```

Open the url shown for `$OAUTH_URL` and authorize the Github OAuth app (it just needs to read info from the organization we added you).

You can now use Jumpstarter for your tests.

### Check Available Devices (Exporters)

To list available devices (or exporters in Jumpstarter jargon), run the following command:

```
$ jmp get exporters
```

Your output should see something like this (ignore warnings at the top of the list):

```
NAME                      LABELS                                                           
renesas-rcar-s4-11        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-12        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-14        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-15        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-16        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-17        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-18        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
renesas-rcar-s4-19        board-type=renesas-rcar-s4,isolated=true,pool=open,target=rcar_s4
ti-jacinto-j784s4xevm-12  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-13  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-14  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-15  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-16  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-17  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-18  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
ti-jacinto-j784s4xevm-25  board-type=j784s4evm,isolated=true,pool=open,target=j784s4evm    
```

You can then lease and interact with a device based on its name by running:

```
$ jmp shell -n renesas-rcar-s4-11
```

Or you can also just use a label to match a board type, regardless of the name/ID:

```
$ jmp shell -l board-type=renesas-rcar-s4
```

That gives you a "Jumpstarter shell", with access to new commands to interact with the targeted device/exporter.

The device is automatically released once you exit its shell.

### The Device/Exporter Shell

You get access to a new `j` CLI, which is used to interact with the chosen device:

```
~ ⚡renesas-rcar-s4-12 ➤ j
Usage: j [OPTIONS] COMMAND [ARGS]...

  Generic composite device

Options:
  --log-level [DEBUG|INFO|WARNING|ERROR|CRITICAL]
                                  Set the log level
  --help                          Show this message and exit.

Commands:
  mount    Mount or unmount remote filesystem via sshfs
  net      DUT Network Isolation
  power    GPIO power control commands.
  serial   Serial port client
  ssh      Run SSH command with arguments
  storage  Software-defined flasher interface
  tcp      Generic Network Connection
  tmt      Run TMT command with arguments
  vnc      Open a VNC session and block until the user closes it.
```

NOTE: `renesas-rcar-s4-12` is the device name from the device/exporter list chosen by you.

Each subcommand has its own set of arguments that can be shown by running `j $subcommand --help`.
