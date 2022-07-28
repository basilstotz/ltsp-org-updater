.PHONY: package
package:
	@find . -name ltsp-org-updater_\*_amd64.deb -exec rm \{\} \;
	@./bin/package.sh

.PHONY: install
install:
	@sudo find . -name ltsp-org-updater_\*_amd64.deb -exec dpkg -i \{\} \;


.PHONY: copy
copy:
	@rm ~/git/edu-desktop/patch/basis/debs.d/ltsp-org-updater*.deb
	@cp ltsp-org-updater*.deb ~/git/edu-desktop/patch/basis/debs.d/.

