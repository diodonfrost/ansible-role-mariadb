# mariadb

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.mariadb-660198.svg)](https://galaxy.ansible.com/diodonfrost/mariadb)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-mariadb.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-mariadb)

This role provide compliance for install and setup forwarding on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.mariadb` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 6
    - 7
- name: Fedora
  versions:
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - bionic
    - artful
    - xenial
    - trusty
    - precise
- name: opensuse
  versions:
    - all
- name: OracleLinux
  versions:
    - 7
- name: Amazon
  versions:
    - 2017.12
```

## Role Variables

```yaml
---
# defaults file for ansible-role-mariadb

# Install Mariadb.
# Default is true.
mariadb_install: true

# Specify repository origin for Mariadb.
# Options are 'mariadb_repository' or 'os_repository'.
# Default is mariadb_repository.
# OS supported with mariadb_repository:
# Redhat/CentOS 6,7
# Debian 8,9
# Ubuntu 18.04, 17.10, 16.04, 14.04
install_from: mariadb_repository

# Specifie version of mariadb (http://yum.mariadb.org/)
mariadb_version: 10.3

# Debian apt repository key id
debian_repository_id: ['0xF1656F24C74CD1D8', '0xcbcb082a1bb943db']

# Ubuntu apt repository key id
ubuntu_repository_id: ['0xF1656F24C74CD1D8', '0xcbcb082a1bb943db']

```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy mariadb role in a localhost and installing the open source version of mariadb.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.mariadb
```

## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
