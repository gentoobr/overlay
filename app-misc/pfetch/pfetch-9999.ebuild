# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A pretty system information tool written in POSIX sh."
HOMEPAGE="https://github.com/dylanaraps/pfetch"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dylanaraps/${PN}"
else
	SRC_URI="https://github.com/dylanaraps/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	default
	dobin "${PN}"
}
