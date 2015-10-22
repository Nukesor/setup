.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

efi-setup:
	./scripts/efi-setup.sh

install: install system user

install:
	./scripts/install.sh

system:
	./scripts/system.sh

user:
	./scripts/user.sh
