# MacOS AVR Setup

Simple setup script to install and uninstall AVR tools.

## How it works

This script downloads the Arduino.app for Mac and extracts required programs into the `~/.avr` directory. You can then point your editors or terminals to use these binaries to support running AVR tools on (M1) macs.

## Requirements

Before running this script, make sure you have required programs installed.
Run the following command in the terminal.
You will be asked to write and confirm your password.

```sh
# curl & other command-line-tools
xcode-select --install

# fallback for x86_64 programs
softwareupdate --install-rosetta --agree-to-license
```

### One-liner

Paste this one-liner in the Terminal and press return. It will download the script found in this repository and run it. Follow the directions printed.

```sh
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/mtib/macos-avr-setup/main/install.sh | bash
```

### Manual

Download or clone this repository and run `zsh install.sh` in a terminal. Follow instructions given on output.

## Included Programs

All binaries and configs included in the Arduino.app are extracted and placed into `~/.avr/bin`.

- avr-gcc
- avr-g++
- avrdude

_... and many more_

## Usage

After installing the necessary tools paths used for configuring [AVR Helper](https://marketplace.visualstudio.com/items?itemName=Alex079.vscode-avr-helper) are printed in the console.
To install the AVR Helper extension for [VSCode](https://code.visualstudio.com/) install VSCode, then search for AVR Helper in the _Extensions_ sidebar.

After installing the Extension a dialog will come up asking for the locations of the following tools, point them to the newly installed binaries:

1. avr-gcc executable: `$HOME/.avr/bin/avr-gcc`
1. avrdude executable: `$HOME/.avr/bin/avrdude`
1. avrdude config: `$HOME/.avr/etc/avrdude.conf`
1. _(you normally don't need any additional source library)_
1. remember to change the [C/C++ Extension](https://code.visualstudio.com/docs/languages/cpp)'s target from *Mac* to *AVR* in the bottom right (this makes constants and linting <i>work</i>️™️)

## FAQ

1. **Where, what and why is `~/.avr`?**
    
    `~/.avr` and `$HOME/.avr` and `/Users/<yourname>/.avr` are all the same location. After running the script found in this repository, is a folder containing binaries and configuration files in a POSIX-style structure. If you look for it in Finder it will be hidden. Either [show hidden files](https://www.macworld.co.uk/how-to/show-hidden-files-mac-3520878/) or open it directly with `open ~/.avr`.

    I decided to place these files there because I didn't want to make any assumptions about your prefered package-manager or state of `.local` or `.config`. If you don't like the location of the files just rename or move `.avr` to anywhere else. Remember to update the paths given to other programs.

1. **Why did it suddenly break?**

    Apple sometimes decides to uninstall some command-line-tools after updates. If you encounter this all you need to do is run `xcode-select --install` in a terminal again and follow instructions.

    If this happens too often to you, consider installing those CLI-tooks using [Homebrew](https://brew.sh/).

1. **Do I have to use VSCode?**

    No. All this script does is to place AVR binary tools at a user-space location without requiring a package-manager by extracting them from the official Arudino.app. It is set up in a way to make it easy to interface with the [AVR Helper](https://marketplace.visualstudio.com/items?itemName=Alex079.vscode-avr-helper) and [C/C++ Extension](https://code.visualstudio.com/docs/languages/cpp) extensions to enable VSCode commands to lint, compile and flash programs to attached devices.

    If you want to use the binaries directly in the terminal emulator all you need to do is add `$HOME/.avr` to your [`PATH` environment variable](https://en.wikipedia.org/wiki/PATH_(variable)). Add `PATH="$HOME/.avr:$PATH"` to `.zshenv`, `.profile` or `.bashrc` depending on your setup.

1. **I am from the future, the binaries are old!**

    Hello, hope you live in a better world than we do right now. Look for the `curl` command in `install.sh` found in the repository and change the URL to a newer Arduino.app version. Feel free to shoot me a PR so other people can benefit from your effort.

1. **The script fails, what's going on?**

    Idk. Delete `~/.avr` with `rm -rf ~/.avr` in the Terminal, retry and hope for the best. I don't use this anymore – so I'm not maintaining it actively. If you are interested in maintaining this script, repository, or making a portable version of this to work with [Homebrew](https://brew.sh/) be my guest and contact me.

Any other questions / issues? Feel free to create an issue on the Github repository. I'll get a notification immediately, but can't guarantee that I will respond in any timeframe or at all.