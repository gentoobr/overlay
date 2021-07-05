# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="16"
CLEAR_VER="5.12.13-1050"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://github.com/clearlinux-pkgs/linux"
IUSE="experimental"

DESCRIPTION="Clear Linux sources"

CLEAR_URI="https://github.com/clearlinux-pkgs/linux/archive/refs/tags/${CLEAR_VER}.tar.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CLEAR_URI}"

UNIPATCH_EXCLUDE="archive/* ${UNIPATCH_EXCLUDE}"

UNIPATCH_LIST="${DISTDIR}/${CLEAR_VER}.tar.gz"
UNIPATCH_STRICTORDER="yes"

K_EXTRAEINFO="For the default configuration used on Clear Linux, see ${HOMEPAGE}"

pkg_postrm() {
	kernel-2_pkg_postrm
}
