.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

prerequisite:
	./outside/prerequisite.sh

partition:
	./outside/partition.sh

format:
	./outside/partition.sh

install: install-pkg system user

install-pkg:
	./inside/install.sh

system:
	./inside/system.sh

user:
	./inside/user.sh
