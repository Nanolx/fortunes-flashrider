SHELL=/bin/bash

PREFIX = "/usr"
INSTALLDIR = "/share/games/fortunes"
DATADIR = "$(PREFIX)$(INSTALLDIR)"

BASEFILES_PROLINUX := \
       1999.06 1999.10 1999.12\
       2000.01 2000.02 2000.03 2000.04 2000.06 2000.07 2000.08\
       2002.10 2002.11\
       2007.05 2007.06 2007.07 2007.08 2007.09\
       2008.04 2008.08 2008.12\
       2009.01 2009.02 2009.03 2009.04 2009.05 2009.06 2009.07 2009.08 2009.09 2009.10 2009.11 2009.12\
       2010.01 2010.02 2010.03 2010.04 2010.05 2010.06 2010.07 2010.08 2010.09 2010.11 2010.12\
       2011.01 2011.02 2011.03 2011.04 2011.05 2011.06 2011.08 2011.09 2011.10 2011.11 2011.12\
       2012.01\
       2013.02\
       2015.04

BASEFILES_OPENPRESSE := \
       sprachkurse pressestimmen breakingnews\
       geek2dau programmhinweise 10dinge foren\
       vermischtes gnome readme siekennendas irc

BASEFILES_LINUXFORUM := \
       witze signaturen dau vertipper nicks\
       vermischtes linuxforen ostereier

all: clean
	@echo -ne "GermanBash Cookies:\t"
	@strfile germanbash germanbash.dat | grep strings | gawk '{print $$3}'
	@echo -ne "Wii Homebrew Cookies:\t"
	@strfile whb whb.dat | grep strings | gawk '{print $$3}'
	@for FILE in $(BASEFILES_PROLINUX); do \
		cat prolinux/$$FILE >> prolinux/prolinux ;\
	done
	@echo -ne "ProLinux Cookies:\t"
	@strfile prolinux/prolinux prolinux/prolinux.dat | grep strings | gawk '{print $$3}'
	@for FILE in $(BASEFILES_OPENPRESSE); do \
		cat openpresse/$$FILE >> openpresse/openpresse ;\
	done
	@echo -ne "OpenPresse Cookies:\t"
	@strfile openpresse/openpresse openpresse/openpresse.dat | grep strings | gawk '{print $$3}'
	@for FILE in $(BASEFILES_LINUXFORUM); do \
		cat linuxforum/$$FILE >> linuxforum/linuxforum ;\
	done
	@echo -ne "LinuxForum Cookies:\t"
	@strfile linuxforum/linuxforum linuxforum/linuxforum.dat | grep strings | gawk '{print $$3}'

clean:
	@rm -f germanbash{.dat,~}
	@rm -f whb{.dat,~}
	@rm -f prolinux/{*.dat,prolinux,*~}
	@rm -f openpresse/{*.dat,openpresse,*~}
	@rm -f linuxforum/{*.dat,linuxforum,*~}
	@rm -f linuxforum/{*.dat,linuxforum,*~}

install:
	@mkdir -p $(DESTDIR)$(DATADIR)
	@cp -v germanbash{,.dat} $(DESTDIR)$(DATADIR)
	@cp -v whb{,.dat} $(DESTDIR)$(DATADIR)
	@cp -v prolinux/prolinux{,.dat} $(DESTDIR)$(DATADIR)
	@cp -v openpresse/openpresse{,.dat} $(DESTDIR)$(DATADIR)
	@cp -v linuxforum/linuxforum{,.dat} $(DESTDIR)$(DATADIR)

uninstall:
	@rm -f $(DESTDIR)$(DATADIR)/germanbash*
	@rm -f $(DESTDIR)$(DATADIR)/whb*
	@rm -f $(DESTDIR)$(DATADIR)/prolinux*
	@rm -f $(DESTDIR)$(DATADIR)/openpresse*
	@rm -f $(DESTDIR)$(DATADIR)/linuxforum*
