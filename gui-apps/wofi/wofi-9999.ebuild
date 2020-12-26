# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

if [[ "${PV}" == *9999* ]]; then
	inherit mercurial
	EHG_REPO_URI="https://hg.sr.ht/~scoopta/wofi"
else
	KEYWORDS="~amd64"
	SRC_URI="https://hg.sr.ht/~scoopta/wofi/archive/v${PV}.tar.gz"
fi

DESCRIPTION="Wofi is a launcher/menu program for wlroots based wayland compositors such as sway"
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/wayland
	x11-libs/gtk+[wayland]
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		mercurial_src_unpack
	else
		default
		mv -T "${PN}-v${PV}" "${P}" || die
	fi
}
