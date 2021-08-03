# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Spotify playing daemon"

HOMEPAGE="https://github.com/Spotifyd/spotifyd"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64"

IUSE="pulseaudio alsa portaudio +dbus -systemd"

REQUIRED_USE="|| ( pulseaudio alsa portaudio )"

COMMON_DEPEND="dbus? ( >=sys-apps/dbus-1.12.20-r1 )
		alsa? ( >=media-libs/alsa-lib-1.2.5.1 )
		pulseaudio? ( >=media-sound/pulseaudio-13.0-r1 )
		portaudio? ( media-libs/portaudio )"

RDEPEND="${COMMON_DEPEND}
		>=media-libs/libogg-1.3.5"

DEPEND="${COMMON_DEPEND}"

BDEPEND=">=dev-lang/rust-1.53.0"

CRATES="addr2line-0.14.1
		adler-0.2.3
		aes-0.3.2
		aes-0.6.0
		aes-ctr-0.3.0
		aes-soft-0.3.3
		aes-soft-0.6.4
		aesni-0.6.0
		aesni-0.10.0
		aho-corasick-0.7.6
		alga-0.9.2
		alsa-0.2.2
		alsa-0.3.0
		alsa-sys-0.1.2
		ansi_term-0.11.0
		anyhow-1.0.26
		approx-0.3.2
		arc-swap-0.4.4
		atty-0.2.14
		autocfg-0.1.7
		autocfg-1.0.0
		backtrace-0.3.55
		base64-0.9.3
		base64-0.10.1
		base64-0.11.0
		bindgen-0.51.1
		bit-set-0.5.1
		bit-vec-0.5.1
		bitflags-0.9.1
		bitflags-1.2.1
		block-buffer-0.7.3
		block-buffer-0.9.0
		block-cipher-trait-0.6.2
		block-modes-0.3.3
		block-modes-0.7.0
		block-padding-0.1.5
		block-padding-0.2.1
		boxfnonce-0.1.1
		bumpalo-3.2.0
		byte-tools-0.3.1
		byteorder-1.3.2
		bytes-0.4.12
		bytes-0.5.4
		c2-chacha-0.2.3
		c_linked_list-1.1.1
		cc-1.0.50
		cexpr-0.3.6
		cfg-if-0.1.10
		cfg-if-1.0.0
		chrono-0.4.11
		cipher-0.2.5
		clang-sys-0.28.1
		clap-2.33.0
		cloudabi-0.0.3
		color-eyre-0.5.10
		color-spantrace-0.1.6
		core-foundation-0.6.4
		core-foundation-0.7.0
		core-foundation-sys-0.5.1
		core-foundation-sys-0.6.2
		core-foundation-sys-0.7.0
		coreaudio-rs-0.9.1
		coreaudio-sys-0.2.3
		cpal-0.8.2
		cpuid-bool-0.1.2
		crossbeam-deque-0.7.2
		crossbeam-epoch-0.8.0
		crossbeam-queue-0.1.2
		crossbeam-utils-0.6.6
		crossbeam-utils-0.7.0
		crypto-mac-0.7.0
		crypto-mac-0.10.0
		ctr-0.3.2
		daemonize-0.4.1
		darling-0.9.0
		darling_core-0.9.0
		darling_macro-0.9.0
		dbus-0.2.3
		dbus-0.6.5
		dbus-tokio-0.2.1
		derefable-0.1.0
		derive_builder-0.7.2
		derive_builder_core-0.5.0
		digest-0.8.1
		digest-0.9.0
		dotenv-0.13.0
		dtoa-0.4.4
		either-1.5.3
		encoding_rs-0.8.22
		env_logger-0.6.2
		env_logger-0.7.1
		error-chain-0.11.0
		error-chain-0.12.1
		eyre-0.6.5
		failure-0.1.7
		failure_derive-0.1.7
		fake-simd-0.1.2
		fern-0.6.0
		fnv-1.0.6
		foreign-types-0.3.2
		foreign-types-shared-0.1.1
		fuchsia-cprng-0.1.1
		fuchsia-zircon-0.3.3
		fuchsia-zircon-sys-0.3.3
		futures-0.1.29
		futures-0.3.4
		futures-channel-0.3.4
		futures-core-0.3.4
		futures-cpupool-0.1.8
		futures-executor-0.3.4
		futures-io-0.3.4
		futures-macro-0.3.4
		futures-sink-0.3.4
		futures-task-0.3.4
		futures-util-0.3.4
		gcc-0.3.55
		generic-array-0.12.3
		generic-array-0.14.4
		get_if_addrs-0.5.3
		get_if_addrs-sys-0.1.1
		gethostname-0.2.1
		getopts-0.2.21
		getrandom-0.1.14
		gimli-0.23.0
		glob-0.3.0
		h2-0.2.1
		heck-0.3.1
		hermit-abi-0.1.6
		hex-0.3.2
		hex-0.4.2
		hkdf-0.10.0
		hmac-0.7.1
		hmac-0.10.1
		hostname-0.3.1
		http-0.2.0
		http-body-0.3.1
		httparse-1.3.4
		humantime-1.3.0
		hyper-0.11.27
		hyper-0.13.2
		hyper-proxy-0.4.1
		hyper-tls-0.4.1
		ident_case-1.0.1
		idna-0.1.5
		idna-0.2.0
		indenter-0.3.2
		indexmap-1.3.0
		iovec-0.1.4
		itertools-0.8.2
		itoa-0.4.4
		js-sys-0.3.35
		kernel32-sys-0.2.2
		keyring-0.10.1
		language-tags-0.2.2
		lazy_static-1.4.0
		lewton-0.9.4
		libc-0.2.82
		libdbus-sys-0.2.1
		libloading-0.5.2
		libm-0.1.4
		libmdns-0.2.6
		libpulse-sys-0.0.0
		librespot-0.1.5
		librespot-audio-0.1.5
		librespot-connect-0.1.5
		librespot-core-0.1.5
		librespot-metadata-0.1.5
		librespot-playback-0.1.5
		librespot-protocol-0.1.5
		librespot-tremor-0.2.0
		linear-map-1.2.0
		lock_api-0.3.3
		log-0.3.9
		log-0.4.8
		match_cfg-0.1.0
		matches-0.1.8
		matrixmultiply-0.2.3
		maybe-uninit-2.0.0
		memchr-2.3.0
		memoffset-0.5.3
		mime-0.3.16
		mime_guess-2.0.1
		miniz_oxide-0.4.3
		mio-0.6.21
		mio-named-pipes-0.1.6
		mio-uds-0.6.7
		miow-0.2.1
		miow-0.3.3
		multimap-0.8.2
		nalgebra-0.18.1
		native-tls-0.2.3
		net2-0.2.33
		nix-0.9.0
		nix-0.14.1
		nom-4.2.3
		num-0.3.1
		num-bigint-0.2.5
		num-bigint-0.3.1
		num-complex-0.2.4
		num-complex-0.3.1
		num-integer-0.1.44
		num-iter-0.1.42
		num-rational-0.2.3
		num-rational-0.3.2
		num-traits-0.2.14
		num_cpus-1.11.1
		object-0.22.0
		ogg-0.7.0
		ogg-sys-0.0.9
		once_cell-1.5.2
		opaque-debug-0.2.3
		opaque-debug-0.3.0
		openssl-0.10.26
		openssl-probe-0.1.2
		openssl-sys-0.9.53
		owo-colors-1.2.1
		parking_lot-0.9.0
		parking_lot_core-0.6.2
		pbkdf2-0.3.0
		peeking_take_while-0.1.2
		percent-encoding-1.0.1
		percent-encoding-2.1.0
		pin-project-0.4.8
		pin-project-internal-0.4.8
		pin-project-lite-0.1.4
		pin-project-lite-0.2.4
		pin-utils-0.1.0-alpha.4
		pkg-config-0.3.17
		portaudio-rs-0.3.2
		portaudio-sys-0.1.1
		ppv-lite86-0.2.6
		proc-macro-error-1.0.2
		proc-macro-error-attr-1.0.2
		proc-macro-hack-0.5.11
		proc-macro-nested-0.1.3
		proc-macro2-0.4.30
		proc-macro2-1.0.19
		protobuf-2.14.0
		protobuf-codegen-2.14.0
		protobuf-codegen-pure-2.14.0
		quick-error-1.2.3
		quote-0.6.13
		quote-1.0.2
		rand-0.3.23
		rand-0.4.6
		rand-0.5.6
		rand-0.6.5
		rand-0.7.3
		rand_chacha-0.1.1
		rand_chacha-0.2.1
		rand_core-0.3.1
		rand_core-0.4.2
		rand_core-0.5.1
		rand_hc-0.1.0
		rand_hc-0.2.0
		rand_isaac-0.1.1
		rand_jitter-0.1.4
		rand_os-0.1.3
		rand_pcg-0.1.2
		rand_xorshift-0.1.1
		random-0.12.2
		rawpointer-0.2.1
		rdrand-0.4.0
		redox_syscall-0.1.56
		regex-1.3.3
		regex-syntax-0.6.13
		relay-0.1.1
		remove_dir_all-0.5.2
		reqwest-0.10.1
		rodio-0.9.0
		rpassword-3.0.2
		rspotify-0.8.0
		rustc-demangle-0.1.16
		rustc-hash-1.0.1
		rustc-serialize-0.3.24
		rustc_version-0.2.3
		ryu-1.0.2
		safemem-0.3.3
		schannel-0.1.16
		scoped-tls-0.1.2
		scopeguard-1.0.0
		secret-service-1.1.3
		security-framework-0.3.4
		security-framework-0.4.4
		security-framework-sys-0.3.3
		security-framework-sys-0.4.3
		semver-0.9.0
		semver-parser-0.7.0
		serde-1.0.115
		serde_derive-1.0.115
		serde_json-1.0.44
		serde_urlencoded-0.6.1
		sha-1-0.8.2
		sha-1-0.9.1
		sha2-0.8.1
		sha2-0.9.2
		shannon-0.2.0
		sharded-slab-0.1.1
		shell-words-0.1.0
		shlex-0.1.1
		signal-hook-0.1.12
		signal-hook-registry-1.2.0
		slab-0.3.0
		slab-0.4.2
		smallvec-0.2.1
		smallvec-0.6.13
		smallvec-1.1.0
		socket2-0.3.11
		sourcefile-0.1.4
		spotifyd-0.3.2
		stdweb-0.1.3
		stream-cipher-0.3.2
		strsim-0.7.0
		strsim-0.8.0
		structopt-0.3.17
		structopt-derive-0.4.10
		subtle-1.0.0
		subtle-2.4.0
		syn-0.15.44
		syn-1.0.39
		syn-mid-0.5.0
		synstructure-0.12.3
		syslog-4.0.1
		take-0.1.0
		tempfile-3.1.0
		termcolor-1.1.0
		textwrap-0.11.0
		thread_local-1.0.1
		time-0.1.42
		tokio-0.1.22
		tokio-0.2.11
		tokio-codec-0.1.1
		tokio-core-0.1.17
		tokio-current-thread-0.1.6
		tokio-executor-0.1.9
		tokio-fs-0.1.6
		tokio-io-0.1.13
		tokio-process-0.2.4
		tokio-proto-0.1.1
		tokio-reactor-0.1.11
		tokio-service-0.1.0
		tokio-signal-0.1.5
		tokio-signal-0.2.7
		tokio-socks-0.2.0
		tokio-sync-0.1.7
		tokio-tcp-0.1.3
		tokio-threadpool-0.1.17
		tokio-timer-0.2.12
		tokio-tls-0.3.0
		tokio-udp-0.1.5
		tokio-uds-0.2.5
		tokio-util-0.2.0
		toml-0.5.8
		tower-service-0.3.0
		tracing-0.1.22
		tracing-attributes-0.1.11
		tracing-core-0.1.17
		tracing-error-0.1.2
		tracing-subscriber-0.2.15
		try-lock-0.1.0
		try-lock-0.2.2
		typenum-1.12.0
		unicase-2.6.0
		unicode-bidi-0.3.4
		unicode-normalization-0.1.11
		unicode-segmentation-1.6.0
		unicode-width-0.1.7
		unicode-xid-0.1.0
		unicode-xid-0.2.0
		url-1.7.2
		url-2.1.1
		uuid-0.7.4
		vcpkg-0.2.8
		vec_map-0.8.1
		vergen-3.0.4
		version_check-0.1.5
		version_check-0.9.1
		void-1.0.2
		want-0.0.4
		want-0.3.0
		wasi-0.9.0+wasi-snapshot-preview1
		wasm-bindgen-0.2.58
		wasm-bindgen-backend-0.2.58
		wasm-bindgen-futures-0.4.8
		wasm-bindgen-macro-0.2.58
		wasm-bindgen-macro-support-0.2.58
		wasm-bindgen-shared-0.2.58
		wasm-bindgen-webidl-0.2.58
		web-sys-0.3.35
		webbrowser-0.5.2
		weedle-0.10.0
		whoami-0.9.0
		widestring-0.4.0
		winapi-0.2.8
		winapi-0.3.8
		winapi-build-0.1.1
		winapi-i686-pc-windows-gnu-0.4.0
		winapi-util-0.1.3
		winapi-x86_64-pc-windows-gnu-0.4.0
		winreg-0.6.2
		ws2_32-sys-0.2.1
		xdg-2.2.0"

SRC_URI="https://github.com/Spotifyd/spotifyd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"

# Don't search the gentoo mirrors for this, you won't find it
RESTRICT="mirror"

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
	# install the .service file if systemd (work/contrib/spotifyd.service)
	if ( use systemd )  then
		USERSERVICEDIR=/etc/systemd/user/
		einfo "Copying systemd service file to ${USERSERVICEDIR}"
		dodir $USERSERVICEDIR
		insinto $USERSERVICEDIR
		doins "${S}"/contrib/spotifyd.service
	fi
}

pkg_postinst() {
	einfo "You'll need to provide some info to the spotifyd process in order to play songs."
	einfo "This can be done by starting spotifyd with the proper arguments or by"
	einfo "setting up a configuration file at ~/.config/spotifyd ."
	elog "See https://spotifyd.github.io/spotifyd/config/File.html for more information."
}
