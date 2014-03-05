#! /bin/bash
cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli select $(( (`$cli selected` + 1) % `$cli list | wc -l`))
