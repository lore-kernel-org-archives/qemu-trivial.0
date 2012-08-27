Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T68JW-0001PN-0n
	for mharc-qemu-trivial@gnu.org; Mon, 27 Aug 2012 19:01:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JU-0001KZ-1e
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JS-0003FD-Dl
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:43 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:38121
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JS-0003Ep-4H
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:42 -0400
Received: from treguer.bzh.lan ([90.32.252.246]) by mwinf5d15 with ME
	id rz1f1j0075Kjsuq03z1gtF; Tue, 28 Aug 2012 01:01:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-trivial@nongnu.org
Date: Tue, 28 Aug 2012 01:01:33 +0200
Message-Id: <1346108494-31787-2-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.130
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
X-List-Received-Date: Mon, 27 Aug 2012 23:01:45 -0000

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
---
 configure |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index d97fd81..e6a7c14 100755
--- a/configure
+++ b/configure
@@ -126,7 +126,7 @@ audio_win_int=""
 cc_i386=i386-pc-linux-gnu-gcc
 libs_qga=""
 debug_info="yes"
-
+QEMU_XXX_XONFIG_LIBS_FLAGS="--libs"
 target_list=""
 
 # Default value for a variable defining feature "foo".
@@ -626,6 +626,7 @@ for opt do
     static="yes"
     LDFLAGS="-static $LDFLAGS"
     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
+    QEMU_XXX_XONFIG_LIBS_FLAGS="--static-libs"
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


