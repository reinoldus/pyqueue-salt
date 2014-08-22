pyqueue:
  user.present:
    - home: /home/pyqueue

/home/pyqueue:
  file.directory:
  - user: pyqueue
  - group: pyqueue
  - recurse:
      - user
      - group

/home/pyqueue/pyqueue_downloads:
  file.directory:
  - user: pyqueue
  - group: pyqueue
  - recurse:
      - user
      - group

/home/pyqueue/pyqueue_ffmpeg:
  file.directory:
  - user: pyqueue
  - group: pyqueue
  - recurse:
      - user
      - group
