# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo git-r3

CRATES=""

DESCRIPTION="An experimental Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io"
MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}"
EGIT_REPO_URI="https://github.com/rust-analyzer/rust-analyzer"
LICENSE="BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD-3 Boost-1.0 CC0-1.0 ISC MIT Unlicense ZLIB"
RESTRICT="mirror"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/rust-1.46.0[rls]"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install --path "./crates/rust-analyzer"
}
