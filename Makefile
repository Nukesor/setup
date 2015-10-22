.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

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

everything-grub: basic boot-grub advanced install-pkg user

efi-setup:
	./scripts/efi-partition.sh
	./scripts/efi-format-mount.sh
	./scripts/basic-install.sh

efi-setup: HD-setup basic-install
bios-setup

