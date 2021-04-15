# Rosetta-2-install
Make a payload-free package containing a script to install Rosetta 2.

If you have `munkipkg` installed and available at `/usr/local/bin/munkipkg`, use `make` to make an unsigned payload-free package.

If you have `sign_pkg.py` available at `../jamf-upload/sign_pkg.py`, use `make; make sign` to make a signed package.

## Use in Jamf Pro
You can add this script or package to a policy that is scoped to **all computers**, because the script will do nothing if Rosetta is already installed, or when run on an Intel device.

It is recommended to target at **Enrollment Complete** and **Recurring Check-in**, **Once per Computer**. 

Use a Policy name that will be alphabetically first in your Jamf instance. We use **0001 - Install Rosetta 2**.
