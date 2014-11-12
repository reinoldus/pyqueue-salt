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
#  mysql_user:
#    - present
#    - name: root
#    - password: ''
#    - connection_pass: ''
#    - allowpassword_less: True
#    - require:
#      - service: mysql
