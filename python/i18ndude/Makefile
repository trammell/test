
clean:
	rm -f *.pot *.po

all:
	rm -f *.pot *.po
	make myapp.pot myapp-fr.po

pot myapp.pot:
	touch myapp.pot
	i18ndude rebuild-pot --pot myapp.pot --create myapp foo

synch sync myapp-fr.po:
	touch myapp-fr.po
	i18ndude sync --pot myapp.pot myapp-fr.po

