# Kali Scripts
Just some scripts I like to use.... penetration testing, bug bounties, OSCP, etc.

Enjoy!

----------------
## General Kali Stuff
- **setup-kali.sh**: Configuring Kali Linux after a stock installation.   *This is probably the script you came here for...*
- **kali-macbook.sh**: Fix some small things (wifi, tilde, etc) when running natively on a Macbook.
- **sqlmap-burp.sh**: Starts the API listener to use Burp Suite's sqlmap plugin.

## Enumeration
- **oscp-scan.sh**:  Reads IP addresses from a single file and looks for potential entry points. If you're building a custom OSCP script, perhaps this will give you some ideas. Not that handy in the real world, as there are way better tools available.
- **sub-recon.sh**: Leverages tools like enumall.py (recon-ng), cewl, etc to do some hardcore subdomain enumeration. Useful for a penetration test or for hunting bug bounties.

## Passwords
- **sort-hash.sh**: This file has a few commands I've used when parsing password dumps.
