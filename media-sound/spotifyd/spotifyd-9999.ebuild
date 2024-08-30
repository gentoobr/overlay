# Copyright 2023-2024 Gentoo Brazilian Community
# Distributed under the terms of the GNU General Public License v2-or-later

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

inherit cargo git-r3

EGIT_REPO_URI="${HOMEPAGE}"

# Don't search the gentoo mirrors for this, you won't find it
RESTRICT="mirror"

src_unpack() {
	git-r3_fetch $EGIT_REPO_URI 'refs/heads/master'
	git-r3_checkout
	cargo_live_src_unpack
	default
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
