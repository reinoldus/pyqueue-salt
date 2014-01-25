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

/home/pyqueue/.ssh/known_hosts:
  file.managed:
    - user: pyqueue
    - group: pyqueue
    - mode: 600
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

github.com:
  ssh_known_hosts:
    - present
    - user: pyqueue
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48

github:reinoldus/pyqueue-client.git:
  git.latest:
    - name: github:reinoldus/pyqueue-client.git
    - rev: master
    - target: /home/pyqueue/pyqueue/
    - runas: pyqueue
