# README

## Basic Requirements

1. Needs ssh installed if not using localhost with local connection
2. Needs python3 installed on all
3. Fedora might need python3-libdnf5, python3-dnf

## To Use ansible on macOS machines

1. Install xcode
2. Install xcode command-line tools `xcode-select --install`
3. Accept xcode licenses `sudo xcodebuild -license`
4. Make sure user is Administrator
5. Install homebrew

## Building hyprland dependencies on Fedora

1. Sometimes the build fails due to dependencies not found even though they are
   installed by Fedora. Then try to install `-devel` package and also verify that
   the dependencies are present for `x86_64`
