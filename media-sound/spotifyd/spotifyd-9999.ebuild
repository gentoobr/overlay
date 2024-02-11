# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Spotify playing daemon"

HOMEPAGE="https://github.com/Spotifyd/spotifyd"

LICENSE="GPL-3"

SLOT="0"

IUSE="+alsa dbus pulseaudio portaudio systemd rodio"

REQUIRED_USE="|| ( pulseaudio alsa portaudio rodio )"

COMMON_DEPEND="
	dbus? ( >=sys-apps/dbus-1.12.20-r1 )
	alsa? ( >=media-libs/alsa-lib-1.2.5.1 )
	pulseaudio? ( media-libs/libpulse )
	portaudio? ( media-libs/portaudio )"

RDEPEND="
	${COMMON_DEPEND}
	>=media-libs/libogg-1.3.5"

DEPEND="${COMMON_DEPEND}"

BDEPEND=">=virtual/rust-1.53.0"


inherit cargo
if [[ $PV == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	CRATES="
	addr2line-0.17.0
	adler-1.0.2
	aes-0.6.0
	aes-0.7.5
	aes-ctr-0.6.0
	aes-soft-0.6.4
	aesni-0.10.0
	aho-corasick-0.7.19
	alsa-0.5.0
	alsa-0.6.0
	alsa-sys-0.3.1
	android_system_properties-0.1.5
	ansi_term-0.12.1
	async-io-1.9.0
	async-trait-0.1.57
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.66
	base64-0.13.0
	bindgen-0.59.2
	bitflags-1.3.2
	block-buffer-0.9.0
	block-buffer-0.10.3
	block-modes-0.8.1
	block-padding-0.2.1
	boxfnonce-0.1.1
	bumpalo-3.11.0
	byteorder-1.4.3
	bytes-0.4.12
	bytes-0.5.6
	bytes-1.2.1
	cache-padded-1.2.0
	cc-1.0.73
	cesu8-1.1.0
	cexpr-0.6.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.22
	chunked_transfer-1.4.0
	cipher-0.2.5
	cipher-0.3.0
	clang-sys-1.4.0
	clap-2.34.0
	cloudabi-0.0.3
	color-eyre-0.5.11
	color-spantrace-0.1.6
	combine-4.6.6
	concurrent-queue-1.2.4
	cookie-0.16.0
	cookie_store-0.16.1
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	coreaudio-rs-0.10.0
	coreaudio-sys-0.2.10
	cpal-0.13.5
	cpufeatures-0.2.5
	crossbeam-utils-0.7.2
	crypto-common-0.1.6
	crypto-mac-0.11.1
	ctr-0.6.0
	daemonize-0.4.1
	darling-0.13.4
	darling_core-0.13.4
	darling_macro-0.13.4
	dbus-0.9.6
	dbus-crossroads-0.4.0
	dbus-tokio-0.7.5
	derivative-2.2.0
	digest-0.9.0
	digest-0.10.5
	dirs-4.0.0
	dirs-sys-0.3.7
	enumflags2-0.6.4
	enumflags2_derive-0.6.4
	env_logger-0.7.1
	error-chain-0.11.0
	eyre-0.6.8
	fastrand-1.8.0
	fern-0.6.1
	fnv-1.0.7
	form_urlencoded-1.1.0
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.1.31
	futures-0.3.24
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-lite-1.12.0
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	gcc-0.3.55
	generic-array-0.14.6
	gethostname-0.2.3
	getrandom-0.2.7
	gimli-0.26.2
	glob-0.3.0
	hashbrown-0.12.3
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	hkdf-0.11.0
	hmac-0.11.0
	hostname-0.3.1
	http-0.2.8
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	humantime-1.3.0
	hyper-0.14.20
	iana-time-zone-0.1.50
	ident_case-1.0.1
	idna-0.2.3
	idna-0.3.0
	if-addrs-0.6.7
	if-addrs-sys-0.3.2
	indenter-0.3.3
	indexmap-1.9.1
	instant-0.1.12
	iovec-0.1.4
	itoa-1.0.3
	jni-0.19.0
	jni-sys-0.3.0
	jobserver-0.1.25
	js-sys-0.3.60
	kernel32-sys-0.2.2
	keyring-0.10.4
	lazy_static-1.4.0
	lazycell-1.3.0
	lewton-0.10.2
	libc-0.2.133
	libdbus-sys-0.2.2
	libloading-0.7.3
	libmdns-0.6.2
	libpulse-binding-2.26.0
	libpulse-simple-binding-2.25.0
	libpulse-simple-sys-1.19.2
	libpulse-sys-1.19.3
	librespot-audio-0.2.0
	librespot-connect-0.2.0
	librespot-core-0.2.0
	librespot-metadata-0.2.0
	librespot-playback-0.2.0
	librespot-protocol-0.2.0
	librespot-tremor-0.2.0
	lock_api-0.3.4
	lock_api-0.4.9
	log-0.4.17
	mach-0.3.2
	match_cfg-0.1.0
	matches-0.1.9
	maybe-async-0.2.6
	maybe-uninit-2.0.0
	memchr-2.5.0
	memoffset-0.6.5
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	mio-0.6.23
	mio-0.8.4
	miow-0.2.2
	multimap-0.8.3
	nb-connect-1.2.0
	ndk-0.6.0
	ndk-context-0.1.1
	ndk-glue-0.6.2
	ndk-macro-0.3.0
	ndk-sys-0.3.0
	net2-0.2.37
	nix-0.20.0
	nix-0.22.3
	nix-0.23.1
	nom-7.1.1
	num-0.4.0
	num-bigint-0.4.3
	num-complex-0.4.2
	num-derive-0.3.3
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.13.1
	num_enum-0.5.7
	num_enum_derive-0.5.7
	num_threads-0.1.6
	object-0.29.0
	oboe-0.4.6
	oboe-sys-0.4.5
	ogg-0.8.0
	ogg-sys-0.0.9
	once_cell-1.15.0
	opaque-debug-0.3.0
	owo-colors-1.3.0
	parking-2.0.0
	parking_lot-0.9.0
	parking_lot-0.11.2
	parking_lot_core-0.6.2
	parking_lot_core-0.8.5
	pbkdf2-0.8.0
	peeking_take_while-0.1.2
	percent-encoding-2.2.0
	pin-project-lite-0.1.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	polling-2.3.0
	portaudio-rs-0.3.2
	portaudio-sys-0.1.1
	ppv-lite86-0.2.16
	priority-queue-1.2.3
	proc-macro-crate-0.1.5
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.44
	protobuf-2.14.0
	protobuf-codegen-2.14.0
	protobuf-codegen-pure-2.14.0
	psl-types-2.0.11
	publicsuffix-2.2.2
	quick-error-1.2.3
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	redox_syscall-0.1.57
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.6.0
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	ring-0.16.20
	rodio-0.13.1
	rspotify-0.11.5
	rspotify-http-0.11.5
	rspotify-macros-0.11.5
	rspotify-model-0.11.5
	rustc-demangle-0.1.21
	rustc-hash-1.1.0
	rustc-serialize-0.3.24
	rustc_version-0.2.3
	rustc_version-0.4.0
	rustls-0.20.6
	rustversion-1.0.9
	ryu-1.0.11
	same-file-1.0.6
	scoped-tls-1.0.0
	scopeguard-1.1.0
	sct-0.7.0
	secret-service-2.0.2
	security-framework-2.7.0
	security-framework-sys-2.6.1
	semver-0.9.0
	semver-1.0.14
	semver-parser-0.7.0
	serde-1.0.145
	serde_derive-1.0.145
	serde_json-1.0.85
	serde_repr-0.1.9
	sha-1-0.9.8
	sha2-0.9.9
	sha2-0.10.6
	shannon-0.2.0
	sharded-slab-0.1.4
	shell-words-1.1.0
	shlex-1.1.0
	signal-hook-registry-1.4.0
	slab-0.4.7
	smallvec-0.6.14
	smallvec-1.9.0
	socket2-0.4.7
	spin-0.5.2
	static_assertions-1.1.0
	stdweb-0.1.3
	strsim-0.8.0
	strsim-0.10.0
	structopt-0.3.26
	structopt-derive-0.4.18
	strum-0.24.1
	strum_macros-0.24.3
	subtle-2.4.1
	syn-1.0.100
	synstructure-0.12.6
	syslog-4.0.1
	tempfile-3.3.0
	termcolor-1.1.3
	textwrap-0.11.0
	thiserror-1.0.36
	thiserror-impl-1.0.36
	thread_local-1.1.4
	time-0.1.44
	time-0.3.14
	time-macros-0.2.4
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-0.2.25
	tokio-1.21.1
	tokio-compat-0.1.6
	tokio-compat-02-0.2.0
	tokio-current-thread-0.1.7
	tokio-executor-0.1.10
	tokio-io-0.1.13
	tokio-macros-1.8.0
	tokio-reactor-0.1.12
	tokio-stream-0.1.10
	tokio-sync-0.1.8
	tokio-timer-0.2.13
	tokio-util-0.6.10
	toml-0.5.9
	tower-service-0.3.2
	tracing-0.1.36
	tracing-attributes-0.1.22
	tracing-core-0.1.29
	tracing-error-0.1.2
	tracing-subscriber-0.2.25
	try-lock-0.2.3
	typenum-1.15.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.4
	unicode-normalization-0.1.22
	unicode-segmentation-1.10.0
	unicode-width-0.1.10
	unicode-xid-0.2.4
	untrusted-0.7.1
	ureq-2.5.0
	url-2.3.1
	uuid-0.8.2
	valuable-0.1.0
	vec_map-0.8.2
	vergen-3.2.0
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.2
	want-0.3.0
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	web-sys-0.3.60
	webpki-0.22.0
	webpki-roots-0.22.5
	wepoll-ffi-0.1.2
	whoami-0.9.0
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	ws2_32-sys-0.2.1
	xdg-2.4.1
	zbus-1.9.3
	zbus_macros-1.9.3
	zerocopy-0.3.0
	zerocopy-derive-0.2.0
	zvariant-2.10.0
	zvariant_derive-2.10.0"

	SRC_URI="
	https://github.com/Spotifyd/spotifyd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
fi

# Don't search the gentoo mirrors for this, you won't find it
RESTRICT="mirror"

src_unpack() {
	if [[ $PV == 9999 ]]; then
		git-r3_fetch $EGIT_REPO_URI 'refs/heads/master'
		git-r3_checkout
		cargo_live_src_unpack
	else default
	fi
}
src_configure() {
	local myfeatures=(
		$(use alsa && echo "alsa_backend")
		$(use pulseaudio && echo "pulseaudio_backend")
		$(use portaudio && echo "portaudio_backend")
		$(use rodio && echo "rodio_backend")
		$(if use dbus ; then
			echo "dbus_keyring"
			echo "dbus_mpris"
		fi)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install
	dodoc "${S}/README.md"
	# install the .service file if systemd (work/contrib/spotifyd.service)
	if ( use systemd )  then
		USERSERVICEDIR="/etc/systemd/user/"
		einfo "Copying systemd service file to ${USERSERVICEDIR}"
		dodir $USERSERVICEDIR
		insinto $USERSERVICEDIR
		doins "${S}/contrib/spotifyd.service"
	fi
}

pkg_postinst() {
	einfo "You'll need to provide some info to the spotifyd process in order to play songs."
	einfo "This can be done by starting spotifyd with the proper arguments or by"
	einfo "setting up a configuration file at ~/.config/spotifyd ."
	elog "See https://spotifyd.github.io/spotifyd/config/File.html for more information."
}
