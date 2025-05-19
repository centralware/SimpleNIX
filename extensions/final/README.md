# Build Scripts : COMPLETED

* The enclosed build scripts are listed as TESTED and COMPLETE
* These scripts may include support content compressed at the end of the script
* All of these scripts require ../functions to operate

> [!WARNING]
> All build scripts submitted by maintainers must conform to the builder template provided in ./~template and are never to contain or download binary content.
> All scripts must be able to operate properly in a jailed environment where go_version and go_download are the only functions allowed to access the Internet.

For example:
```
go_version()
{
   # A function to scrape internet resources for the most recent STABLE version of this extension
}
go_download()
{
   # A function to download the source package and RE-package it as ${EXT_NAME}__${VERSION}.tar.gz
}
```
These functions are called by a special server which has internet access, but has no access to the server farm. When we're asked to build a specific extension, this 
special server calls both of the above functions. If a version number is provided by the request, go_download() is fed that version information even if it's not the 
most recent version available. Once the source package is downloaded and repackaged, the extension's name is added to the build queue where the server farm will then 
take the downloaded/repackaged source package and compile it as needed.

Once compiling/packaging is complete, it is saved as ${EXT_NAME}__${VERSION}__${PLATFORM}.bin.tgz and contains the entire compiled package including documentation, 
locale data, headers, etc. A SquashFS version is also created as ${EXT_NAME}__${VERSION}__${PLATFORM}.pkg with separated ${EXT_NAME}-doc, ${EXT_NAME}-dev and ${EXT_NAME}-loc 
where applicable.  Each package has its own INFO file, signature files, file tree/listings and dependency listings as applicable. The INFO file also contains a list of 
run-time dependencies, kernel requirements, etc. which can be used for installation logic.

Tiny Core Linux, for example, would then take the PKG extension and rename it according to their repository needs, attach .dep .info .md5 and .list files and upload it to 
their repository server for each hardware platform requested.  For RPM or DEB the RAW extension is extracted and repackaged as needed, again, adding informative details 
where necessary.  This concept should end up creating the world's largest one-stop repository with an automated back-end consisting of dozens of hardware devices which may 
eventually be tuned to handle cross-compilation where necessary.

```diff
- For sake of speed and efficiency, we are going to start this project using as many public repositories available, such as those found in Arch 
- or Alpine Linux distributions which may already be partially functional for our needs.  (Fully functional build scripts would be a dream come 
- true!) For these instances, we have a CONVERT directory which contains the seeds from different distributions to be used as a guide to create 
- functioning Simple Linux Builders.
```

