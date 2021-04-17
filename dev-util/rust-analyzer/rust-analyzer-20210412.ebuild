# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

CRATES="
	addr2line-0.14.1
	adler-1.0.2
	always-assert-0.1.2
	ansi_term-0.12.1
	anyhow-1.0.40
	anymap-0.12.1
	arrayvec-0.7.0
	atty-0.2.14
	autocfg-1.0.1
	backtrace-0.3.56
	bitflags-1.2.1
	byteorder-1.4.3
	camino-1.0.4
	cargo-platform-0.1.1
	cargo_metadata-0.13.1
	cc-1.0.67
	cfg-if-1.0.0
	chalk-derive-0.60.0
	chalk-ir-0.60.0
	chalk-recursive-0.60.0
	chalk-solve-0.60.0
	chrono-0.4.19
	countme-2.0.4
	cov-mark-1.1.0
	crc32fast-1.2.1
	crossbeam-channel-0.5.0
	crossbeam-deque-0.8.0
	crossbeam-epoch-0.9.3
	crossbeam-utils-0.8.3
	dashmap-4.0.2
	dissimilar-1.0.2
	drop_bomb-0.1.5
	either-1.6.1
	ena-0.14.0
	env_logger-0.8.3
	expect-test-1.1.0
	filetime-0.2.14
	fixedbitset-0.2.0
	flate2-1.0.20
	form_urlencoded-1.0.1
	fs_extra-1.2.0
	fsevent-2.0.2
	fsevent-sys-3.0.2
	fst-0.4.5
	gimli-0.23.0
	hashbrown-0.9.1
	heck-0.3.2
	hermit-abi-0.1.18
	home-0.5.3
	idna-0.2.2
	indexmap-1.6.2
	inotify-0.9.2
	inotify-sys-0.1.5
	instant-0.1.9
	itertools-0.10.0
	itoa-0.4.7
	jemalloc-ctl-0.3.3
	jemalloc-sys-0.3.2
	jemallocator-0.3.2
	jod-thread-0.1.2
	lazy_static-1.4.0
	libc-0.2.93
	libloading-0.7.0
	libmimalloc-sys-0.1.21
	lock_api-0.4.3
	log-0.4.14
	lsp-server-0.5.0
	lsp-types-0.89.0
	matchers-0.0.1
	matches-0.1.8
	memchr-2.3.4
	memmap-0.7.0
	memmap2-0.2.2
	memoffset-0.6.3
	mimalloc-0.1.25
	miniz_oxide-0.4.4
	mio-0.7.11
	miow-0.3.7
	notify-5.0.0-pre.6
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	object-0.23.0
	once_cell-1.7.2
	oorandom-11.1.3
	parking_lot-0.11.1
	parking_lot_core-0.8.3
	paste-0.1.18
	paste-impl-0.1.18
	percent-encoding-2.1.0
	perf-event-0.4.6
	perf-event-open-sys-1.0.1
	pest-2.1.3
	petgraph-0.5.1
	pin-project-lite-0.2.6
	proc-macro-hack-0.5.19
	proc-macro2-1.0.26
	pulldown-cmark-0.8.0
	pulldown-cmark-to-cmark-6.0.0
	quote-1.0.9
	rayon-1.5.0
	rayon-core-1.9.0
	redox_syscall-0.2.5
	regex-1.4.5
	regex-automata-0.1.9
	regex-syntax-0.6.23
	rowan-0.13.0-pre.3
	rustc-ap-rustc_lexer-714.0.0
	rustc-demangle-0.1.18
	rustc-hash-1.1.0
	ryu-1.0.5
	salsa-0.16.0
	salsa-macros-0.16.0
	same-file-1.0.6
	scoped-tls-1.0.0
	scopeguard-1.1.0
	semver-0.11.0
	semver-parser-0.10.2
	serde-1.0.125
	serde_derive-1.0.125
	serde_json-1.0.64
	serde_path_to_error-0.1.4
	serde_repr-0.1.6
	sharded-slab-0.1.1
	smallvec-1.6.1
	smol_str-0.1.17
	snap-1.0.4
	syn-1.0.69
	synstructure-0.12.4
	termcolor-1.1.2
	text-size-1.1.0
	thread_local-1.1.3
	threadpool-1.8.1
	tinyvec-1.2.0
	tinyvec_macros-0.1.0
	tracing-0.1.25
	tracing-attributes-0.1.15
	tracing-core-0.1.17
	tracing-log-0.1.2
	tracing-serde-0.1.2
	tracing-subscriber-0.2.17
	tracing-tree-0.1.9
	ucd-trie-0.1.3
	ungrammar-1.13.0
	unicase-2.6.0
	unicode-bidi-0.3.5
	unicode-normalization-0.1.17
	unicode-segmentation-1.7.1
	unicode-xid-0.2.1
	url-2.2.1
	version_check-0.9.3
	walkdir-2.3.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	write-json-0.1.2
	xflags-0.2.1
	xflags-macros-0.2.1
	xshell-0.1.9
	xshell-macros-0.1.9
"

MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rust-analyzer/rust-analyzer"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/rust-analyzer/rust-analyzer/archive/${MY_PV}.tar.gz -> ${P}.tar.gz $(cargo_crate_uris ${CRATES})"
fi

DESCRIPTION="An experimental Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io"

LICENSE="BSD Apache-2.0 Boost-1.0 CC0-1.0 ISC MIT Unlicense ZLIB"
RESTRICT="mirror"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/rust-1.46.0[rls]"
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
		mv -T "${PN}-${MY_PV}" "${P}" || die
	fi
}

src_install() {
	cargo_src_install --path "./crates/rust-analyzer"
}
