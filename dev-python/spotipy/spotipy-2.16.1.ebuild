# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="A light weight Python library for the Spotify Web API"
HOMEPAGE="https://github.com/plamere/spotipy/"
SRC_URI="https://github.com/plamere/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/six
	dev-python/requests
	"
RDEPEND="${DEPEND}"
BDEPEND=""
