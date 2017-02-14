#! /usr/bin/env bash

cat snippets/header.ps
cat data.ps
cat snippets/body.ps
tail -n +2 data.sol
cat snippets/footer.ps
