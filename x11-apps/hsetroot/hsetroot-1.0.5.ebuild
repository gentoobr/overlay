# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="yet another wallpaper application"
HOMEPAGE="https://github.com/himdel/hsetroot"
SRC_URI="https://github.com/himdel/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-libs/imlib2
	x11-libs/libX11
	x11-libs/libXinerama
"

RDEPEND="
	${DEPEND}
	virtual/pkgconfig
"
src_prepare() {
	eapply "${FILESDIR}/${P}-fixmakefile.patch"
	eapply_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
