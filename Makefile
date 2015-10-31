.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

partition:
	./scripts/partition.sh

format:
	./scripts/partition.sh

install: install-pkg system user

install-pkg:
	./scripts/install.sh

system:
	./scripts/system.sh

user:
	./scripts/user.sh
