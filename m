Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEOeD-0008MV-Dn
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2013 15:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOe6-0008BA-IE
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOe1-0004Sc-Jf
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:09:42 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:34314
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOdh-0004Nf-SJ; Tue, 27 Aug 2013 15:09:18 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4FCE2180117; Tue, 27 Aug 2013 21:09:15 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Tue, 27 Aug 2013 21:09:13 +0200
Message-Id: <1377630553-22051-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377630553-22051-1-git-send-email-sw@weilnetz.de>
References: <1377630553-22051-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 2/2] configure: Remove unneeded redirections
	of stderr (pkg-config --exists)
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
X-List-Received-Date: Tue, 27 Aug 2013 19:09:48 -0000

Predicate options (--exists, --atleast-version, ...) of pkg-config dont't
print error messages to stderr, so redirecting stderr is not necessary.

Combining a predicate option with --modversion is not necessary for tests.
Instead of testing with --modversion, --exists can be used.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index a47381c..0315cf0 100755
--- a/configure
+++ b/configure
@@ -1469,7 +1469,7 @@ libs_softmmu="$libs_softmmu -lz"
 # libseccomp check
 
 if test "$seccomp" != "no" ; then
-    if $pkg_config --atleast-version=2.1.0 libseccomp --modversion >/dev/null 2>&1; then
+    if $pkg_config --atleast-version=2.1.0 libseccomp; then
         libs_softmmu="$libs_softmmu `$pkg_config --libs libseccomp`"
         QEMU_CFLAGS="$QEMU_CFLAGS `$pkg_config --cflags libseccomp`"
 	seccomp="yes"
@@ -1721,7 +1721,7 @@ if test "`basename $sdl_config`" != sdl-config && ! has ${sdl_config}; then
   sdl_config=sdl-config
 fi
 
-if $pkg_config sdl --modversion >/dev/null 2>&1; then
+if $pkg_config sdl --exists; then
   sdlconfig="$pkg_config sdl"
   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
 elif has ${sdl_config}; then
@@ -1907,7 +1907,7 @@ int main(void) {
     return png_ptr != 0;
 }
 EOF
-  if $pkg_config libpng --modversion >/dev/null 2>&1; then
+  if $pkg_config libpng --exists; then
     vnc_png_cflags=`$pkg_config libpng --cflags`
     vnc_png_libs=`$pkg_config libpng --libs`
   else
@@ -2186,7 +2186,7 @@ fi
 ##########################################
 # curl probe
 if test "$curl" != "no" ; then
-  if $pkg_config libcurl --modversion >/dev/null 2>&1; then
+  if $pkg_config libcurl --exists; then
     curlconfig="$pkg_config libcurl"
   else
     curlconfig=curl-config
@@ -2238,8 +2238,7 @@ if test "$mingw32" = yes; then
 else
     glib_req_ver=2.12
 fi
-if $pkg_config --atleast-version=$glib_req_ver gthread-2.0 > /dev/null 2>&1
-then
+if $pkg_config --atleast-version=$glib_req_ver gthread-2.0; then
     glib_cflags=`$pkg_config --cflags gthread-2.0`
     glib_libs=`$pkg_config --libs gthread-2.0`
     LIBS="$glib_libs $LIBS"
@@ -2370,8 +2369,7 @@ fi
 # libssh2 probe
 min_libssh2_version=1.2.8
 if test "$libssh2" != "no" ; then
-  if $pkg_config --atleast-version=$min_libssh2_version libssh2 >/dev/null 2>&1
-  then
+  if $pkg_config --atleast-version=$min_libssh2_version libssh2; then
     libssh2_cflags=`$pkg_config libssh2 --cflags`
     libssh2_libs=`$pkg_config libssh2 --libs`
     libssh2=yes
@@ -2589,14 +2587,14 @@ fi
 ##########################################
 # glusterfs probe
 if test "$glusterfs" != "no" ; then
-  if $pkg_config --atleast-version=3 glusterfs-api >/dev/null 2>&1; then
+  if $pkg_config --atleast-version=3 glusterfs-api; then
     glusterfs="yes"
     glusterfs_cflags=`$pkg_config --cflags glusterfs-api`
     glusterfs_libs=`$pkg_config --libs glusterfs-api`
     CFLAGS="$CFLAGS $glusterfs_cflags"
     libs_tools="$glusterfs_libs $libs_tools"
     libs_softmmu="$glusterfs_libs $libs_softmmu"
-    if $pkg_config --atleast-version=5 glusterfs-api >/dev/null 2>&1; then
+    if $pkg_config --atleast-version=5 glusterfs-api; then
       glusterfs_discard="yes"
     fi
   else
@@ -2959,7 +2957,7 @@ if test "$libiscsi" != "no" ; then
 #include <iscsi/iscsi.h>
 int main(void) { iscsi_unmap_sync(NULL,0,0,0,NULL,0); return 0; }
 EOF
-  if $pkg_config --atleast-version=1.7.0 libiscsi --modversion >/dev/null 2>&1; then
+  if $pkg_config --atleast-version=1.7.0 libiscsi; then
     libiscsi="yes"
     libiscsi_cflags=$($pkg_config --cflags libiscsi)
     libiscsi_libs=$($pkg_config --libs libiscsi)
@@ -3029,8 +3027,8 @@ int main(void) { spice_server_new(); return 0; }
 EOF
   spice_cflags=$($pkg_config --cflags spice-protocol spice-server 2>/dev/null)
   spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
-  if $pkg_config --atleast-version=0.12.0 spice-server >/dev/null 2>&1 && \
-     $pkg_config --atleast-version=0.12.3 spice-protocol > /dev/null 2>&1 && \
+  if $pkg_config --atleast-version=0.12.0 spice-server && \
+     $pkg_config --atleast-version=0.12.3 spice-protocol && \
      compile_prog "$spice_cflags" "$spice_libs" ; then
     spice="yes"
     libs_softmmu="$libs_softmmu $spice_libs"
@@ -3065,7 +3063,7 @@ EOF
         test_cflags="-Werror $test_cflags"
     fi
     if test -n "$libtool" &&
-            $pkg_config --atleast-version=3.12.8 nss >/dev/null 2>&1 && \
+       $pkg_config --atleast-version=3.12.8 nss && \
       compile_prog "$test_cflags" "$libcacard_libs"; then
         smartcard_nss="yes"
         QEMU_CFLAGS="$QEMU_CFLAGS $libcacard_cflags"
@@ -3081,7 +3079,7 @@ fi
 
 # check for libusb
 if test "$libusb" != "no" ; then
-    if $pkg_config --atleast-version=1.0.13 libusb-1.0 >/dev/null 2>&1 ; then
+    if $pkg_config --atleast-version=1.0.13 libusb-1.0; then
         libusb="yes"
 	usb="libusb"
         libusb_cflags=$($pkg_config --cflags libusb-1.0)
@@ -3098,7 +3096,7 @@ fi
 
 # check for usbredirparser for usb network redirection support
 if test "$usb_redir" != "no" ; then
-    if $pkg_config --atleast-version=0.6 libusbredirparser-0.5 >/dev/null 2>&1 ; then
+    if $pkg_config --atleast-version=0.6 libusbredirparser-0.5; then
         usb_redir="yes"
         usb_redir_cflags=$($pkg_config --cflags libusbredirparser-0.5)
         usb_redir_libs=$($pkg_config --libs libusbredirparser-0.5)
-- 
1.7.10.4


