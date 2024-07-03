#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "picom" --experimental-backend
# run "" &#!/bin/bash

