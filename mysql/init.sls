mysql-server:
  pkg:
    - installed
    - pkgs:
      - mysql-server
      - python-mysqldb
  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
  mysql_user:
    - present
    - name: root
    - password: {{ pillar['mysql']['password'] }}
    - connection_pass: {{ pillar['mysql']['password'] }}
    - require:
      - service: mysql
