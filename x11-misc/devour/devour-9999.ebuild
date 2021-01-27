# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="X11 window swallower"
HOMEPAGE="https://github.com/salman-abedin/devour"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/salman-abedin/${PN}"
else
	SRC_URI="https://github.com/salman-abedin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	x11-libs/libX11
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	# Let portage strip the binary
	sed -i 's/-s //' Makefile
}

src_install () {
	emake DESTDIR="${D}" BIN_DIR="${D}/usr/bin" install
}
