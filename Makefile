install: Time-FI.mo
	yum -y install dialog
	yum -y install xinetd
	yum -y install nc
	install TimeTxt Main TUI GUI /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat TimeTxt.services`" /etc/services || cat TimeTxt.services >> /etc/services
	install TimeTxt.xinetd /etc/xinetd.d/TimeTxt
	/etc/init.d/xinetd restart
	
	ln -sf /usr/local/bin/Time-fi /usr/local/bin/nTime-fi
	install Time-FI.mo /usr/share/locale/fi/LC_MESSAGES/Time-fi.mo


	
Time-fi.pot: Time-fi
	xgettext -o Time-fi.pot -L Shell Main

Time-FI.mo: Time-FI.po
	msgfmt -o Time-FI.mo Time-FI.po

clone:
	git clone https://github.com/filshadz/ITMO_Linux-Unix.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags

