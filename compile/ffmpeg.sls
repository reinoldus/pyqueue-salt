ffmpegpkgs:
  pkg.installed:
    - pkgs: 
      - autoconf
      - automake
      - build-essential
      - git
      - libass-dev
      - libgpac-dev
      - libtheora-dev
      - libtool
      - libvorbis-dev
      - libxext-dev
      - pkg-config
      - texi2html
      - zlib1g-dev
      - nasm

/home/pyqueue/compileFFmpeg.sh:
  file.managed:
    - source: salt://compile/src/compileFFmpeg.sh
    - mode: 700
    - user: pyqueue
    - group: pyqueue

ffmpeg:
  cmd.run:
    - name: /home/pyqueue/compileFFmpeg.sh
    - user: pyqueue
    - stateful: True

