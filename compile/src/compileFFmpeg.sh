#!/bin/bash

messageAndExit ()
{ 
	echo $1;
	exit;
}

if [ ! -f $HOME/bin/ffmpeg ]; then
	mkdir ~/ffmpeg_sources
	cd ~/ffmpeg_sources
	wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz || messageAndExit "changed=false comment='Getting yasm failed'";
	tar xzvf yasm-1.2.0.tar.gz || messageAndExit "changed=false comment='untar yasm failed'";
	cd yasm-1.2.0 || messageAndExit "changed=false comment='cd to yasm failed'";
	./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" || messageAndExit "changed=false comment='Configure of yasm failed'";
	make -j 9 || messageAndExit "changed=false comment='make of yasm failed'";
	make install || messageAndExit "changed=false comment='make install of yasm failed'";
	make distclean || messageAndExit "changed=false comment='make distclean of yasm failed'";
	. ~/.profile || messageAndExit "changed=false comment='. ~/.profile failed'";
	
	cd ~/ffmpeg_sources 
	git clone --depth 1 git://git.videolan.org/x264.git || messageAndExit "changed=false comment='cloning x264 failed'";
	cd x264 || messageAndExit "changed=false comment='cd x264 failed'"; 
	./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static || messageAndExit "changed=false comment='./configure x264 failed'";
	make -j 9 || messageAndExit "changed=false comment='make x264 failed'";
	make install || messageAndExit "changed=false comment='make install x264 failed'";
	make distclean || messageAndExit "changed=false comment='make distclean failed'";

	cd ~/ffmpeg_sources
	git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac || messageAndExit "changed=false comment='git clone fdk-aac failed'";
	cd fdk-aac || messageAndExit "changed=false comment='cd fdk-aac failed'"; 
	autoreconf -fiv || messageAndExit "changed=false comment='fdk-aac autoreconf failed'";
	./configure --prefix="$HOME/ffmpeg_build" --disable-shared || messageAndExit "changed=false comment='fdk-aac configure failed'";
	make -j 9 || messageAndExit "changed=false comment='make fdk-aac failed'";
	make install || messageAndExit "changed=false comment='make install fdk-aac failed'";
	make distclean || messageAndExit "changed=false comment='make distclean fdk-aac failed'";

	cd ~/ffmpeg_sources
	wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz || messageAndExit "changed=false comment='getting lame-3.99 failed'";
	tar xzvf lame-3.99.5.tar.gz || messageAndExit "changed=false comment='untar lame failed'";
	cd lame-3.99.5 || messageAndExit "changed=false comment='cd lame failed'";
	./configure --prefix="$HOME/ffmpeg_build" --enable-nasm --disable-shared || messageAndExit "changed=false comment='configure lame failed'";
	make -j 9 || messageAndExit "changed=false comment='make lame failed'";
	make install || messageAndExit "changed=false comment='make install lame failed'";
	make distclean || messageAndExit "changed=false comment='make distclean lame failed'";

	cd ~/ffmpeg_sources
	git clone --depth 1 git://source.ffmpeg.org/ffmpeg || messageAndExit "changed=false comment='cloning ffmpeg failed'";
	cd ffmpeg || messageAndExit "changed=false comment='cd ffmpeg failed'";
	PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" || messageAndExit "changed=false comment='Setting config ffmpeg failed'";
	export PKG_CONFIG_PATH || messageAndExit "changed=false comment='export pkg config failed failed'";
	./configure --prefix="$HOME/ffmpeg_build" \
	  --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
	  --bindir="$HOME/bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac \
	  --enable-libmp3lame --enable-libtheora --enable-libvorbis \
	  --enable-libx264 --enable-nonfree || messageAndExit "changed=false comment='congigure ffmpeg failed'";
	make -j 9 || messageAndExit "changed=false comment='make ffmpeg failed'";
	make install || messageAndExit "changed=false comment='make install ffmpeg failed'";
	make distclean || messageAndExit "changed=false comment='make distclean ffmpeg failed'";
	hash -r || messageAndExit "changed=false comment='hash -r ffmpeg failed failed'";
	. ~/.profile || messageAndExit "changed=false comment='. ~/profile ffmpeg failed'";

	
	if [  -f $HOME/bin/ffmpeg ]; then
		messageAndExit "changed=true comment='compiled successfully'";
	else
		messageAndExit "result=false changed=false comment='compile FAILED'";
	fi
fi
