/home/pyqueue/.ssh:
  file.directory:
    - user: pyqueue
    - group: pyqueue
    - mode: 700
    - makedirs: True

/home/pyqueue/.ssh/keyfiles:
  file.directory:
    - user: pyqueue
    - group: pyqueue
    - mode: 700
    - makedirs: True

/home/pyqueue/.ssh/config:
  file.managed:
    - source: salt://pyqueue/src/config
    - mode: 700
    - user: pyqueue
    - group: pyqueue

/home/pyqueue/.ssh/keyfiles/git.ssh:
  file.managed:
    - source: salt://pyqueue/src/git.ssh
    - mode: 600
    - user: pyqueue
    - group: pyqueue

github:reinoldus/pyqueue-client.git:
  git.latest:
    - name: github:reinoldus/pyqueue-client.git
    - rev: master
    - target: /home/pyqueue/pyqueue/
    - runas: pyqueue
