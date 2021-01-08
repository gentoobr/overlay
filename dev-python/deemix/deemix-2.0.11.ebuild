# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

COMMIT="44eeb3e28eef965151e513dbd9176624b9de42a1"

DESCRIPTION="deemix is a deezer downloader built from the ashes of Deezloader Remix."
HOMEPAGE="https://git.rip/RemixDev/deemix"
SRC_URI="https://git.rip/RemixDev/${PN}/-/archive/${COMMIT}/${PN}-${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

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
S="${WORKDIR}/${PN}-${COMMIT}"

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
