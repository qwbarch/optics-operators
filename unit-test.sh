#!/usr/bin/env bash
nix develop --command ghcid --command "cabal repl test/Main.hs --ghc-option='-Werror'" --test "main" --restart optics-operators.cabal -W
