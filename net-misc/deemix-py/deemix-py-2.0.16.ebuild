# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

COMMIT="67fcb7d37f0cd24564b7ff2738cd5e69551edc6d"

DESCRIPTION="deemix is a deezer downloader built from the ashes of Deezloader Remix."
HOMEPAGE="https://git.freezer.life/RemixDev/deemix-py"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.freezer.life/RemixDev/${PN}"
else
	SRC_URI="https://git.freezer.life/RemixDev/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${COMMIT}"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	>=dev-python/spotipy-2.11.0
	dev-python/deezer-py
	dev-python/requests
	dev-python/pycryptodome
	dev-python/eventlet
	dev-python/click
	media-libs/mutagen
"
RDEPEND="${DEPEND}"
BDEPEND=""

python_prepare(){
	# Deemix by default uses pycryptodomex, which will be removed from the
	# Portage tree. As they are basically drop-in replacements, I just use
	# sed to change pycryptodomex to pycryptodome.
	#
	# This might lead to conflicts if you have pycrypto installed, as
	# it is also imported using Crypto.
	sed -i 's/Cryptodome/Crypto/' deemix/app/downloadjob.py
	sed -i 's/Cryptodome/Crypto/' deemix/utils/decryption.py
}
