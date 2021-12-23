# cron

Installation of crons

## Tasks

Everything is in the `tasks/main.yml` file.

## Available variables

* `cron_schedules`: List of lines by crontab
  *  `user`: User owning the crontab
  *  `name`: Commentary
  *  `cron_file`: The file name to change
  *  `job`: The line to add
  *  `state`: The state of the line absent or present
  *  `disabled`: Tells if the line should be commented or not by true or false
  *  `minute`: The minute
  *  `hour`: The hour
  *  `day`: The day
  *  `month`: The month
  *  `weekday`: The day
