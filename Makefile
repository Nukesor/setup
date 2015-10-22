.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

efi-setup:
	./scripts/efi-setup.sh

install: install basic advanced install-pkg user

basic:
	./scripts/basic.sh

advanced:
	./scripts/advanced.sh

install-pkg:
	./scripts/install.sh

yaourt-pkg:
	./scripts/yaourt.sh

user:
	./scripts/user.sh



