Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIW-0007G3-Ph
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIP-00072S-WD
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIK-0000EC-S7
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI4-0000A7-Ue; Sat, 15 Feb 2014 07:24:17 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CE9341C2D;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A02121B;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21827 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:14 +0400
Message-Id: <1392466700-21770-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/10] configure: add hints to a remedy for
	feature_not_found errors
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:43 -0000

From: Stewart Smith <stewart@linux.vnet.ibm.com>

Modify feature_not_found to accept an optional second parameter to be
printed after the generic feature not found error.

Modify most calls to feature_not_found to provide hints as to the
packages that may be missing. The few calls remaining without a remedy
are ones I couldn't work out how to remedy myself.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   68 +++++++++++++++++++++++++++++++------------------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index f58fa84..0eadab5 100755
--- a/configure
+++ b/configure
@@ -1474,9 +1474,11 @@ esac
 
 feature_not_found() {
   feature=$1
+  remedy=$2
 
   error_exit "User requested feature $feature" \
-      "configure was not able to find it"
+      "configure was not able to find it." \
+      "$remedy"
 }
 
 # ---
@@ -1524,7 +1526,7 @@ int main(void) {
 }
 EOF
   if ! compile_object ; then
-    feature_not_found "nptl"
+    feature_not_found "nptl" "Install glibc and linux kernel headers."
   fi
 fi
 
@@ -1555,7 +1557,7 @@ if test "$seccomp" != "no" ; then
 	seccomp="yes"
     else
 	if test "$seccomp" = "yes"; then
-            feature_not_found "libseccomp"
+            feature_not_found "libseccomp" "Install libseccomp devel >= 2.1.0"
 	fi
 	seccomp="no"
     fi
@@ -1580,7 +1582,7 @@ EOF
   if ! compile_prog "" "$xen_libs" ; then
     # Xen not found
     if test "$xen" = "yes" ; then
-      feature_not_found "xen"
+      feature_not_found "xen" "Install xen devel"
     fi
     xen=no
 
@@ -1703,7 +1705,7 @@ EOF
   # Xen version unsupported
   else
     if test "$xen" = "yes" ; then
-      feature_not_found "xen (unsupported version)"
+      feature_not_found "xen (unsupported version)" "Install supported xen (e.g. 4.0, 3.4, 3.3)"
     fi
     xen=no
   fi
@@ -1752,7 +1754,7 @@ if test "$sparse" != "no" ; then
     sparse=yes
   else
     if test "$sparse" = "yes" ; then
-      feature_not_found "sparse"
+      feature_not_found "sparse" "Install sparse binary"
     fi
     sparse=no
   fi
@@ -1774,7 +1776,7 @@ if test "$gtk" != "no"; then
     fi
     if ! $pkg_config --exists "$gtkpackage >= $gtkversion"; then
         if test "$gtk" = "yes" ; then
-            feature_not_found "gtk"
+            feature_not_found "gtk" "Install gtk2 or gtk3 (requires --with-gtkabi=3.0 option to configure) devel"
         fi
         gtk="no"
     elif ! $pkg_config --exists "$vtepackage >= $vteversion"; then
@@ -1809,7 +1811,7 @@ elif has ${sdl_config}; then
   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
 else
   if test "$sdl" = "yes" ; then
-    feature_not_found "sdl"
+    feature_not_found "sdl" "Install SDL devel"
   fi
   sdl=no
 fi
@@ -1853,7 +1855,7 @@ EOF
     fi # static link
   else # sdl not found
     if test "$sdl" = "yes" ; then
-      feature_not_found "sdl"
+      feature_not_found "sdl" "Install SDL devel"
     fi
     sdl=no
   fi # sdl compile test
@@ -1919,10 +1921,10 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_tls_cflags"
   else
     if test "$vnc_tls" = "yes" ; then
-      feature_not_found "vnc-tls"
+      feature_not_found "vnc-tls" "Install gnutls devel"
     fi
     if test "$vnc_ws" = "yes" ; then
-      feature_not_found "vnc-ws"
+      feature_not_found "vnc-ws" "Install gnutls devel"
     fi
     vnc_tls=no
     vnc_ws=no
@@ -1946,7 +1948,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_sasl_cflags"
   else
     if test "$vnc_sasl" = "yes" ; then
-      feature_not_found "vnc-sasl"
+      feature_not_found "vnc-sasl" "Install Cyrus SASL devel"
     fi
     vnc_sasl=no
   fi
@@ -1968,7 +1970,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_jpeg_cflags"
   else
     if test "$vnc_jpeg" = "yes" ; then
-      feature_not_found "vnc-jpeg"
+      feature_not_found "vnc-jpeg" "Install libjpeg-turbo devel"
     fi
     vnc_jpeg=no
   fi
@@ -2000,7 +2002,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_png_cflags"
   else
     if test "$vnc_png" = "yes" ; then
-      feature_not_found "vnc-png"
+      feature_not_found "vnc-png" "Install libpng devel"
     fi
     vnc_png=no
   fi
@@ -2044,7 +2046,7 @@ EOF
     libs_tools="$uuid_libs $libs_tools"
   else
     if test "$uuid" = "yes" ; then
-      feature_not_found "uuid"
+      feature_not_found "uuid" "Install libuuid devel"
     fi
     uuid=no
   fi
@@ -2078,7 +2080,7 @@ EOF
     xfs="yes"
   else
     if test "$xfs" = "yes" ; then
-      feature_not_found "xfs"
+      feature_not_found "xfs" "Instal xfsprogs/xfslibs devel"
     fi
     xfs=no
   fi
