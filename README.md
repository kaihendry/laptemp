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

run `make`

<img width=640 height=480 src=http://r2d2.webconverger.org/2012-12-27/temp.png>

	$ du -sh temp.{png,svg}
	44K     temp.png
	232K    temp.svg

# Zooming

<video controls width=640 height=360>
<source src=http://r2d2.webconverger.org/2013-01-19/gnuplot-zoom.webm type=video/webm>
<source src=http://r2d2.webconverger.org/2013-01-19/gnuplot-zoom.mp4 type=video/mp4>
</video>

	gnuplot -p temp.gnu

And use the **right mouse button** to select regions, as the [GNUplot video demonstrates](http://r2d2.webconverger.org/2013-01-19/gnuplot-zoom.html).

# Selecting ranges

Between two days ago and yesterday:

	awk -v a="$(date -d '2 days ago' +%s)" -v b="$(date -d 'yesterday' +%s)" '{ if ($1 >= a && $1 <= b) print  }' temp.csv

Last two days and now:

	awk -v a="$(date -d '2 days ago' +%s)" -v b="$(date +%s)" '{ if ($1 >= a && $1 <= b) print  }' temp.csv

# Temperatures indicates if there is a

* kernel problem
* hardware issue (deployed in a place without any air circulation)
* load issue

# Acknowledgements

* http://stackoverflow.com/questions/14314895/
* jayne on #gnuplot Freenode IRC
