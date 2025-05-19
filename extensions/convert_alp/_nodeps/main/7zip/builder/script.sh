# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
EXT_NAME=7zip
EXT_VERS=23.01
_EXT_VERS=${EXT_VERS//./}
pkgrel=0
EXT_DESC="File archiver with a high compression ratio"
EXT_SITE="https://7-zip.org/"
EXT_PLAT="all"
EXT_COPY="LGPL-2.0-only"
subpackages="${EXT_NAME}-doc"
source="https://7-zip.org/a/7z${_EXT_VERS}-src.tar.xz
~!~!~armv7.patch
~!~!~7-zip-flags.patch
~!~!~7-zip-musl.patch
~!~!~"
builddir="$srcdir"

provides="7zip-virtual p7zip=${EXT_VERS}-r$pkgrel"
replaces="p7zip"
provider_priority=100

#[[build]]#

#[[check]]#

#[[package]]#

sha512sums="
e39f660c023aa65e55388be225b5591fe2a5c9138693f3c9107e2eb4ce97fafde118d3375e01ada99d29de9633f56221b5b3d640c982178884670cd84c8aa986  7z2301-src.tar.xz
e52e542709a23ced76b651adf54609efae705801e940e74310ae4e67070bdb3841da5b801362aa0329b77993cdc3f6cd63ac2802240b16cde865f9d01bb1936d  armv7.patch
dfecb69861d00ee47311d83930adf80321b3c95ae01ce325677bde7aee6aa880a1979b0aa2909d9acb7a88ff31f910ac545ac218a0b5fd9e1270df2276b46d44  7-zip-flags.patch
c652a87ad95f61901820adb61f3d1ceacedcb8aeaf9e89b2b728b7372eff67d9669eb363d5b2d2fb848ff2d8c5a727134fe13cc77d1215df7b2d32fe87711ebf  7-zip-musl.patch
"
