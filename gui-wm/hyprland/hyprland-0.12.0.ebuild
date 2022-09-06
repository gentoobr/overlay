# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs meson

DESCRIPTION="Dynamic tiling Wayland compositor that doesn't sacrifice on its looks."
HOMEPAGE="https://github.com/hyprwm/Hyprland"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/Hyprland"
else
	MY_PV="${PV}beta"
	SRC_URI="https://github.com/hyprwm/Hyprland/releases/download/v${MY_PV}/source-v${MY_PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="X"

DEPEND="
	dev-libs/libinput
	dev-libs/wayland
	dev-libs/wayland-protocols
	>=gui-libs/wlroots-0.16.0:=[X?]
	media-libs/mesa:=[gles2,wayland,X?]
	x11-libs/cairo:=[X?,svg]
	x11-libs/gtk+:3=[wayland,X?]
	x11-libs/libdrm
	x11-libs/libxkbcommon:=[X?]
	x11-libs/pango:=[X?]
	x11-libs/pixman
	X? (
		x11-base/xwayland
		x11-libs/libxcb
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/wayland-scanner
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${PN}-0.10.3beta-system-wlroots.patch"
)

src_configure() {
	local emesonargs=(
		-Duse_system_wlroots=enabled
		$(meson_feature X xwayland)
	)
	meson_src_configure
}
