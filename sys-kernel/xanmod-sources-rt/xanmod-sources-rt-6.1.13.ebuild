# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="15"
K_SECURITY_UNSUPPORTED="1"
XANMOD_VERSION="1"
_RT_VERSION="rt7"
XANMOD_URI="https://github.com/xanmod/linux/releases/download/"

HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
KEYWORDS="~amd64"

inherit kernel-2
detect_version

# This is an extremely ugly, albeit highly efficient, solution to keep the PREEMPT_RT patched kernels separate from the lesser kernel sources.
KV_FULL="${KV_FULL}-${_RT_VERSION}"
S="${S}-${_RT_VERSION}"

DESCRIPTION="XanMod Kernel sources with PREEMPT_RT and the Gentoo patchsets"
SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${XANMOD_URI}/${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}/patch-${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}.xz
	${GENPATCHES_URI}"

# excluding all minor kernel revision patches; XanMod will take care of that
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} 1*_linux-${KV_MAJOR}.${KV_MINOR}.*.patch"

src_unpack() {
	UNIPATCH_LIST="${DISTDIR}/patch-${OKV}-${_RT_VERSION}-xanmod${XANMOD_VERSION}.xz "
	kernel-2_src_unpack
}

pkg_postinst() {
	elog "The XanMod team strongly suggests the use of updated CPU microcodes with its"
	elog "kernels. For details, see https://wiki.gentoo.org/wiki/Microcode ."
	einfo "This kernel includes the PREEMPT_RT patchset, and may be subject to a different"
	einfo "set of bugs and other issues than those you'd find in a non-realtime version."
	einfo "User discretion is advised."
	kernel-2_pkg_postinst
}
