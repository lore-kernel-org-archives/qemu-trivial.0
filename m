Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T89w4-0001QX-NN
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 09:09:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w1-0001LK-Pp
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w0-00024c-0V
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:53 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:56031
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89vz-00023P-FO
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:51 -0400
Received: from treguer.bzh.lan ([90.32.144.8]) by mwinf5d26 with ME
	id uD9o1j00M0B56Sa03D9pBD; Sun, 02 Sep 2012 15:09:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-devel@nongnu.org
Date: Sun,  2 Sep 2012 15:09:45 +0200
Message-Id: <1346591386-22698-2-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.125
Cc: qemu-trivial@nongnu.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 1/2] configure: fix detection for cURL libs
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
X-List-Received-Date: Sun, 02 Sep 2012 13:09:55 -0000

Currently, to check for cURL, configure uses either pkg-config (the default),
or curl-config (as a fallback).

But curl-config and pkg-config do not have the same set of options:
  - to check for shared libs, both use the option: --libs
  - to check for static libs:
    - pkg-config uses: --static --libs
    - curl-config uses: --static-libs

To add to the complexity, pkg-config is called through the querry_pkg_config
wrapper, that already passes --static when static linking is required, but
there is no such wrapper for curl-config, so we miss the occasion to pass
--static-libs

To fix this:
  - introduce a new variable QEMU_XXX_CONFIG_LIBS_FLAGS that mirrors the
    behavior of QEMU_PKG_CONFIG_FLAGS; this variable can be used by all
    xxx-config scripts (eg. curl-config, but later sdl-config too).
    Default it to '--libs', which is for shared linking;
  - properly use either --libs for pkg-config (--static is already taken
    care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for curl-config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
---
 configure |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index d97fd81..67c9238 100755
--- a/configure
+++ b/configure
@@ -126,7 +126,7 @@ audio_win_int=""
 cc_i386=i386-pc-linux-gnu-gcc
 libs_qga=""
 debug_info="yes"
-
+QEMU_XXX_CONFIG_LIBS_FLAGS="--libs"
 target_list=""
 
 # Default value for a variable defining feature "foo".
@@ -626,6 +626,7 @@ for opt do
     static="yes"
     LDFLAGS="-static $LDFLAGS"
     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
+    QEMU_XXX_CONFIG_LIBS_FLAGS="--static-libs"
   ;;
   --mandir=*) mandir="$optarg"
   ;;
@@ -2077,8 +2078,10 @@ fi
 
 if $pkg_config libcurl --modversion >/dev/null 2>&1; then
   curlconfig="$pkg_config libcurl"
+  curlconfiglibs="--libs"
 else
   curlconfig=curl-config
+  curlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
 fi
 
 if test "$curl" != "no" ; then
@@ -2087,7 +2090,7 @@ if test "$curl" != "no" ; then
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
   curl_cflags=`$curlconfig --cflags 2>/dev/null`
-  curl_libs=`$curlconfig --libs 2>/dev/null`
+  curl_libs=`$curlconfig $curlconfiglibs 2>/dev/null`
   if compile_prog "$curl_cflags" "$curl_libs" ; then
     curl=yes
     libs_tools="$curl_libs $libs_tools"
-- 
1.7.2.5


