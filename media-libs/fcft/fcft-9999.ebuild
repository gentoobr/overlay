# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils meson

DESCRIPTION="A simple library for font loading and glyph rasterization"
HOMEPAGE="https://codeberg.org/dnkl/fcft"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/dnkl/${PN}.git"
else
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+harfbuzz static-libs"

RDEPEND="
	media-libs/fontconfig
	media-libs/freetype
	harfbuzz? ( media-libs/harfbuzz )
	x11-libs/pixman
"
DEPEND="
	${RDEPEND}
	>=dev-libs/tllist-1.0.1
"
BDEPEND="
	app-text/scdoc
	>=dev-util/meson-0.54.0
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		-Ddefault_library=$(usex static-libs both shared)
		$(meson_feature harfbuzz text-shaping)
		-Dwerror=false
	)
	meson_src_configure
}

src_install() {
	meson_src_install
	rm -rf "${D}/usr/share/doc/fcft"
}
