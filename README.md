# zvm

[![Join the chat at https://gitter.im/molovo/zvm](https://badges.gitter.im/molovo/zvm.svg)](https://gitter.im/molovo/zvm?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

The ZSH version manager

## Installation

> **WARNING**: Although the majority of zvm's functionality works as expected, it is in the early stages of development, and as such bugs are likely to be present. Please continue with caution, and [report any issues](https://github.com/molovo/zvm/issues) you may have.

### Requirements

* ZSH `4.3.12` or above
* git `1.9.1` or above
* GCC and Make (Installed by default on OSX. For Ubuntu, run `sudo apt-get install build-essential autoconf ncurses-dev yodl`)

### Installing with [zulu](https://zulu.sh)

Zulu will automatically install dependencies and the shell integration for you.

```sh
zulu install zvm
```

### Manual Installation

First, Install [color](https://github.com/molovo/color) and [revolver](https://github.com/molovo/revolver)

```sh
git clone https://github.com/molovo/zvm zvm
ln -s "$PWD/zvm/zvm" /usr/local/bin
echo "source $PWD/zvm/zvm-shell-integration.zsh" >> ~/.zshrc
```

By default, zvm stores the ZSH source and compiled binaries in `~/.zvm`. If you'd like to store it somewhere else, set `$ZVM_DIR` to an absolute path in `~/.zshrc` before you run zvm for the first time.

## Usage

The first time you run `zvm list`, `zvm use` or `zvm install`, zvm will check for and download the ZSH source, and set up its internal directory structure.

### Listing available versions

```sh
# List all stable versions
zvm list

# List only installed versions
zvm list --installed

# Include pre-release versions in results
zvm list --prerelease
```

### Switching versions

```sh
# Use the default version
zvm use

# Use the specified version. It will be compiled and installed if
# it hasn't been already
zvm use 5.3.1

# Show the default
zvm default

# Show the current version
zvm current

# Set the default to a new version. It will be compiled and installed if
# it hasn't been already
zvm default 4.3.12

# Install a new version without selecting it
zvm install 5.0.2
```

### Using different versions on a per-project basis

You can set the ZSH version for a specific project by running `zvm dir <version>` within the project's directory, which will create a `.zvmrc` file in the current directory. If you run `zvm use` without specifying a version in a directory with a `.zvmrc` file, it will automatically choose the version specified in `.zvmrc`.

#### Using per-project versions automatically.

Setting `ZVM_AUTO_USE=1` adds a hook which automatically changes the version when you `cd` into a directory with a `.zvmrc` file.

## License

Copyright (c) 2016 James Dinsdale <hi@molovo.co> (molovo.co)

zvm is licensed under The MIT License (MIT)

## Team

* [James Dinsdale](http://molovo.co)
