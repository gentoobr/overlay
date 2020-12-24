# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop xdg-utils savedconfig

DESCRIPTION="a fast, lightweight, vim-like browser based on webkit"
HOMEPAGE="http://fanglingsu.github.io/vimb/"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fanglingsu/${PN}"
else
	SRC_URI="https://github.com/fanglingsu/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="gstreamer adblock"

DEPEND="
	gstreamer? (
		net-libs/webkit-gtk[gstreamer]
		media-libs/gst-plugins-good
		media-plugins/gst-plugins-libav
	)
	!gstreamer? ( net-libs/webkit-gtk )
	x11-libs/gtk+:3
	adblock? ( www-plugins/wyebadblock )
"

RDEPEND="
	${DEPEND}
	virtual/pkgconfig
"
src_prepare() {
	default

	sed -i '/Icon/s/$/browser/' vimb.desktop

	restore_config "${WORKDIR}"/"${P}"/src/config.h
}

src_compile() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	if use adblock; then
		ln -s /usr/lib/wyebrowser/adblock.so "${D}"/usr/lib/vimb/
	fi

	save_config "${WORKDIR}"/"${P}"/src/config.h
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
