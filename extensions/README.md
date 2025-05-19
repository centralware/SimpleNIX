# SimpleNIX Build Center

[Build Center](https://localhost) The Build Center is where it all comes together!

> [!IMPORTANT]
> Build Center is just getting off the ground and is looking for developers and application authors!
>

## Features

We aim to build a complete, automated and networked build system from the kernel to the desktop


- [X] Phase 1: Gather as many source packages and build scripts/notes as we can find starting with our current extension history
- [ ] Phase 2: Create build scripts from a modular template for each library/application (More than 6,800!)
- [ ] Phase 3: Create a hardware network of ARM and x86/64 for testing and running new build scripts
- [ ] Phase 4: Reach out to software authors, OS distros, etc. looking for interest and extra hands*
- [ ] Phase 5: Create a peer2peer network of ARM and x86/64 hardware for global compiling and hardware testing!

* The final product of this project, in theory, could be used for virtually any flavor of 'nix

## How can I help?

See [build members](https://localhost) for information on how to join the network.

## License

This project is currently licensed under **_As Is, Join In! Make Yourself Useful!_**


# Extensions

## General and Build Tool Extensions

In the extension directory you'll find a large number of extension names in folders of their own.
Each of these extensions are in need of the following:
1. A file called _download_ containing a URL to the download page for the extension's source tarball.
2. A file called _depends_ containing two lists of dependencies; one for compiling, the other for run-time
3. A file called _details_ containing information about the extension itself.
4. A file called _build_ containing build notes, shell script, etc. to assist in compiling the extension.
5. A file called _auto.m8_ (or _m8_ for short) which will be the final (A)sh shell script that creates the extension.
6. Finally, a file _status_ containing merely a word or phrase depicting the extension's progress (pending, complete, failed, deprecated, etc.)

_Build Tool Extensions_ are extensions created specifically to assist in the creation of kernel, busybox and/or toolchain
software applications, usually needed when you're trying to create newer releases of kernel/initrd using the most recent
(and stable) compilation tools necessary.  Some of these extensions will go onto being included in the General category.

_General Extensions_ are the final product used in the end-user operating system.  For Tiny Core these are the TCZ
files that the system centers itself on.  Each operating system has their own methodology and package manager accordingly.

When starting out, if you are an author, start by creating the _download, depends and details_ files based on your
project. Review the files found in _templates/general for examples of each. We are trying to create a standardized method
for automation and compilation; please try to fit your project into the layout found in the template files.

If you are a volunteer or a maintainer and not focused on any one software package, grab _any_ of the directories found
in the extension directory which do not already have their own builder files. I would recommend starting off with a copy
of the _details_ template, putting your name and other related information into the provided fields and uploading it to
the repository (technically laying claim to that extension to help avoid more than one member from unwittingly working
on the same extension.)

The _build_ file is just a text file with any data that's been found online, in notes, etc. pertaining to compiling the
extension.  Look at this file as a notepad, log, etc. as it's not intended to be part of the animation process.

The _auto.m8_ files, along with all of the remaining files (just not _build_) are intended for production.  The _m8_ script
is built by copying content from the other files and pasting that content where listed. Afterward, the actual steps
needed to successfully compile the extension need to be manually entered. _This_ is the heart of this project's first
steps into the world. If you have the means, run a dry test on your Linux machine; if successful, update _status_ and
when the automation network is complete, the script will be directly used on multiple platforms determine its overall
success and create logs of its progress if it wasn't successful.

When creating scripts for the system, we're focusing on Ash functionality; specifically the shell that comes embedded with
BusyBox.  The reason for this is relatively simple...  most functions that work in Ash generally work in Bash/Zsh...
but not all common Bash/Zsh functions work in Ash. Eventually the automation system will be updated so that scripts are
also tested under other common shells such as Bash to make them that much more portable.

The intended file naming convention we're using is as follows:
If our software was named _RedGrapes_, our extension names would be as follows:
- __RedGrapes.ext__ (The main extension itself)
- __RedGrapes.ext.info__ (A formatted information file detailing the package)
- __RedGrapes.ext.dep__ (A list of required runtime dependencies)
- __RedGrapes.ext.md5__ (The extension's MD5 signature)

Extra extensions (and separate .info, .dep and .md5 for each) may include:
- __RedGrapes-dev.ext__ (Headers and other shared development files)
- __RedGrapes-doc.ext__ (Documentation and other non-essential texts)
- __RedGrapes-cfg.ext__ (Configuration files (COPIES), such as default layouts and settings)
- __RedGrapes-int.ext__ (Init script(s) intended to manage daemons directly (without using third party managers))
- __RedGrapes-loc.ext__ (Locale/Language content)
- __RedGrapes-src.ext__ (The actual source code and auto.m8 file for this software package)

Once the auto.m8 script has been successful for all of the above extensions that apply on all of the supported hardware,
the extension is considered closed and is added to the full queue. Tests can then be performed on extensions by changing
the running kernel environment, compilers, libraries, etc. to make sure the auto.m8 script knows how to handle change.

## Future Releases

Out of thousands of extensions this system will eventually become family with, change is inevitable and with that, something
is going to eventually break somewhere! This system's concept is to remove "thousands" of successful extensions from the mix
by leaving only those who can no longer succeed with the current list of dependencies, flags, etc. plus there's always going
to be new platforms (such as the RasPi-5) where auto.m8 will need to be educated on how to determine the new environment and
how to act when it's detected.

## Version Management

The goal here is to have __RedGrapes.ext__ end up being nothing more than a pointer to __RedGrapes-1.17.22-arm7.ext__ for
example, within our little repository which would be determined based on running hardware, kernel, libraries, etc.  This
allows us to house every extension for RedGrapes that has ever existed within a single directory AND maintain its source
compilation notes since inception, a source code release archive if desired, a history/change-log of the software and its
contributors and maintainers...  and each extension's directory could be anywhere on the planet allowing the repository to
grow endless should it ever need to.

Note: The actual file extension "ext" is still being debated; it needs to be self-explanatory but preferably unique.

Tiny Core example: due to how TC extensions are packaged and managed, when building _RedGrapes_ a TC admin or automation
script would call the Build Center and ask for a release in a fashion such as:
https://Build-Center.something/?ext=RedGrapes&plat=x64&kern=6.1.0&gcc=whatever&out=tcz (and so on, still under development!)
The Build Center would then respond with an XML containing links and file names to download, already built and ready to go!
If the package isn't already built, it would then instruct the build center to do just that.  (Notification would be emailed
of Status as some builds can take hours!)

