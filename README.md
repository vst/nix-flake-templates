# Nix Flake Templates

<!--toc:start-->
- [Nix Flake Templates](#nix-flake-templates)
  - [`trivial` &mdash; A Basic Nix Flake Template](#trivial-mdash-a-basic-nix-flake-template)
  - [`python-script` &mdash; A Python Program Script Template](#python-script-mdash-a-python-program-script-template)
<!--toc:end-->

## `trivial` &mdash; A Basic Nix Flake Template

This template does nothing much. It demonstrates how to create a Nix Flake for
multiple target systems using [flake-utils].

Use the template:

```sh
nix flake init --template github:vst/nix-flake-templates#trivial
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/trivial" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/trivial
```

## `python-script` &mdash; A Python Program Script Template

This template turns a Python script into an executable program as Nix Flake
output.

Use the template:

```sh
nix flake init --template github:vst/nix-flake-templates#python-script
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/python-script" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/python-script
```

<!-- REFERENCE -->

[flake-utils]: https://github.com/numtide/flake-utils
