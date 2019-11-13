# mariadb

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.mariadb-660198.svg)](https://galaxy.ansible.com/diodonfrost/mariadb)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-mariadb.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-mariadb)

This role provide compliance for install and setup Mariadb on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.mariadb` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 6
    - 7
- name: Fedora
  versions:
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - disco
    - bionic
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
- name: FreeBSD
  versions:
    - 11.0
    - 10.4
- name: OpenBSD
  versions:
    - 6.0
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

# Add mariabd databases
# default create nothing
mariadb_database: []
#  - name: database10
#    state: present

# Add mariabd users
# default create nothing
mariadb_user: []
#  - name: user1
#    host: 127.0.0.1
#    password: secret
#    priv: '*.*:ALL'
#    encrypted: false

# Specify address to listen
mariadb_bind_address: '0.0.0.0'

# Specify tcp port to listen
mariadb_port: 3306

# Specify slow query log
mariadb_slow_query_log_enabled: false
mariadb_slow_query_time: "2"
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
If you want just configure mariadb and not install it, you can set variable 'mariadb_install' to false, do it like this:

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.mariadb
  vars:
    mariadb_install: false
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use vagrant and Virtualbox with vagrant to run tests locally. You will have to install Virtualbox and Vagrant on your system.
 For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test mariadb-103-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create mariadb-103-centos-7

# Apply ansible playbook
kitchen converge mariadb-103-centos-7

# Apply inspec tests
kitchen verify mariadb-103-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Windows
set KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test os-packaging-freebsd-11
```

## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
