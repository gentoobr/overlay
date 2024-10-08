# Copyright 2023-2024 Gentoo Brazilian Community
# Distributed under the terms of the GNU General Public License v2-or-later

EAPI=8

DESCRIPTION="A Spotify playing daemon"

HOMEPAGE="https://github.com/Spotifyd/spotifyd"

CRATES="
	addr2line@0.19.0
	adler@1.0.2
	aes@0.6.0
	aes@0.7.5
	aes-ctr@0.6.0
	aes-soft@0.6.4
	aesni@0.10.0
	aho-corasick@0.7.20
	alsa@0.6.0
	alsa@0.7.0
	alsa-sys@0.3.1
	android_system_properties@0.1.5
	ansi_term@0.12.1
	async-broadcast@0.5.1
	async-channel@1.8.0
	async-executor@1.5.0
	async-fs@1.6.0
	async-io@1.13.0
	async-lock@2.7.0
	async-recursion@1.0.4
	async-task@4.4.0
	async-trait@0.1.68
	atomic-waker@1.1.0
	atty@0.2.14
	autocfg@1.1.0
	backtrace@0.3.67
	base64@0.13.1
	bindgen@0.64.0
	bitflags@1.3.2
	block-buffer@0.9.0
	block-buffer@0.10.4
	block-modes@0.8.1
	block-padding@0.2.1
	blocking@1.3.0
	bumpalo@3.12.0
	byteorder@1.4.3
	bytes@1.4.0
	cc@1.0.79
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-if@1.0.0
	chrono@0.4.24
	cipher@0.2.5
	cipher@0.3.0
	clang-sys@1.6.1
	clap@2.34.0
	codespan-reporting@0.11.1
	color-eyre@0.6.2
	color-spantrace@0.2.0
	combine@4.6.6
	concurrent-queue@2.1.0
	cookie@0.16.2
	cookie_store@0.19.0
	core-foundation@0.9.3
	core-foundation-sys@0.8.3
	coreaudio-rs@0.10.0
	coreaudio-sys@0.2.12
	cpal@0.13.5
	cpufeatures@0.2.6
	crossbeam-utils@0.8.15
	crypto-common@0.1.6
	crypto-mac@0.11.1
	ctr@0.6.0
	cxx@1.0.94
	cxx-build@1.0.94
	cxxbridge-flags@1.0.94
	cxxbridge-macro@1.0.94
	daemonize@0.5.0
	darling@0.13.4
	darling_core@0.13.4
	darling_macro@0.13.4
	dbus@0.9.7
	dbus-crossroads@0.5.2
	dbus-tokio@0.7.6
	deranged@0.3.11
	derivative@2.2.0
	digest@0.9.0
	digest@0.10.6
	dirs@4.0.0
	dirs-sys@0.3.7
	enum_dispatch@0.3.11
	enumflags2@0.7.5
	enumflags2_derive@0.7.4
	env_logger@0.10.0
	errno@0.3.0
	errno-dragonfly@0.1.2
	error-chain@0.12.4
	event-listener@2.5.3
	eyre@0.6.8
	fastrand@1.9.0
	fern@0.6.2
	fixedbitset@0.4.2
	fnv@1.0.7
	form_urlencoded@1.1.0
	futures@0.3.27
	futures-channel@0.3.27
	futures-core@0.3.27
	futures-executor@0.3.27
	futures-io@0.3.27
	futures-lite@1.12.0
	futures-macro@0.3.27
	futures-sink@0.3.27
	futures-task@0.3.27
	futures-util@0.3.27
	generic-array@0.14.7
	gethostname@0.4.1
	getrandom@0.2.8
	gimli@0.27.2
	glob@0.3.1
	hashbrown@0.12.3
	headers@0.3.8
	headers-core@0.2.0
	heck@0.3.3
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.2.6
	hermit-abi@0.3.1
	hex@0.4.3
	hkdf@0.12.3
	hmac@0.11.0
	hmac@0.12.1
	hostname@0.3.1
	http@0.2.9
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.2
	humantime@2.1.0
	hyper@0.14.25
	hyper-proxy@0.9.1
	iana-time-zone@0.1.54
	iana-time-zone-haiku@0.1.1
	ident_case@1.0.1
	idna@0.3.0
	if-addrs@0.7.0
	indenter@0.3.3
	indexmap@1.9.3
	instant@0.1.12
	io-lifetimes@1.0.9
	is-terminal@0.4.6
	itoa@1.0.6
	jni@0.19.0
	jni-sys@0.3.0
	jobserver@0.1.26
	js-sys@0.3.61
	keyring@2.0.1
	lazy_static@1.4.0
	lazycell@1.3.0
	lewton@0.10.2
	libc@0.2.140
	libdbus-sys@0.2.4
	libloading@0.7.4
	libm@0.2.6
	libmdns@0.7.5
	libpulse-binding@2.27.1
	libpulse-simple-binding@2.27.1
	libpulse-simple-sys@1.20.1
	libpulse-sys@1.20.1
	librespot-audio@0.4.2
	librespot-connect@0.4.2
	librespot-core@0.4.2
	librespot-discovery@0.4.2
	librespot-metadata@0.4.2
	librespot-playback@0.4.2
	librespot-protocol@0.4.2
	link-cplusplus@1.0.8
	linux-keyutils@0.2.3
	linux-raw-sys@0.3.0
	lock_api@0.4.9
	log@0.4.17
	mach@0.3.2
	match_cfg@0.1.0
	maybe-async@0.2.7
	memchr@2.5.0
	memoffset@0.6.5
	memoffset@0.7.1
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.6.2
	mio@0.8.6
	multimap@0.8.3
	ndk@0.6.0
	ndk-context@0.1.1
	ndk-glue@0.6.2
	ndk-macro@0.3.0
	ndk-sys@0.3.0
	nix@0.23.2
	nix@0.24.3
	nix@0.26.2
	nom@7.1.3
	num@0.4.0
	num-bigint@0.4.3
	num-complex@0.4.3
	num-conv@0.1.0
	num-derive@0.3.3
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.15
	num_cpus@1.15.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.6
	object@0.30.3
	oboe@0.4.6
	oboe-sys@0.4.5
	ogg@0.8.0
	once_cell@1.17.1
	opaque-debug@0.3.0
	ordered-stream@0.2.0
	owo-colors@3.5.0
	parking@2.0.0
	parking_lot@0.11.2
	parking_lot@0.12.1
	parking_lot_core@0.8.6
	parking_lot_core@0.9.7
	pbkdf2@0.8.0
	peeking_take_while@0.1.2
	percent-encoding@2.2.0
	petgraph@0.6.3
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.26
	polling@2.6.0
	portaudio-rs@0.3.2
	portaudio-sys@0.1.1
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	priority-queue@1.3.1
	proc-macro-crate@1.3.1
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.86
	protobuf@2.28.0
	protobuf-codegen@2.28.0
	protobuf-codegen-pure@2.28.0
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex@1.7.3
	regex-syntax@0.6.29
	ring@0.16.20
	rodio@0.15.0
	rspotify@0.11.6
	rspotify-http@0.11.6
	rspotify-macros@0.11.6
	rspotify-model@0.11.6
	rustc-demangle@0.1.22
	rustc-hash@1.1.0
	rustc-serialize@0.3.25
	rustc_version@0.4.0
	rustix@0.37.5
	rustls@0.20.8
	rustversion@1.0.12
	ryu@1.0.13
	same-file@1.0.6
	scopeguard@1.1.0
	scratch@1.0.5
	sct@0.7.0
	secret-service@3.0.1
	security-framework@2.8.2
	security-framework-sys@2.8.0
	semver@1.0.17
	serde@1.0.209
	serde_derive@1.0.209
	serde_json@1.0.95
	serde_repr@0.1.12
	serde_spanned@0.6.1
	sha-1@0.9.8
	sha-1@0.10.1
	sha1@0.10.5
	sha2@0.10.6
	shannon@0.2.0
	sharded-slab@0.1.4
	shell-words@1.1.0
	shlex@1.1.0
	signal-hook-registry@1.4.1
	slab@0.4.8
	smallvec@1.10.0
	socket2@0.4.9
	spin@0.5.2
	static_assertions@1.1.0
	stdweb@0.1.3
	strsim@0.8.0
	strsim@0.10.0
	structopt@0.3.26
	structopt-derive@0.4.18
	strum@0.24.1
	strum_macros@0.24.3
	subtle@2.4.1
	syn@1.0.109
	syn@2.0.76
	syslog@6.0.1
	tempfile@3.5.0
	termcolor@1.2.0
	textwrap@0.11.0
	thiserror@1.0.40
	thiserror-impl@1.0.40
	thread-id@4.0.0
	thread_local@1.1.7
	time@0.1.45
	time@0.3.36
	time-core@0.1.2
	time-macros@0.2.18
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.27.0
	tokio-macros@2.0.0
	tokio-stream@0.1.12
	tokio-util@0.7.7
	toml@0.7.3
	toml_datetime@0.6.1
	toml_edit@0.19.8
	tower-service@0.3.2
	tracing@0.1.37
	tracing-attributes@0.1.23
	tracing-core@0.1.30
	tracing-error@0.2.0
	tracing-subscriber@0.3.16
	try-lock@0.2.4
	typenum@1.16.0
	uds_windows@1.0.2
	unicode-bidi@0.3.13
	unicode-ident@1.0.8
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	untrusted@0.7.1
	ureq@2.6.2
	url@2.3.1
	uuid@1.3.0
	valuable@0.1.0
	vec_map@0.8.2
	vergen@3.2.0
	version_check@0.9.4
	waker-fn@1.1.0
	walkdir@2.3.3
	want@0.3.0
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.84
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-shared@0.2.84
	web-sys@0.3.61
	webpki@0.22.0
	webpki-roots@0.22.6
	whoami@1.4.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.43.0
	windows@0.46.0
	windows-sys@0.45.0
	windows-targets@0.42.2
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_msvc@0.42.2
	windows_i686_gnu@0.42.2
	windows_i686_msvc@0.42.2
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_msvc@0.42.2
	winnow@0.4.1
	xdg@2.4.1
	zbus@3.11.1
	zbus_macros@3.11.1
	zbus_names@2.5.0
	zerocopy@0.6.1
	zerocopy-derive@0.3.2
	zvariant@3.12.0
	zvariant_derive@3.12.0
	zvariant_utils@1.0.0
"

inherit cargo

SRC_URI="
	https://github.com/Spotifyd/spotifyd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64"

IUSE="pulseaudio alsa portaudio +dbus systemd"

REQUIRED_USE="|| ( pulseaudio alsa portaudio )"

COMMON_DEPEND="
	dbus? ( >=sys-apps/dbus-1.12.20-r1 )
	alsa? ( >=media-libs/alsa-lib-1.2.5.1 )
	pulseaudio? ( >=media-libs/libpulse-13 )
	portaudio? ( media-libs/portaudio )"

RDEPEND="
	${COMMON_DEPEND}
	>=media-libs/libogg-1.3.5"

DEPEND="${COMMON_DEPEND}"

BDEPEND=">=virtual/rust-1.79.0"

# Don't search the gentoo mirrors for this, you won't find it
RESTRICT="mirror"

PATCHES+=( "${FILESDIR}/${P}-cargo-update.patch" )

src_configure() {
	local myfeatures=(
		$(use alsa && echo "alsa_backend")
		$(use pulseaudio && echo "pulseaudio_backend")
		$(use portaudio && echo "portaudio_backend")
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
