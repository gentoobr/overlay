# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pedroportales/${PN}"
else
	SRC_URI="https://github.com/pedroportales/ppfetch/archive/refs/tags/v1.0.0.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Info script written in Shell Script."
HOMEPAGE="https://github.com/pedroportales/ppfetch"

LICENSE="AGPL-3"
SLOT="0"

src_install() {
	exeinto /usr/bin &&
		newexe ppfetch ppfetch ||
		die "Failed to install pffetch"
}
