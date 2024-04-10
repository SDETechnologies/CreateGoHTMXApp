# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: Eliot Solbrig <sdetechnologiesllc@gmail.com>
pkgname="create-go-htmx-app"
pkgver="1.0.0"
pkgrel=1
epoch=
pkgdesc="Creates a basic go/htmx program with router, service, and (optional) database layers"
arch=('x86_64')
url=""
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "$pkgname-$pkgver.tar.gz"
    )
noextract=()
sha256sums=()
validpgpkeys=()

chmod u+x CreateApp.sh
echo -e "\npkgname: $pkgname, "
echo "pkgver: $pkgver"
mkdir "$pkgname-$pkgver"

prepare() {
    echo "prepare()"
	# cd "$pkgname-$pkgver"
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}
#
check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

pkgname: create-go-htmx-app, 
pkgver: 1.0.0
sha256sums=('b8b2dff36b468fe621eedad9c1169b630df826917db60409012108d5c65fa88f')

pkgname: create-go-htmx-app, 
pkgver: 1.0.0
sha256sums=('aaa5462e8b2cd184e1d3561fd33dd5a752e3197a2e919fb9c996a9bd4c7ddb46')

pkgname: create-go-htmx-app, 
pkgver: 1.0.0
sha256sums=('87776bbbfb82c08a88749342357e49e75f93e7660b0862d96105387f160173d0')
