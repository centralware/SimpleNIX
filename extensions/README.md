# SimpleNIX Build Center

## How can I help?

See [build members](https://users.simplenix.com/forum/) for information on how to join the network.

## License

This project is currently licensed under **_As Is, Join In! Make Yourself Useful!_**

# Extensions

## General Extension Concepts

```
go_version()    A function that obtains the most current, stable version number available online
go_download()   A function that downloads and repackages the source tarball for a specified version number
go_extract()    A function that takes an already downloaded package and extracts it into ./src
go_configure()  A set of functions necessary to pre-compile the source package
go_compile()    A set of functions necessary to compile the source package
go_package()    A function that packages a previously compiled source tarball
```

The functions go_version() and go_download() are called by a dedicated Internet based machine, but has no direct access to the server farm.
The server farm calls the remaining functions in a virtual-like environment, but will not have network or Internet access. The above functions
are intended to be called and supported from either ASH (BusyBox) or BASH.
