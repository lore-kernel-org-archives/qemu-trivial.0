Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEOe4-00088Z-AS
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2013 15:09:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOdx-0007zP-40
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOds-0004RS-8C
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:09:33 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:34313
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEOdh-0004NH-SL; Tue, 27 Aug 2013 15:09:18 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 991FD180097; Tue, 27 Aug 2013 21:09:14 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Tue, 27 Aug 2013 21:09:12 +0200
Message-Id: <1377630553-22051-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 1/2] configure: Remove unneeded redirections
	of stderr (pkg-config --cflags, --libs)
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
X-List-Received-Date: Tue, 27 Aug 2013 19:09:38 -0000

For existing libraries, pkg-config --cflags and pkg-config --libs won't
print error messages to stderr, so redirecting stderr is not necessary.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index db69327..a47381c 100755
--- a/configure
+++ b/configure
@@ -1703,10 +1703,10 @@ if test "$gtk" != "no"; then
         fi
         gtk="no"
     else
-	gtk_cflags=`$pkg_config --cflags $gtkpackage 2>/dev/null`
-	gtk_libs=`$pkg_config --libs $gtkpackage 2>/dev/null`
-	vte_cflags=`$pkg_config --cflags $vtepackage 2>/dev/null`
-	vte_libs=`$pkg_config --libs $vtepackage 2>/dev/null`
+	gtk_cflags=`$pkg_config --cflags $gtkpackage`
+	gtk_libs=`$pkg_config --libs $gtkpackage`
+	vte_cflags=`$pkg_config --cflags $vtepackage`
+	vte_libs=`$pkg_config --libs $vtepackage`
 	libs_softmmu="$gtk_libs $vte_libs $libs_softmmu"
 	gtk="yes"
     fi
@@ -1908,8 +1908,8 @@ int main(void) {
 }
 EOF
   if $pkg_config libpng --modversion >/dev/null 2>&1; then
-    vnc_png_cflags=`$pkg_config libpng --cflags 2> /dev/null`
-    vnc_png_libs=`$pkg_config libpng --libs 2> /dev/null`
+    vnc_png_cflags=`$pkg_config libpng --cflags`
+    vnc_png_libs=`$pkg_config libpng --libs`
   else
     vnc_png_cflags=""
     vnc_png_libs="-lpng"
@@ -2240,8 +2240,8 @@ else
 fi
 if $pkg_config --atleast-version=$glib_req_ver gthread-2.0 > /dev/null 2>&1
 then
-    glib_cflags=`$pkg_config --cflags gthread-2.0 2>/dev/null`
-    glib_libs=`$pkg_config --libs gthread-2.0 2>/dev/null`
+    glib_cflags=`$pkg_config --cflags gthread-2.0`
+    glib_libs=`$pkg_config --libs gthread-2.0`
     LIBS="$glib_libs $LIBS"
     libs_qga="$glib_libs $libs_qga"
 else
@@ -2270,8 +2270,8 @@ if test "$pixman" = "none"; then
   pixman_cflags=
   pixman_libs=
 elif test "$pixman" = "system"; then
-  pixman_cflags=`$pkg_config --cflags pixman-1 2>/dev/null`
-  pixman_libs=`$pkg_config --libs pixman-1 2>/dev/null`
+  pixman_cflags=`$pkg_config --cflags pixman-1`
+  pixman_libs=`$pkg_config --libs pixman-1`
 else
   if test ! -d ${source_path}/pixman/pixman; then
     error_exit "pixman not present. Your options:" \
@@ -2591,8 +2591,8 @@ fi
 if test "$glusterfs" != "no" ; then
   if $pkg_config --atleast-version=3 glusterfs-api >/dev/null 2>&1; then
     glusterfs="yes"
-    glusterfs_cflags=`$pkg_config --cflags glusterfs-api 2>/dev/null`
-    glusterfs_libs=`$pkg_config --libs glusterfs-api 2>/dev/null`
+    glusterfs_cflags=`$pkg_config --cflags glusterfs-api`
+    glusterfs_libs=`$pkg_config --libs glusterfs-api`
     CFLAGS="$CFLAGS $glusterfs_cflags"
     libs_tools="$glusterfs_libs $libs_tools"
     libs_softmmu="$glusterfs_libs $libs_softmmu"
@@ -2961,8 +2961,8 @@ int main(void) { iscsi_unmap_sync(NULL,0,0,0,NULL,0); return 0; }
 EOF
   if $pkg_config --atleast-version=1.7.0 libiscsi --modversion >/dev/null 2>&1; then
     libiscsi="yes"
-    libiscsi_cflags=$($pkg_config --cflags libiscsi 2>/dev/null)
-    libiscsi_libs=$($pkg_config --libs libiscsi 2>/dev/null)
+    libiscsi_cflags=$($pkg_config --cflags libiscsi)
+    libiscsi_libs=$($pkg_config --libs libiscsi)
     CFLAGS="$CFLAGS $libiscsi_cflags"
     LIBS="$LIBS $libiscsi_libs"
   elif compile_prog "" "-liscsi" ; then
@@ -3084,8 +3084,8 @@ if test "$libusb" != "no" ; then
     if $pkg_config --atleast-version=1.0.13 libusb-1.0 >/dev/null 2>&1 ; then
         libusb="yes"
 	usb="libusb"
-        libusb_cflags=$($pkg_config --cflags libusb-1.0 2>/dev/null)
-        libusb_libs=$($pkg_config --libs libusb-1.0 2>/dev/null)
+        libusb_cflags=$($pkg_config --cflags libusb-1.0)
+        libusb_libs=$($pkg_config --libs libusb-1.0)
         QEMU_CFLAGS="$QEMU_CFLAGS $libusb_cflags"
         libs_softmmu="$libs_softmmu $libusb_libs"
     else
@@ -3100,8 +3100,8 @@ fi
 if test "$usb_redir" != "no" ; then
     if $pkg_config --atleast-version=0.6 libusbredirparser-0.5 >/dev/null 2>&1 ; then
         usb_redir="yes"
-        usb_redir_cflags=$($pkg_config --cflags libusbredirparser-0.5 2>/dev/null)
-        usb_redir_libs=$($pkg_config --libs libusbredirparser-0.5 2>/dev/null)
+        usb_redir_cflags=$($pkg_config --cflags libusbredirparser-0.5)
+        usb_redir_libs=$($pkg_config --libs libusbredirparser-0.5)
         QEMU_CFLAGS="$QEMU_CFLAGS $usb_redir_cflags"
         libs_softmmu="$libs_softmmu $usb_redir_libs"
     else
-- 
1.7.10.4


