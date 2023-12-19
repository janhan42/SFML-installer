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

tar -xzvf ./SFML-installer/lib/SFML/"$sfml_lib" -C "$pwd"
mv "$sfml_out" "$sfml_dir"
mv ./"$sfml_dir"/extlibs/FLAC.framework ./"$sfml_dir"/Frameworks/FLAC.framework
mv ./"$sfml_dir"/extlibs/freetype.framework ./"$sfml_dir"/Frameworks/freetype.framework
mv ./"$sfml_dir"/extlibs/ogg.framework ./"$sfml_dir"/Frameworks/ogg.framework
mv ./"$sfml_dir"/extlibs/vorbis.framework ./"$sfml_dir"/Frameworks/vorbis.framework
mv ./"$sfml_dir"/extlibs/vorbisenc.framework ./"$sfml_dir"/Frameworks/vorbisenc.framework
mv ./"$sfml_dir"/extlibs/vorbisfile.framework ./"$sfml_dir"/Frameworks/vorbisfile.framework
sh ./"$sfml_dir"/clangd_gen.sh
rm -fr "SFML-installer"
