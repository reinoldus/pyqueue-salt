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
    - password: juhg4k68bhrftzuer465FGDkhdtgfz56t56dfgz56H
    - require:
      - service: mysql
