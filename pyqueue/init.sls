python-pkgs:
  pkg.installed:
    - names:
      - python-pycurl
      - python-twisted
      - python-mysqldb

git:
  pkg.installed

pyqueue:
  user.present:
    - home: /home/pyqueue

