PHONY: all
all: package copy

.PHONY: package
package:
	@find . -name ltsp-org-updater_\*_amd64.deb -exec rm \{\} \;
	@./bin/package.sh



.PHONY: copy
copy: package
	@rm ~/git/edu-desktop/patch/basis/debs.d/ltsp-org-updater*.deb || true
	@cp ltsp-org-updater*.deb ~/git/edu-desktop/patch/basis/debs.d/.

