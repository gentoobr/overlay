# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/pedroportales/${PN}"

DESCRIPTION="Info script written in Shell Script."
HOMEPAGE="https://github.com/pedroportales/ppfetch"
LICENSE="AGPL-3"

LICENSE="AGPL-3"
SLOT="0"

src_install() {
	exeinto /usr/bin &&
		newexe ppfetch ppfetch ||
		die "Failed to install pffetch"
}
