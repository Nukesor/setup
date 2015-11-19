.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

prerequisite:
	./outside/prerequisite.sh

partition:
	./outside/partition.sh

format:
	./outside/format.sh

grub-partition:
	./outside/grub-partition.sh

grub-format:
	./outside/grub-format.sh

install:
	./outside/install.sh


efi: copy efi install-pkg system user

grub: copy install-pkg grub system user

copy:
	./inside/copy.sh

install-pkg:
	./inside/install.sh

system:
	./inside/system.sh

user:
	./inside/user.sh

grub:
	./inside/grub.sh

efi:
	./inside/efi.sh
