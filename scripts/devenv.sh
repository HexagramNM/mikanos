# Usage: source devenv.sh

export PATH=$PATH:$HOME/osbook/devenv
export MIKANOS_ROOT=$(cd $(dirname ${BASH_SOURCE:-$0}); cd ..; pwd)

source $HOME/osbook/devenv/buildenv.sh

alias cd-devenv="cd $HOME/osbook/devenv"
alias cd-mikanos="cd $MIKANOS_ROOT"
alias kernel-build="cd $MIKANOS_ROOT/kernel; clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp"
alias kernel-link="cd $MIKANOS_ROOT/kernel; ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o"
alias loader-build="cd $HOME/osbook/devenv; source edksetup.sh; build;"
alias run-qemu="$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $MIKANOS_ROOT/kernel/kernel.elf"
