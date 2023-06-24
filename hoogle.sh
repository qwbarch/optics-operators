#!/usr/bin/env bash
ENABLE_INDEXING=true nix develop --impure --command hoogle server --local -p 3001
