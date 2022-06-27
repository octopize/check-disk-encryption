#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    if fdesetup status | grep -qi 'off'; then
        echo "FileVault is off on macOs"
        exit 1
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if lsblk | grep 'crypt'; then
        echo "There are no encrypted partition on Linux"
        exit 1
    fi
fi
