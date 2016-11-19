.PHONY: prerequisite partition format grub-partition grub-format install efi-partition grub-partition copy install-pkg system user grub efi

default:

outside-efi: prerequisite partition format install
crypt-efi: prerequisite partition encrypt install
outside-grub: prerequisite grub-partition grub-format install

prerequisite:
	./outside/prerequisite.sh

partition:
	./outside/partition.sh

encrypt:
	./outside/encrypt.sh

format:
	./outside/format.sh

grub-partition:
	./outside/grub-partition.sh

grub-format:
	./outside/grub-format.sh

install:
	./outside/install.sh

grub-setup: prerequisite grub-partition grub-format install

efi-setup: prerequisite partition format install

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

efi: copy efi install-pkg system user

grub: copy install-pkg grub system user
