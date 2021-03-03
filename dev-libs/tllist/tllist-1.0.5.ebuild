# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A C header file only implementation of a typed linked list"
HOMEPAGE="https://codeberg.org/dnkl/tllist"

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

src_install() {
	meson_src_install
	rm -rf "${D}/usr/share/doc/tllist"
}
