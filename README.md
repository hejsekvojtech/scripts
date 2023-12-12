## Before you start

### On Arch Linux

```sh
sudo pacman -S --needed git lsb-release
```

### On Fedora

```sh
sudo dnf install git lsb_release
```

## Launching the script

The script needs to be executed with sudo as it performs some root operations
like installing packages and adding Docker repo on Fedora.

Don't just blindly run the script, inspect the scripts beforehand or you might end up
with broken filesystem or in Brasil.
