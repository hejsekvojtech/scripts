# Get started with scripts

> These scripts were made to help with building various Android ROMs and Recoveries. I use these on my build server/personal machine so
> they are tailored specifically to me but you are free to take these and modify them for your own needs.
> This repository contains some useful bash scripts for fully automated building ROMs or TWRP recovery
> for your device. Take them as a reference or just kang them :P I am okay with that.

## Before you start

Make sure you have **git** and **curl** installed on your machine

```sh
sudo pacman -S --noconfirm git curl
```

## Preparing scripts

Now we'll clone them and `cd` to them by running these commands:

```sh
git clone https://github.com/hejsekvojtech/scripts.git && cd scripts
```
Make sure you have proper sources synced!

## Starting scripts

```sh
./<script name> <option>
```

### Examples

The scrips supports some arguments to specify if you want to run a clean build, build with CCache etc...

```sh
./build-affinity <device name> --r <version> --v <oos, omni or custom> -c clang
```

```sh
./build-rom <device name> --clean --ccache --rom <rom name>
```

```sh
./build-twrp <device name>
```

```sh
./build-setup <github username> <your email>
```