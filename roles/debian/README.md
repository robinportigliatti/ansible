# debian

Handle specific actions for debian

## Tasks

Tasks are extracted in several files, included in `tasks/main.yml`

* `security_manager.yml`: Update the os with securtiy updates
* `sources_list_manager.yml`: Manage the sources_list file
* `users_manager.yml`: Manage the users

## Available variables

* `debian_security_packages`: Packages list
* `debian_default_shell`: The default shell. By default "/bin/bash"
* `debian_default_home`: The default home. By default "/home"
* `debian_default_umask`: The default umask. By default "755"

* `debian_users`: List of users to add
  *  `name`: Name of the user to add
  *  `shell`:(optionnal) Shell of the user if filled. **debian_default_shell** by default
  * `groups`: (optionnal) Groups of the the user to add. Add the user to the **name** groups if not filled.
  * `home`: (optionnal) Directory of the the user's home.
  If not specified, will take the value of **debian_default_home**
  * `umask`: (optionnal) Umask of the the user's home.
  If not specified, will take the value of **debian_default_umask**

* `debian_security_templates`: List of users to add
  *  `name`: Name of the user to add

* `debian_security_templates`:
  * `src`: The name of the template in **templates**
  * `dest`: The destination on the remote

* `debian_sources_list_templates`:
  * `src`: The name of the template in **templates**
  * `dest`: The destination on the remote

* `debian_directories`: List of directories to add
  * `path`: The full path of the directory that will be created
  * `owner`: The owner
  * `group`: The group
  * `mode`: The privileges
