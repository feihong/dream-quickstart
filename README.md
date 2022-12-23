# Feihong's Dream quickstart

## Prerequisites

Answer yes when it asks you `Do you want opam to modify ~/.zshrc?`.

    asdf plugin-add opam
    asdf install opam latest
    asdf global opam latest
    opam init # might take a while
    eval $(opam env)
    opam install dune merlin ocaml-lsp-server odoc ocamlformat utop dune-release

To see what switches are available, run `opam switch list-available`.

## Links

- [Get Up and Running With OCaml](https://ocaml.org/docs/up-and-running)
