# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A fast fetch written in C, with the ppfetch Ascii Art."
HOMEPAGE="https://github.com/RedsonBr140/redfetch"
SRC_URI="https://github.com/RedsonBr140/redfetch/archive/refs/tags/v0.1.3.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=x11-misc/wmctrl-1.07-r2"
DEPEND="${RDEPEND}"
src_install() {
	emake DESTDIR="${D}"  PREFIX="${EPREFIX}/usr" install
}
