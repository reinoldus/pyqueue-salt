#!/bin/bash

messageAndExit ()
{ 
	echo $1;
	exit;
}

if [ ! -f /usr/local/bin/aria2c ]; then
	cd /root
	wget http://sourceforge.net/projects/aria2/files/latest/download || messageAndExit "changed=false comment='getting aria2 failed'";
	mv download aria2.tar.bz2 || messageAndExit "changed=false comment='renaming tar failed'";
	tar -xvjf aria2.tar.bz2 || messageAndExit "changed=false comment='extracing failed'";
	rm aria2.tar.bz2
	cd aria2-* || messageAndExit "changed=false comment='switching to aria2 dir failed'";
	cd src || messageAndExit "changed=false comment='switching to src failed'"; 
	patch < /root/OptionHandlerFactory.diff || messageAndExit "changed=false comment='patching failed'";

	cd ..
	./configure || messageAndExit "changed=false comment='configure failed'";
	make -j 9 || messageAndExit "changed=false comment='make failed'";
	make install || messageAndExit "changed=false comment='make isntall failed'";
	
	if [ -f /usr/local/bin/aria2c ]; then
		messageAndExit "changed=true comment='compiled successfully'";
	else
		messageAndExit "result=false changed=false comment='compile FAILED'";
	fi
fi
