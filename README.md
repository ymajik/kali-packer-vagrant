# Kali Packer Vagrant

This project is a simplified way to generate a
[Kali Linux](https://www.kali.org/) virtual machine image supported
by [Vagrant](https://www.vagrantup.com/) by building it on-the-fly
with [Packer](https://packer.io/).

This is useful when you are paranoid about using a non-official virtual
machine image because you do not know what has been bundled with it. This
tool uses the official ISO from Kali, and open sources the build process
so you know exactly what you are getting.

## Getting Started

Run ``make deps`` to find out what tools you need.  At a minimum, you will
need the following:

* [Vagrant](https://docs.vagrantup.com/v2/installation/)
* [Packer](https://www.packer.io/intro/getting-started/setup.html)

Other dependencies and tools may exist, so please do not rely on this
list as an exhaustive resource.  The [Makefile](Makefile) will alert
you to any missing dependencies.

## Everyday Workflow

* ``make image``
* ``make start``
* Do fun stuff with Kali
* Decide you are done doing 4w3s0m3 57uff for the day.
* ``make stop``
* Decide you want a clean VM because the old one is too tainted
* ``make clean && make start``

### First Time Here?

When you create a VM image for the first time, Packer will need to
download the Kali ISO file (approx. 3GB).  Depending on your Internet
connection speed, this can take up to an hour.  Once this is finished, a
``packer_cache`` directory exists in this project that holds the
downloaded ISO file.  If you do not delete this directory (or the file)
Packer will not have to redownload it and the imaging process will
be faster.

## Contributing

1. [Fork](https://help.github.com/articles/fork-a-repo/) the repository.
1. Make changes in a branch.
1. Submit a [Pull Request](https://help.github.com/articles/using-pull-requests/).
1. Do a dance because you've contributed to open source.

## License

This project is open source.

Please see the [LICENSE](LICENSE) file for more information.

