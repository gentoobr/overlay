# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
inherit distutils-r1

COMMIT="7d79211056c816b381dfdd4ac1c68492b0dbb336"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/RemixDev/${PN}"
else
	SRC_URI="https://gitlab.com/RemixDev/${PN}/-/archive/${COMMIT}/${PN}-${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

DESCRIPTION="A wrapper for all Deezer's APIs"
HOMEPAGE="https://gitlab.com/RemixDev/deezer-py"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/requests
	dev-python/eventlet
	"
RDEPEND="${DEPEND}"
BDEPEND=""
