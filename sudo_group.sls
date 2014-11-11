sudo_group:
    group:
        - name: sudo
        - present
        - members:
            {{ pillar.get('users', {}).keys() }}
