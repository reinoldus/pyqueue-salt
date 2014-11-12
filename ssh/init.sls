/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/src/sshd_config
    - mode: 700
    - user: root
    - group: root

