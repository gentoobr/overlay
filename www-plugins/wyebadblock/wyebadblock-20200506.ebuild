# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="An adblock extension for wyeb, also webkit2gtk browsers."
HOMEPAGE="https://github.com/jun7/wyebadblock"

EGIT_REPO_URI="https://github.com/jun7/${PN}"

if [[ ${PV} == *9999* ]]; then
	:
else
	EGIT_COMMIT_DATE="${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	x11-libs/gtk+:3
	net-libs/webkit-gtk
"
RDEPEND="${DEPEND}"
BDEPEND=""
