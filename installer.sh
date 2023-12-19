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
mv ./"$sfml_dir"/lib/sfml/$sfml_bundle_out ./"$sfml_dir"/lib/sfml/2.6.1
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/FLAC.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/FLAC.framework
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/freetype.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/freetype.framework
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/ogg.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/ogg.framework
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/vorbis.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/vorbis.framework
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/vorbisenc.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/vorbisenc.framework
mv ./"$sfml_dir"/lib/sfml/2.6.1/extlibs/vorbisfile.framework ./"$sfml_dir"/lib/sfml/2.6.1/Frameworks/vorbisfile.framework
rm -fr "SFML-installer"
