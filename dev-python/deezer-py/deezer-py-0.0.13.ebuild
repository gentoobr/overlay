# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

COMMIT="e3083a5ee71d5dd687eddb1f2df6089c94720a38"

DESCRIPTION="A wrapper for all Deezer's APIs"
HOMEPAGE="https://git.rip/RemixDev/deezer-py"
SRC_URI="https://git.rip/RemixDev/${PN}/-/archive/${COMMIT}/${PN}-${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND="
	dev-python/requests
	dev-python/eventlet
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${COMMIT}"

