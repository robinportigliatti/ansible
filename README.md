  * `sudo -i`
  * `sudo apt install -y ansible`
  * `sudo ansible-galaxy collection install community.general`
  * `git clone git@gitlab.dalibo.info:robin/ansible.git`
  * `cd ansible`
  * En prenant l'exemple de l'utilisateur `mathieu`
  * Ajouter un dossier dans `inventories/dalibo/production/host_vars/mathieu_computer` avec un fichier `vars.yml` et `vault`
  * Ajouter une ligne dans le fichier `./inventories/dalibo/production/inventory` du même nom que le dossier précédemment créé `mathieu_computer ansible_connection=local`.
  * `ansible-playbook -i ./inventories/dalibo/production/inventory dalibo_install.yml --extra-vars="inventory_hostname=mathieu_computer"`


```
- name: "Install ora2pg from source - make install"
    ansible.builtin.shell: "git pull"
    args:
      chdir: "{{ directory }}"
    ignore_errors: yes
```
