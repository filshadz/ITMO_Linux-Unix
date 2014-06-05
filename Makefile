install: timeTxt_ui-fi.mo
	install timeTXT timeTxt_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat timeTXT.services`" /etc/services || cat timeTXT.services >> /etc/services
	install timeTXT.xinetd /etc/xinetd.d/timeTXT
	ln -sf /usr/local/bin/timeTxt_ui /usr/local/bin/ntimeText_ui
	install timeTxt_ui-fi.mo /usr/share/locale/fi/LC_MESSAGES/timeTxt_ui.mo

timeTxt_ui.pot: timeTxt_ui
	xgettext -o timeTxt_ui.pot -L Shell timeText_ui

timeTxt_ui-fi.mo: timeTxt_ui-fi.po
	msgfmt -o timeTxt_ui-fi.mo timeTxt_ui-fi.po

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

