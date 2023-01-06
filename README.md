# Photobooth Buildroot External

This [buildroot external][1] includes my personal packages, patches, setup 
and configuration that are not provided in mainline buildroot. This project 
gives me an extension to buildroot to support these customizations outside of the 
standard buildroot tree.

## Install System Dependencies

We are using this external on Ubuntu version 22.04, but it should
work on any Linux OS. The following system build dependencies are required.

    sudo apt-get install subversion build-essential bison flex gettext \
    libncurses5-dev texinfo autoconf automake libtool mercurial git-core \
    gperf gawk expat curl cvs libexpat-dev bzr unzip bc python-dev \
    wget cpio rsync xxd

In some cases, buildroot will notify that additional host dependencies are
required. It will let you know what those are.

## Build

Starting is easy, clone, configure and build. When building, use the appropriate
defconfig in the `buildroot-external-photobooth/configs` directory
for your platform. Feel free to add defconfig if you are missing one.

1. Clone the required buildroot sources.
   ``` shell
   git clone https://git.buildroot.net/buildroot
   git clone git@github.com:bramoosterhuis/buildroot-external-photobooth.git
   ```
2. Enter the buildroot directory and prepare the environment. Usually the export is
   only needed once unless you want to add/remove layers.
   ``` shell
   export BR2_EXTERNAL=$PWD/../buildroot-external-photobooth
   ```
3. Continue your build as a usual buildroot build.
   ``` shell
   make rpi_photobooth_defconfig
   make
   ```

Buildroot will put the binaries like kernel and root filesystem in the
'output/images' directory.

### Optionally Configure Packages and Kernel

Userspace packages and the Linux kernel, for example, can be optionally selected
and configured using buildroot.

To configure userspace packages and build:

    make menuconfig
    make


To configure the kernel and build:

    make linux-menuconfig
    make


Create a list of software licenses used:

    make legal-info

## License

This project is licensed under the [GPLv2][2] or later with exceptions.  See the
`COPYING` file for more information. Buildroot is licensed under the [GPLv2][2]
or later with exceptions. See the `COPYING` file in that project for more
information.

## Documentation

For more information on using and updating buildroot, see the [buildroot documentation][3].

[1]: https://buildroot.org/downloads/manual/manual.html#outside-br-custom
[2]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[3]: https://buildroot.org/docs.html
