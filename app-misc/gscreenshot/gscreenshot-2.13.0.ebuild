# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A simple GUI frontend for the scrot, imlib2, or ImageMagick screenshooters"
HOMEPAGE="https://github.com/thenaterhood/gscreenshot"
SRC_URI="https://github.com/thenaterhood/gscreenshot/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/python
	media-gfx/scrot
	dev-python/pillow
	dev-python/pygobject
	x11-misc/xclip
	dev-python/setuptools"
RDEPEND="${DEPEND}"
BDEPEND=""
