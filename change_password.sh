#! /bin/bash

# Clear the scroll-back buffer
reset

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Get the old password
echo "Please Enter Current Password"
read oldPass
echo ""
echo "Please Confirm Current Password"
read oldConf

# Lets get the password
echo ""
echo "Please Enter New Password"
read pass

# Lets get the confirmation
echo ""
echo "Confirm Password"
read conf

# Ensures that both arguments are equal
# Ensures (by virtue of above check) that the password is not a blank string.
if [ "$pass" != "$conf" ] || [ "$oldPass" != "$oldConf" ]; then
   echo "Entered passwords are not equal"
   exit 1
fi

echo ""
echo ""

read -p "This script will log you out and  reboot the server. Save all work. Press [ENTER] to confirm $pass as your password."

# Change password for user student
echo "student:$pass" | chpasswd

# Change the password in tomcat to match
sed -i -e s/$oldPass/$pass/ /etc/tomcat7/tomcat-users.xml

# Create script which starts the singular rdp session at boot. 
# XRDP is limited to only a single session  by /etc/xrdp/sesman.ini
# This script is started at boot by /etc/rc.local
echo "#! /bin/bash" > .startses.sh
echo "/usr/bin/xrdp-sesrun 127.0.0.1 student $pass 1024 768 24" >> .startses.sh
# Permissions only to root
chmod 770 .startses.sh

# Reboot server to ensure login credentials are in sync
# Xrdp will break if the credentials fall out of sync. Modify the script above via ssh to fix this issue.



# Bye World!
reboot
