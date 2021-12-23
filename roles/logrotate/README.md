# logrotate

Handle specific actions for debian

## Tasks

Tasks are extracted in several files, included in `tasks/main.yml`

* `logrotate_files_manager.yml`: Manage the logrotate files using `logrotate_files` var and `logrotate.j2` template
* `prerequisites.yml`: Manage prerequisites for logrotate to run correctly

## Available variables

* `logrotate_owner`: Owner of the files located in `logrotate_files_destination`
* `logrotate_group`: Group owner of the files located in `logrotate_files_destination`
* `logrotate_files_destination`: Destination of the files
* `logrotate_files`: List of logrotate files
  * `name`: Name of the logrotate file
  * `regex`: The regex for logrotate to run
  * `configuration`: Multiline configuration contained in { }
