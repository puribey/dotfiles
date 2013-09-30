import os

def get_imap_password():
    cmd = "/usr/bin/security 2>&1 > /dev/null find-generic-password -ga gmail"
    line = os.popen(cmd).readline()
    passwds = line.split()
    if len(passwds) == 2:
        return passwds[1][1:-1]
    else:
        return ""
