FROM archlinux:base-devel-20230723.0.166908

# secondary dependencies
run pacman -Sy --noconfirm cmake
# primary dependencies
# TODO: add bitwuzla
run pacman -S --noconfirm capstone z3 boost python llvm 


run pacman -S --noconfirm git
run git clone https://github.com/JonathanSalwan/Triton
workdir Triton/build

# TODO: if we use bitwuzla, then:
# run cmake -DLLVM_INTERFACE=ON -DCMAKE_PREFIX_PATH=$(llvm-config --prefix) -DBITWUZLA_INTERFACE=ON ..
run cmake -DLLVM_INTERFACE=ON -DCMAKE_PREFIX_PATH=$(llvm-config --prefix) ..
run make -j 5
run make install



