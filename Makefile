.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

efi-setup:
	./scripts/efi-setup.sh

install: install-pkg system user

install-pkg:
	./scripts/install.sh

system:
	./scripts/system.sh

user:
	./scripts/user.sh

yaourt:
	./scripts/yaourt.sh
