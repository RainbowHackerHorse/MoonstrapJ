# MoonstrapJ
MoonstrapJ is a script to automate the creation of the iocage jail for Moonstrap.
MoonstrapJ is to be called on the host, which will initialize iocage, your build jail, and 
will download Moonstrap within the jail. You must run Moonstrap 0.4 manually within
the jail by calling ./moonstrap.sh after iocage initializes the console.

In 0.2, MoonstrapJ should be able to automate the entire process.

This script has only been tested to work with FreeBSD 10.2-RELEASE

YOU MUST RUN MOONSTRAPJ AS ROOT OR IT WILL NOT WORK.
