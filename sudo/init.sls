sudo:
    pkg:
        - installed
    group:
        - present

/etc/sudoers:
    file.managed:
        - source: salt://sudo/sudoers
        - user: root
        - group: root
        - mode: 440
        - require:
            - pkg: sudo
            - group: sudo