@@ -2104,7 +2106,7 @@ EOF
     libs_tools="$vde_libs $libs_tools"
   else
     if test "$vde" = "yes" ; then
-      feature_not_found "vde"
+      feature_not_found "vde" "Install vde (Virtual Distributed Ethernet) devel"
     fi
     vde=no
   fi
@@ -2147,7 +2149,7 @@ EOF
     libs_tools="$cap_libs $libs_tools"
   else
     if test "$cap_ng" = "yes" ; then
-      feature_not_found "cap_ng"
+      feature_not_found "cap_ng" "Install libcap-ng devel"
     fi
     cap_ng=no
   fi
@@ -2252,7 +2254,7 @@ EOF
     libs_softmmu="$brlapi_libs $libs_softmmu"
   else
     if test "$brlapi" = "yes" ; then
-      feature_not_found "brlapi"
+      feature_not_found "brlapi" "Install brlapi devel"
     fi
     brlapi=no
   fi
@@ -2289,7 +2291,7 @@ EOF
     curses=yes
   else
     if test "$curses" = "yes" ; then
-      feature_not_found "curses"
+      feature_not_found "curses" "Install ncurses devel"
     fi
     curses=no
   fi
@@ -2315,7 +2317,7 @@ EOF
     libs_softmmu="$curl_libs $libs_softmmu"
   else
     if test "$curl" = "yes" ; then
-      feature_not_found "curl"
+      feature_not_found "curl" "Install libcurl devel"
     fi
     curl=no
   fi
@@ -2335,7 +2337,7 @@ EOF
     libs_softmmu="$bluez_libs $libs_softmmu"
   else
     if test "$bluez" = "yes" ; then
-      feature_not_found "bluez"
+      feature_not_found "bluez" "Install bluez-libs/libbluetooth devel"
     fi
     bluez="no"
   fi
@@ -2471,7 +2473,7 @@ EOF
     libs_softmmu="$rbd_libs $libs_softmmu"
   else
     if test "$rbd" = "yes" ; then
-      feature_not_found "rados block device"
+      feature_not_found "rados block device" "Install librbd/ceph devel"
     fi
     rbd=no
   fi
@@ -2537,7 +2539,7 @@ EOF
     libs_tools="$libs_tools -laio"
   else
     if test "$linux_aio" = "yes" ; then
-      feature_not_found "linux AIO"
+      feature_not_found "linux AIO" "Install libaio devel"
     fi
     linux_aio=no
   fi
@@ -2585,7 +2587,7 @@ EOF
     libattr=yes
   else
     if test "$attr" = "yes" ; then
-      feature_not_found "ATTR"
+      feature_not_found "ATTR" "Install libc6 or libattr devel"
     fi
     attr=no
   fi
@@ -2689,7 +2691,7 @@ EOF
     glx=yes
   else
     if test "$glx" = "yes" ; then
-      feature_not_found "glx"
+      feature_not_found "glx" "Install GL devel (e.g. MESA)"
     fi
     glx_libs=
     glx=no
@@ -2714,7 +2716,7 @@ if test "$glusterfs" != "no" ; then
     fi
   else
     if test "$glusterfs" = "yes" ; then
-      feature_not_found "GlusterFS backend support"
+      feature_not_found "GlusterFS backend support" "Install glusterfs-api devel"
     fi
     glusterfs="no"
   fi
@@ -3034,7 +3036,7 @@ if test "$docs" != "no" ; then
     docs=yes
   else
     if test "$docs" = "yes" ; then
-      feature_not_found "docs"
+      feature_not_found "docs" "Install texinfo and Perl/perl-podlators"
     fi
     docs=no
   fi
@@ -3083,7 +3085,7 @@ EOF
     LIBS="$LIBS -liscsi"
   else
     if test "$libiscsi" = "yes" ; then
-      feature_not_found "libiscsi"
+      feature_not_found "libiscsi" "Install libiscsi devel"
     fi
     libiscsi="no"
   fi
@@ -3167,7 +3169,7 @@ EOF
     spice_server_version=$($pkg_config --modversion spice-server)
   else
     if test "$spice" = "yes" ; then
-      feature_not_found "spice"
+      feature_not_found "spice" "Install spice-server and spice-protocol devel"
     fi
     spice="no"
   fi
@@ -3217,7 +3219,7 @@ if test "$libusb" != "no" ; then
         libs_softmmu="$libs_softmmu $libusb_libs"
     else
         if test "$libusb" = "yes"; then
-            feature_not_found "libusb"
+            feature_not_found "libusb" "Install libusb devel"
         fi
         libusb="no"
     fi
@@ -3233,7 +3235,7 @@ if test "$usb_redir" != "no" ; then
         libs_softmmu="$libs_softmmu $usb_redir_libs"
     else
         if test "$usb_redir" = "yes"; then
-            feature_not_found "usb-redir"
+            feature_not_found "usb-redir" "Install usbredir devel"
         fi
         usb_redir="no"
     fi
@@ -4320,7 +4322,7 @@ if test "$trace_backend" = "ftrace"; then
     echo "CONFIG_TRACE_FTRACE=y" >> $config_host_mak
     trace_default=no
   else
-    feature_not_found "ftrace(trace backend)"
+    feature_not_found "ftrace(trace backend)" "ftrace requires Linux"
   fi
 fi
 echo "CONFIG_TRACE_FILE=$trace_file" >> $config_host_mak
-- 
1.7.10.4


