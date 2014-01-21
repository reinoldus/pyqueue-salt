/root/.bashrc:
  file.managed:
    - source: salt://bash/src/bashrc
    - mode: 644
    - user: root
    - group: root
