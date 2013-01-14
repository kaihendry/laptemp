# Creating temp.csv

You need to save the SSH socket details from ssh-agent, like so in your [.xinitrc](https://github.com/kaihendry/Kai-s--HOME/blob/master/.xinitrc):

	SSH_ENV=$HOME/.ssh/environment
	ssh-agent > ${SSH_ENV}
	chmod 600 ${SSH_ENV}
	. ${SSH_ENV} > /dev/null

Then you echo epoch, temperature & your kernel identifier like so:

	#!/bin/bash
	SSH_ENV=$HOME/.ssh/environment
	. ${SSH_ENV} > /dev/null
	echo $(date +%s) $(cat /sys/class/thermal/thermal_zone0/temp) $(uname -r) $(cat /proc/loadavg) |
	ssh REMOTE_HOST 'cat - >> /srv/www/r2d2.webconverger.org/2012-12-27/temp.csv'

Save that to [~/bin/temp](https://github.com/kaihendry/Kai-s--HOME/blob/master/bin/temp) and run it from cron like so:

	*/5 * * * * ID=temp ~/bin/temp >> /tmp/temp.log 2>&1

Every 5 minutes.

# Plotting temp.csv

http://i.stack.imgur.com/zLJkL.png

http://stackoverflow.com/questions/14314895/


# Acknowledgements

* http://stackoverflow.com/users/1331399/thor
