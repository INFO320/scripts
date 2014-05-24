scripts
=======

A collection of utility scripts that help with tasks on the server

Executing
---------

Whenever you run these scripts, make sure that you are in the home directory, /home/student.  If you aren't in the home directory, that can cause some very odd behavior.

You can enter the home directory by entering the following in a terminal:

    cd

[change_password.sh](https://github.com/INFO320/scripts/blob/master/change_password.sh)
------------------

This is the first thing that should be run on your server when you get access to it.  For security purposes, it is extremely important to change your password so that other teams, (or even random people on the web), can't access your server and muk around.

This changes your password both as a user on the server, and as a user of tomcat.  So when you log into the Solr Admin panel, you will use the exact same password that you use to access the server

[delete_solr_index.sh](https://github.com/INFO320/scripts/blob/master/delete_solr_index.sh)
--------------------

This is used to wipe your index.  It's just a few http requests using curl.

*WARNING:* If you do decide to do this, know that your data may not be recoverable.  You will likely be using this frequently in the beginning as you test your configuration, but this is something that you absolutely do not want to do when you have things up and running.

[reset_xrdp.sh](https://github.com/INFO320/scripts/blob/master/reset_xrdp.sh)
-------------

This script should be executed only if your having issues trying to start a remote desktop session on the the server.  [You can find more](http://info320.pbworks.com/w/page/78749645/Connecting%20to%20Your%20Server) by looking at the wiki.  The important thing that this script does is reset any currently running xrdp session and start a new one with the following settings:

- 1024x768 Resolution
- 24 bit color depth

These are the settings you should be using for connecting, and if you don't, then you will have problems.

[run_nutch.sh](https://github.com/INFO320/scripts/blob/master/run_nutch.sh)
------------

This script is a nicer way of run a crawl.  It has several parameters that are [outlined and explained on the wiki](http://info320.pbworks.com/w/page/78352784/Nutch%20FAQ)

[run_proxy.sh](https://github.com/INFO320/scripts/blob/master/run_proxy.sh)
------------

This is an extremely small script that just runs the proxy as the nodejs user.  It's important that it runs as this user for security purposes.

[solr_query.py](https://github.com/INFO320/scripts/blob/master/solr_query.py)
-------------

Allows you to perform queries and get results from the command line.  It's probably better to use the administration panel, but you have the option

[solr_showall.py](https://github.com/INFO320/scripts/blob/master/solr_showall.py)
---------------

This will dump and show absolutely everything in your index.  Be careful, because your index can be quite large.  Only use this when you know you have a small index (< 1000 documents).
