# Rosetta-2-install

This script checks that the computer on which it is running has an Apple Silicon processor. If it is, it checks whether Rosetta 2 is installed. If it is not installed, it will check for a network connection and then proceed to install Rosetta 2.

## Payload-free package

You may wish to make a payload-free package containing a script to install Rosetta 2.

If you have `munkipkg` installed and available at `/usr/local/bin/munkipkg`, use `make` to make an unsigned payload-free package. Note that you should compile the computer on an Apple Silicon Mac to get a universal package, which you are obviously going to need!

I have also included a signed package in the Releases section of this repo.

### Signing the package

You may wish to sign the package for use in DEP enrollment. I have a script in the [Jamf-Upload](https://github.com/grahampugh/jamf-upload) repo to help with this.

Clone the Jamf-Upload repo to the same folder that contains this repo's folder.

You also need AutoPkg to be installed to use this script, and you need to add your Developer ID Installer certificate in your login keychain.

Once you have met these requirements, use `make; make sign` to make a signed package.

## Use in Jamf Pro

You can add this script (or package) to a policy that is scoped to **All Computers**, because the script will do nothing if Rosetta is already installed, or when run on an Intel device.

It is recommended to target at **Enrollment Complete** and **Recurring Check-in**, **Once per Computer**.

Use a Policy name that will be alphabetically first in your Jamf instance. We use **0001 - Install Rosetta 2**.
