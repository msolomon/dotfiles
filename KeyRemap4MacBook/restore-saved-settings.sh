#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set remap.qwerty2programmerdvorak_qwerty 1
/bin/echo -n .
$cli set remap.commandR2controlL 1
/bin/echo -n .
$cli set repeat.wait 32
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set parameter.keyoverlaidmodifier_timeout 300
/bin/echo -n .
$cli set caps_lock_to_hyper_or_escape 1
/bin/echo -n .
/bin/echo
