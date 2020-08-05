You almost certainly want to be looking at one of the two continuation projects instead of this repository:

Rescuezilla (developed since November 2019): [Rescuezilla](https://github.com/rescuezilla/rescuezilla/releases/latest) (by the author of this repository)

Redo Rescue (developed since June 2020): [Redo Rescue](http://redorescue.com/) (by the original author of _Redo Backup and Recovery_)

---

This repository provides a careful reconstruction of the _Redo Backup and Recovery_ source code for historical interest, analysis, software preservation (and as a solid foundation for the [Rescuezilla](https://github.com/rescuezilla/rescuezilla/releases/latest) revival effort). It reconstructs the source code history and build system of all surviving _Redo Backup and Recovery_ source code tarballs (for v0.9.8 through v1.0.4) as accurately as possible.

The tedious manual build process has been automated, both by creating build scripts and by painstakingly reconstructing the host machine environment that was used for the build. The original project only provided build instructions for v1.0.3 (on a Wiki page that has since been deleted by the original author) and v1.0.4. Using these instructions, automated build scripts (`build.sh`) were constructed. After building the ISO image with this script, the `extract_and_checksum_iso.sh` script was written to compare the build with the old ISO image releases that are floating around the internet. It quickly became apparent that the *host machine* needs to be reconstructed in order to build the project as accurately as possible. Thus for all 7 versions (v0.9.8, v0.9.9, v1.0.0, v1.0.1, v1.0.2, v1.0.3, v1.0.4) a Dockerfile has painstakingly constructed to best reflect the *host machine* that was used to build the _Redo Backup and Recovery_ ISO image releases. The source code _and_ the ISO images for _Redo Backup and Recovery_ v0.9.2 through v0.9.7 have not been able to be obtained. (An ISO image of v0.9.2 on an obscure Brazilian mirror was obtained (which was very useful to confirm long-standing bugs in the _Redo Backup and Recovery_), but it was not possible to verify the broader integrity of that ISO image so it has not been included in this reconstruction effort.)

This painstaking work provides the ability to build all previous versions of _Redo Backup and Recovery_ from source in an automated manner and in a way that reflects the original ISO images as closely as possible. This provided the ideal base on which to develop the [Rescuezilla](https://github.com/rescuezilla/rescuezilla/releases/latest) revival effort.

The only differences between the contents of an ISO image built using this repository and the _Redo Backup and Recovery_ ISO images floating around the internet are attributable to the Ubuntu mirrors not making old versions of security/maintenance updates (from 2010-2012) available in their long-term archive repositories, which is a nice property.

---

You almost certainly want to be looking at on of the two continuation projects instead of this repository:

Rescuezilla (developed since November 2019): [Rescuezilla](https://github.com/rescuezilla/rescuezilla/releases/latest) (by the author of this repository)

Redo Rescue (developed since June 2020): [Redo Rescue](http://redorescue.com/) (by the original author of _Redo Backup and Recovery_)
