compile triton in dontainer with z3. Currently no bitwuzla.
List of all satisfied dependencies:
1. boost
2. python
3. z3
4. llvm

Theoretically you don't need any header files except those defined in /usr/lib/triton/.
But just in case - all dependencies were installed via pacman, so their headers
must reside in /usr/include and binary files in /usr/lib OR /usr/local/lib.
Use `find` :)

```
sh-5.1# ldd /Triton/build/src/libtriton/libtriton.so
        linux-vdso.so.1 (0x00007ffee9bca000)
        libz3.so.4.12 => /usr/lib/libz3.so.4.12 (0x00007faff4b6d000)
        libLLVM-15.so => /usr/lib/libLLVM-15.so (0x00007fafed2af000)
        libcapstone.so.4 => /usr/lib/libcapstone.so.4 (0x00007fafecc64000)
        libpython3.11.so.1.0 => /usr/lib/libpython3.11.so.1.0 (0x00007fafec697000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007fafec41c000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007fafec32f000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007fafec308000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007fafec11e000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007faff60a5000)
        libffi.so.8 => /usr/lib/libffi.so.8 (0x00007fafec113000)
        libedit.so.0 => /usr/lib/libedit.so.0 (0x00007fafec0d7000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007fafec0bd000)
        libzstd.so.1 => /usr/lib/libzstd.so.1 (0x00007fafebfea000)
        libncursesw.so.6 => /usr/lib/libncursesw.so.6 (0x00007fafebf71000)
        libxml2.so.2 => /usr/lib/libxml2.so.2 (0x00007fafebe0b000)
        liblzma.so.5 => /usr/lib/liblzma.so.5 (0x00007fafebdd8000)
        libicuuc.so.73 => /usr/lib/libicuuc.so.73 (0x00007fafebbd0000)
        libicudata.so.73 => /usr/lib/libicudata.so.73 (0x00007fafe9d42000)
```

I don't know your exact case of how you are going to use binary - you can copy it 
along with headers or mount volume:
`/Triton/src/libtriton/includes/triton/` - directory with headers
`/Triton/build/src/libtriton/` - directory with binaries (libtriton.so, triton.so)
You can mount them with -v flag:
docker run -v hostPath:containerPath triton-llvm-z3:latest
