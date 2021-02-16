.PHONY: package
package:
	@find . -name ltsp-updater_\*_amd64.deb -exec rm \{\} \;
	@./bin/package.sh
