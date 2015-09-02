#!/bin/sh
pmlogo() {
cat <<"EOT"

   __  ___                      __                        __
  /  |/  /___  ___   ___   ___ / /_ ____ ___ _ ___    __ / /
 / /|_/ // _ \/ _ \ / _ \ (_-</ __// __// _ `// _ \  / // / 
/_/  /_/ \___/\___//_//_//___/\__//_/   \_,_// .__/  \___/  
                                            /_/             

MoonstrapJ Version 0.1
Released under a simplified 2-clause BSD license.       
                                         
EOT
}

pmlogo

echo "This script written by Rainbow."
echo "Follow me on Twitter (or don't. I don't really care.) @RainbowHacks"
echo "The original script can always be found at http://cloudsdale.ponix.space/~rainbow/scripts/palemoonfbsd/moonstrapj.sh"                                         

echo "Bootstrapping build environment"

echo "Please be aware that as of right now, this will not execute Moonstrap"
echo "However, it will download Moonstrap within the jail and prep it to execute"
echo "You will need to log in with iocage console moonstrapjail and run ./moonstrap.sh"

# here we bootstrap pkgng if it isn't already installed
pkg
# doing the needful!
pkg install iocage
iocage fetch release=10.2-RELEASE
echo "Fetched 10.2-RELEASE. Creating Jail"
echo;echo -n "  Enter the IPv4 Address for your jail: ";read censoredvariable1
echo;echo -n "  Enter the Interface for your jail: ";read censoredvariable2
iocage create tag=moonstrapjail
iocage set ip4_addr="$censoredvariable2|$censoredvariable1" moonstrapjail
iocage start moonstrapjail
iocage exec moonstrapjail fetch http://cloudsdale.ponix.space/~rainbow/scripts/palemoonfbsd/moonstrap.sh
iocage exec moonstrapjail chmod +x moonstrap.sh
