#!/usr/bin/env bash

CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACM -- '*.vala')

if \[ -n "$CHANGED_FILES" \]; then
    HIDE_HELP=true source scripts.sh;
    scripts-format;
    git add $CHANGED_FILES;
fi