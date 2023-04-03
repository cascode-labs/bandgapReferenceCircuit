# SKY130 Bandgap Design
[Original design](https://github.com/johnkustin/bandgapReferenceCircuit) 
by John William Kustin

## Competition
The design was submitted to the 2023 IEEE code-a-chip competition

# Setup
This repo runs in a [devcontainer](https://containers.dev/) based on the 
[iic-osic-tools Docker image](https://hub.docker.com/r/hpretl/iic-osic-tools).
([source](https://github.com/iic-jku/iic-osic-tools))  This image along with the devcontainer description 
(see /.devcontainer) have the complete analog design environment 
pre-configured for this environment.

The only setup is a one-time setup to enable the Docker devcontainer to run 
on your local machine in Visual Studio Code.

## One-time Windows Setup
1. Install [X410](https://x410.dev/) from the windows store.  It does cost
a few dollars but has been by far the easiest way to enable graphical 
applications in a dev contatiner.  It sets up X-window 
forwarding on windows by just starting it and setting the $DISPLAY variable.
2. Install [Visual Studio Code](https://code.visualstudio.com/): 
This makes it easy to run the devcontainer using the remote development 
extension.
3. Follow the [Docker Desktop](https://docs.docker.com/desktop/) installation.
Note that part of the docker installation includes installing WSL2.  
This allow Docker to run Linux Docker containers on Windows using the WSL2 
Linux kernel.

## One-time Linux install
1. Install [Visual Studio Code](https://code.visualstudio.com/): 
This makes it easy to run the devcontainer using the remote development 
extension.
2. Install Docker
3. Please let me know if you find any other steps.  I've only worked with it
on Windows so it is setup for that currently.
