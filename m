Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T89w3-0001MB-ET
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 09:09:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w1-0001LF-OI
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w0-000254-2E
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:53 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:25635
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89vz-00023k-Qd
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:51 -0400
Received: from treguer.bzh.lan ([90.32.144.8]) by mwinf5d26 with ME
	id uD9o1j00M0B56Sa03D9qBL; Sun, 02 Sep 2012 15:09:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-devel@nongnu.org
Date: Sun,  2 Sep 2012 15:09:46 +0200
Message-Id: <1346591386-22698-3-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.125
Cc: qemu-trivial@nongnu.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 2/2] configure: fix detection for SDL libs
	when static linking
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Sep 2012 13:09:54 -0000

Currently, configure checks for SDL libs either with pkg-config (the
default), or with sdl-config (as a fallback).

But sdl-config does not have the same set of options as pkg-config:
  - to check for shared libs, both use the option: --libs
  - to check for static libs:
    - pkg-config uses: --static --libs
    - sdl-config uses: --static-libs

Fix that by using the previously introduced $QEMU_XXX_CONFIG_LIBS_FLAGS
variable, the way it was done previously for cURL.

Also, simplify the code-path for checking for SDL libs with a single,
non-conditional call to $sdlconfig, which is either pkg-config or
sdl-config, as checked just above.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
---
 configure |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 67c9238..c5888fa 100755
--- a/configure
+++ b/configure
@@ -1646,9 +1646,11 @@ fi
 
 if $pkg_config sdl --modversion >/dev/null 2>&1; then
   sdlconfig="$pkg_config sdl"
+  sdlconfiglibs="--libs"
   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
 elif has ${sdl_config}; then
   sdlconfig="$sdl_config"
+  sdlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
 else
   if test "$sdl" = "yes" ; then
@@ -1668,11 +1670,7 @@ if test "$sdl" != "no" ; then
 int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
 EOF
   sdl_cflags=`$sdlconfig --cflags 2> /dev/null`
-  if test "$static" = "yes" ; then
-    sdl_libs=`$sdlconfig --static-libs 2>/dev/null`
-  else
-    sdl_libs=`$sdlconfig --libs 2> /dev/null`
-  fi
+  sdl_libs=`$sdlconfig $sdlconfiglibs 2> /dev/null`
   if compile_prog "$sdl_cflags" "$sdl_libs" ; then
     if test "$_sdlversion" -lt 121 ; then
       sdl_too_old=yes
-- 
1.7.2.5


