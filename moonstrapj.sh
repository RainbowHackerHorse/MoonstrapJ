#!/bin/sh
pmlogo() {
cat <<"EOT"

   __  ___                      __                        __
  /  |/  /___  ___   ___   ___ / /_ ____ ___ _ ___    __ / /
 / /|_/ // _ \/ _ \ / _ \ (_-</ __// __// _ `// _ \  / // / 
/_/  /_/ \___/\___//_//_//___/\__//_/   \_,_// .__/  \___/  
                                            /_/             

MoonstrapJ Version 0.2
Released under a simplified 2-clause BSD license.       
                                         
EOT
}

pmlogo

echo "This script written by Rainbow."
echo "Follow me on Twitter (or don't. I don't really care.) @RainbowHacks"
echo "The original script can always be found at http://cloudsdale.ponix.space/~rainbow/scripts/palemoonfbsd/moonstrapj.sh"                                         
echo "This script will build and initialize the jailed development environment, and automatically call moonstrap"
echo "You MUST be root to run MoonstrapJ"

echo;echo -n " Launch MoonstrapJ? (y/n)";read CHOICEMOTHERFUCKER

if [ "$CHOICEMOTHERFUCKER" == "y" ] ; then
	echo "Bootstrapping build environment"
	# here we bootstrap pkgng if it isn't already installed
	pkg
	# doing the needful!
	pkg install iocage
	iocage fetch release=10.2-RELEASE
	echo "Fetched 10.2-RELEASE. Creating Jail"
	echo;echo -n "  Enter the IPv4 Address for your jail: ";read ahorseofcourse
	echo;echo -n "  Enter the Interface for your jail: ";read stopeatingcakecelestia
	iocage create tag=moonstrapjail
	iocage set ip4_addr="$stopeatingcakecelestia|$ahorseofcourse" moonstrapjail
	iocage start moonstrapjail
	iocage exec moonstrapjail fetch --no-verify-peer https://github.com/RainbowHackz/Moonstrap/edit/Moonstrap-0.5/moonstrap.sh
	iocage exec moonstrapjail chmod +x moonstrap.sh

else
  echo "Aborting..."
fi
echo "Bootstrapping build environment"

