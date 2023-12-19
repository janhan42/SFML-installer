#!/bin/bash

git clone https://github.com/janhan42/SFML-installer.git

compiler=$(cc --version)
arch=$(uname -m)
pwd=$(pwd)

if [[ $compiler == *"gcc"* ]] && [ "$arch" = "x86_64" ]; then
	sfml_lib="SFML-2.6.1-linux-gcc-64-bit.tar.gz"
elif [[ $compiler == *"clang"* ]] && [ "$arch" = "x86_64" ]; then
	sfml_lib="SFML-2.6.1-macOS-clang-64-bit.tar.gz"
elif [[ $compiler == *"clang"* ]] && [ "$arch" = "arm64" ]; then
	sfml_lib="SFML-2.6.1-macOS-clang-arm64.tar.gz"
fi

sfml_dir="SFML"
sfml_out=${sfml_lib%.tar.gz}

tar -xzvf ./lib/SFML/"$sfml_lib" -C "$pwd"
mv "$sfml_out" "$sfml_dir"
rm -fr "SFML-installer"
