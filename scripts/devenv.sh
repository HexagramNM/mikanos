# Usage: source devenv.sh

export PATH=$PATH:$HOME/osbook/devenv

source $HOME/osbook/devenv/buildenv.sh

alias kernel-build="clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp"
alias kernel-link="ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o"
