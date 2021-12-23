# pki

Handle specific actions for private key infrastructure

## Tasks

* `pki_generator.yml`: Generate private and public key via the role `ssh`. Often used on the remote ansible server

## Available variables

* `pki_users`: List of users having a private key infrastucture
  * `name`: The name of the users
  * `folder`: The folder containing the public and private key. Often located in "/etc/pki/<name>/.ssh"
  * `id_rsa_file_path`: The full path of the private key. "/etc/pki/<name>/.ssh/id_rsa"
