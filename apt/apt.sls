/etc/apt/preferences:
  file.managed:
    - source: salt://apt/src/preferences
    - mode: 644
    - user: root
    - group: root

/etc/apt/sources.list:
  file.managed:
    - source: salt://apt/src/sources.list
    - mode: 644
    - user: root
    - group: root

