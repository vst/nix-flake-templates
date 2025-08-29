# Haskell Tinker Shell

A minimal [Nix Flake](https://nixos.wiki/wiki/Flakes) that gives a ready-to-use
Haskell environment for quick experiments.

No Cabal or Stack required -- just single-file Haskell with libraries and tools.

## Features

- **GHC** wrapped with useful libraries (such as `aeson`, `autodocodec`, `text`,
  `bytestring`)
- **Haskell Language Server (HLS)** for editor support
- **ghcid** for instant reload feedback loop
- **fourmolu** for formatting
- **hlint** for linting

## Usage

Enter the development shell:

```sh
nix develop
```

Check versions:

```sh
ghc --version
ghci --version
haskell-language-server --version
```

Show package list:

```sh
ghc-pkg list
```

Run a Haskell file directly:

```sh
runghc Hebele.hs
```

Start interactive REPL with libraries preloaded:

```sh
ghci
```

Use `ghcid` for fast feedback:

```sh
ghcid -r Hebele.hs
```

This will reload on every save and run `main`.

Format code:

```sh
fourmolu -i Hebele.hs
```

Lint code:

```sh
hlint Hebele.hs
```

## Philosophy

This is a **development shell** for tinkering, prototyping, experimenting or
exploring Haskell.

When your code grows into a real project, you can still use this flake with
`cabal` or `stack`. But you will likely want to create a proper project
structure using a Haskell Nix template.
