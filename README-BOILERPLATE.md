# Haskell template

This is a Haskell project template based on Cabal and Nix.

The nix shell provides the Haskell Language Server, hlint, fourmolu and weeder.

## Usage

First,

- Change occurances to "my-project" with your project name in my-project.cabal and flake.nix.
- Rename my-project.cabal file accorning to your project name.

Then, run nix develop and start code editor. If using VSCode you might need to install the Haskell plugin to interact with HLS.

```
$ nix develop
$ code .
# you can open a terminal inside your code editor and run:
# To get a REPL : cabal repl
# To get interactive feedback : ghcid
```