/etc/pam.d/su:
  file.managed:
    - source: salt://pyqueue/src/su
    - mode: 644
    - user: root
    - group: root

/etc/security/limits.conf:
  file.managed:
    - source: salt://pyqueue/src/limits.conf
    - mode: 644
    - user: root
    - group: root

/etc/sysctl.d/zmq.conf:
  file.managed:
    - source: salt://pyqueue/src/zmq.conf
    - mode: 644
    - user: root
    - group: root

