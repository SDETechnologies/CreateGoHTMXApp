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
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
sha256sums=()
validpgpkeys=()

chmod u+x CreateApp.sh
echo -e "\npkgname: $pkgname, "
echo "pkgver: $pkgver"
mkdir "$pkgname-$pkgver"

prepare() {
    echo "prepare()"
	cd "$pkgname-$pkgver"
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

