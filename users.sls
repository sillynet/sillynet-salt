include:
    - sudo_group

{% for u, uinfo in pillar.get('users', {}).items() %}
{{ u }}:
    group:
        - present
    user:
        - present
        - gid_from_name: True
        - groups:
            - {{ u }}
            - sudo
        - remove_groups: False
        - home: /home/{{ u }}
        - password: {{ uinfo['password'] }}
        - enforce_password: True
        - require:
            - group: {{ u }}
            - group: sudo_group
    ssh_auth:
        - present
        - user: {{ u }}
        - name: {{ uinfo['pubkey'] }}
        - require:
            - user: {{ u }}
{% endfor %}
