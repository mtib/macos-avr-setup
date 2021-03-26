# MacOS AVR Setup

Simple setup script to install and uninstall AVR tools.

## Usage

### One-liner

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/mtib/macos-avr-setup/main/install.sh | bash
```

### Manual

Download this repository and run `install.sh`.

## Included Programs

- avr-gcc
- avr-g++
- avrdude
- ... and many more

## Usage

After installing the necessary tools paths used for configuring [AVR Helper](https://marketplace.visualstudio.com/items?itemName=Alex079.vscode-avr-helper) are printed.

1. avr-gcc executable: `$HOME/.avr/bin/avr-gcc`
1. avrdude executable: `$HOME/.avr/bin/avrdude`
1. avrdude config: `$HOME/.avr/etc/avrdude.conf`
1. (you normally don't need any additional source library)
1. remember to change the [C/C++ Extension](https://code.visualstudio.com/docs/languages/cpp)'s target from *Mac* to *AVR* in the bottom right