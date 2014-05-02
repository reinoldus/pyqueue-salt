base:
  '*':
    - users
    - compile.aria2
    - compile.ffmpeg
    - nginx
    - nginx.website
    - mysql
    - pyqueue
    - pyqueue.github
    - pyqueue.filedescriptor

  'os:Debian':
    - apt
