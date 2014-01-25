mypkgs:
  pkg.installed:
    - pkgs: 
      - g++
      - make

/root/OptionHandlerFactory.diff:
  file.managed:
    - source: salt://compile/src/OptionHandlerFactory.diff
    - mode: 700
    - user: root
    - group: root

/root/compileAria.sh:
  file.managed:
    - source: salt://compile/src/compileAria.sh
    - mode: 700
    - user: root
    - group: root

aria2:
  cmd.run:
    - name: /root/compileAria.sh
    - stateful: True
