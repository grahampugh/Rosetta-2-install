#!/bin/bash

: << DOC
Determine whether Rosetta is installed - install if not. 
DOC

# is this an ARM Mac?
arch=$(/usr/bin/arch)
if [ "$arch" == "arm64" ]; then
    echo "This is an arm64 Mac."
    # is Rosetta 2 installed?
    if arch -x86_64 /usr/bin/true 2>/dev/null ; then
        echo "Rosetta 2 is already installed"
    else
        echo "Rosetta 2 is missing - installing"
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
        if arch -x86_64 /usr/bin/true 2>/dev/null; then
            echo "Rosetta 2 is now installed"
        else
            echo "Rosetta 2 installation failed"
            exit 1
        fi
    fi
else
    echo "This is an Intel Mac."
fi

exit 0