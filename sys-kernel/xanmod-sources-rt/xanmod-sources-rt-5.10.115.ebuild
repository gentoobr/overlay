# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="124"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
XANMOD_VERSION="1"
_RT_VERSION="rt67"
XANMOD_URI="https://github.com/xanmod/linux/releases/download/"

HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
KEYWORDS="~amd64"
IUSE="experimental"

inherit kernel-2
detect_version

# I hate myself.
KV_FULL="${KV_FULL}-${_RT_VERSION}"
S="${S}-${_RT_VERSION}"

DESCRIPTION="XanMod kernel sources, including the PREEMPT_RT and Gentoo patchsets"
SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${XANMOD_URI}/${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}/patch-${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}.xz
	${GENPATCHES_URI}
"

UNIPATCH_LIST="${DISTDIR}/patch-${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}.xz"

# excluding all minor kernel revision patches; XanMod will take care of that
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} 1*_linux-${KV_MAJOR}.${KV_MINOR}.*.patch"

# excluding CPU optimizations patches, since it's included in XanMod too
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} 5*_*cpu-optimization*.patch"

pkg_postinst() {
	elog "The XanMod team strongly suggests the use of updated CPU microcodes"
	elog "with its kernels. For details: see:"
	elog "https://wiki.gentoo.org/wiki/Microcode"
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
