# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo git-r3

CRATES=""

DESCRIPTION="LaTeX Language Server"
HOMEPAGE="https://texlab.netlify.app"
EGIT_REPO_URI="https://github.com/latex-lsp/texlab"
LICENSE="Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 GPL-3.0 GPL-3.0+ ISC MIT MPL-2.0 Unlicense Zlib"
RESTRICT="mirror"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/rust-1.39.0"
RDEPEND=""

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
