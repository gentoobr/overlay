# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/plamere/spotipy"
else
	SRC_URI="https://github.com/plamere/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A light weight Python library for the Spotify Web API"
HOMEPAGE="https://github.com/plamere/spotipy/"

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-python/six
	dev-python/requests
	"
RDEPEND="${DEPEND}"
BDEPEND=""
