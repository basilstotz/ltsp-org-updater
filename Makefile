.PHONY: install
install: package
	@find . -name ltsp-updater_\*_amd64.deb -exec dpkg -i \{\} \;



.PHONY: package
package:
	@find . -name ltsp-updater_\*_amd64.deb -exec rm \{\} \;
	@./bin/package.sh
