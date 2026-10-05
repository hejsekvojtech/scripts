## Supported distros

Arch Linux, CachyOS (and other Arch based distros), Fedora and NixOS.
On NixOS only the dotfiles are restored, packages are managed in `configuration.nix`.

Besides packages and dotfiles the script installs Visual Studio Code, Rust via
[rustup](https://rustup.rs) and JetBrains Toolbox (downloaded from jetbrains.com,
launch it once afterwards). The last two are skipped on NixOS.

The zsh helpers provide the same `install`, `remove`, `upgrade` and `cleanup`
commands on every distro.

## Before you start

### On Arch Linux / CachyOS

```sh
sudo pacman -S --needed git
```

### On Fedora

```sh
sudo dnf install git
```

## Launching the script

```sh
./setup [<git user name> <git email>]
```

Run the script as your regular user, it calls `sudo` itself for root operations
like installing packages or copying system configs. It is safe to run it again,
dotfiles are kept in a managed block instead of being appended over and over.

Don't just blindly run the script, inspect the scripts beforehand or you might end up
with broken filesystem or in Brasil.
