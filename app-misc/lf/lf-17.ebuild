# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="a terminal file manager written in Go"
HOMEPAGE="https://github.com/gokcehan/lf"
EGO_SUM=(
	"github.com/DATA-DOG/go-sqlmock v1.3.3"
	"github.com/DATA-DOG/go-sqlmock v1.3.3/go.mod"
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/gdamore/tcell v1.3.0"
	"github.com/gdamore/tcell v1.3.0/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.2"
	"github.com/lucasb-eyer/go-colorful v1.0.2/go.mod"
	"github.com/mattn/go-runewidth v0.0.4"
	"github.com/mattn/go-runewidth v0.0.4/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"golang.org/x/sys v0.0.0-20190626150813-e07cf5db2756"
	"golang.org/x/sys v0.0.0-20190626150813-e07cf5db2756/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"gopkg.in/djherbis/times.v1 v1.2.0"
	"gopkg.in/djherbis/times.v1 v1.2.0/go.mod"
)
go-module_set_globals
SRC_URI="https://github.com/gokcehan/lf/archive/r${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fish-completion"

DEPEND="
	dev-lang/go
"
RDEPEND=""
S="${WORKDIR}/${PN}-r${PV}"
DOCS="README.md etc/lfrc.example"

src_compile() {
	go build || die
}

src_install() {
	dobin lf
	einstalldocs

	insinto /usr/share/${PN}
	doins etc/lfcd.sh
	doman lf.1

	# fish
	if use fish-completion; then
		insinto /usr/share/fish/vendor_completions.d
		doins etc/lf.fish
		insinto /usr/share/fish/vendor_functions.d
		doins etc/lfcd.fish
	fi
}
