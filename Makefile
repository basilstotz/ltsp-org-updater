.PHONY: package
package:
	@find . -name ltsp-org-updater_\*_amd64.deb -exec rm \{\} \;
	@./bin/package.sh

.PHONY: install
install: package
	@sudo find . -name ltsp-org-updater_\*_amd64.deb -exec dpkg -i \{\} \;

