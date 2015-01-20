# Copyright 2015 Great OpenSource Inc.
# Distributed under the terms of the GNU General Public License v2
# Created by He Zhenxing

EAPI=4

inherit eutils autotools

DESCRIPTION="Chinese PinYin input method based on libpinyin for iBus"
HOMEPAGE="http://pkgs.fedoraproject.org/repo/pkgs/ibus-libpinyin/"
SRC_URI="http://pkgs.fedoraproject.org/repo/pkgs/ibus-libpinyin/ibus-libpinyin-1.6.92.tar.gz/728564474c4b413f4fb6e1c96ffb70d4/ibus-libpinyin-1.6.92.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="boost"

RDEPEND="
	app-i18n/ibus
	app-i18n/libpinyin
	boost? ( dev-libs/boost )"

DEPEND="${RDEPEND}"


src_prepare() {
	./autogen.sh || die "src_prepare failed"
}


src_configure() {
	econf \
		$(use_enable boost)
}


src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc ${S}/{README,COPYING,ChangeLog,AUTHORS}
}
