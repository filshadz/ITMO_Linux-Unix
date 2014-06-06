install: TimeUI-fi.mo
yum -y install dialog
yum -y install xinetd
yum -y install nc
which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
install TimeTxt Time-fi GUI TUI /usr/local/bin
grep -q "`cat TimeTxt.services`" /etc/services || cat TimeTxt.services >> /etc/services
install TimeTxt.xinetd /etc/xinetd.d/TimeTxt
/etc/init.d/xinetd restart

ln -sf /usr/local/bin/Time-fi /usr/local/bin/nTime-fi
install TimeUI-fi.mo /usr/share/locale/fi/LC_MESSAGES/Time-fi.mo

Time-fi.pot: Time-fi
xgettext -o Time-fi.pot -L Shell Time-fi

TimeUI-fi.mo: TimeUI-fi.po
msgfmt -o TimeUI-fi.mo TimeUI-fi.po

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
