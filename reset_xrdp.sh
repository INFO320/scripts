#!/bin/bash
# reset_xrdp.sh
# Author: Caleb Thorsteinson
#
# Description:  This scipts job is to reset the xrdp service on the system and
# kill any existing sessions if some problem occurs.  The only reason that this
# script should be run is if the first xrdp connection uses some odd settings
# that don't work well with other operating systems

WARNING_MESSAGE="WARNING
If you are currently using a remote desktop then continuing will log you out
from this instance.  Any processes that are running through the XFCE will be
killed.

If you want to continue enter y" 

echo "$WARNING_MESSAGE"

read RESPONSE

if [ "$RESPONSE" == "y" ]
then
	sudo killall Xvnc && \    # Kills any running session
	sudo service xrdp restart # Restarts the xrdp server
fi 
