# Rosetta-2-install
Make a payload-free package containing a script to install Rosetta 2.

If you have `munkipkg` installed and available at `/usr/local/bin/munkipkg`, use `make` to make an unsigned payload-free package.

If you have `sign_pkg.py` available at `../jamf-upload/sign_pkg.py`, use `make; make sign` to make a signed package.
