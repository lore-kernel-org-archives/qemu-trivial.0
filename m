Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkX-0000L1-1X
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:40:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkJ-0008Sl-5a
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkA-0000S7-5H
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:47 -0500
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:47067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk9-0000RR-4R
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:38 -0500
Received: from /spool/local
	by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 11:39:32 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 11:39:30 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id C2F333578052;
	Fri, 24 Jan 2014 12:39:29 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1KElU44630180; Fri, 24 Jan 2014 12:20:15 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dRgI029143; Fri, 24 Jan 2014 12:39:27 +1100
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dRC3029140; Fri, 24 Jan 2014 12:39:27 +1100
Received: by river.localdomain (Postfix, from userid 1000)
	id 83D632391FBA; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:10 +1100
Message-Id: <1390527551-22069-6-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-1618-0000-0000-0000054F9A2C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.143
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 5/6] configure: add hints to a remedy for
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:56 -0000

Modify feature_not_found to accept an optional second parameter to be
printed after the generic feature not found error.

Modify most calls to feature_not_found to provide hints as to the
packages that may be missing. The few calls remaining without a remedy
are ones I couldn't work out how to remedy myself.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 68 ++++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index e607ebf..4ad2de5 100755
--- a/configure
+++ b/configure
@@ -1472,9 +1472,11 @@ esac
 
 feature_not_found() {
   feature=$1
+  remedy=$2
 
   error_exit "User requested feature $feature" \
-      "configure was not able to find it"
+      "configure was not able to find it." \
+      "$remedy"
 }
 
 # ---
@@ -1522,7 +1524,7 @@ int main(void) {
 }
 EOF
   if ! compile_object ; then
-    feature_not_found "nptl"
+    feature_not_found "nptl" "Install glibc and linux kernel headers."
   fi
 fi
 
@@ -1553,7 +1555,7 @@ if test "$seccomp" != "no" ; then
 	seccomp="yes"
     else
 	if test "$seccomp" = "yes"; then
-            feature_not_found "libseccomp"
+            feature_not_found "libseccomp" "Install libseccomp devel >= 2.1.0"
 	fi
 	seccomp="no"
     fi
@@ -1578,7 +1580,7 @@ EOF
   if ! compile_prog "" "$xen_libs" ; then
     # Xen not found
     if test "$xen" = "yes" ; then
-      feature_not_found "xen"
+      feature_not_found "xen" "Install xen devel"
     fi
     xen=no
 
@@ -1701,7 +1703,7 @@ EOF
   # Xen version unsupported
   else
     if test "$xen" = "yes" ; then
-      feature_not_found "xen (unsupported version)"
+      feature_not_found "xen (unsupported version)" "Install supported xen (e.g. 4.0, 3.4, 3.3)"
     fi
     xen=no
   fi
@@ -1750,7 +1752,7 @@ if test "$sparse" != "no" ; then
     sparse=yes
   else
     if test "$sparse" = "yes" ; then
-      feature_not_found "sparse"
+      feature_not_found "sparse" "Install sparse binary"
     fi
     sparse=no
   fi
@@ -1772,7 +1774,7 @@ if test "$gtk" != "no"; then
     fi
     if ! $pkg_config --exists "$gtkpackage >= $gtkversion"; then
         if test "$gtk" = "yes" ; then
-            feature_not_found "gtk"
+            feature_not_found "gtk" "Install gtk2 or gtk3 (requires --with-gtkabi=3.0 option to configure) devel"
         fi
         gtk="no"
     elif ! $pkg_config --exists "$vtepackage >= $vteversion"; then
@@ -1807,7 +1809,7 @@ elif has ${sdl_config}; then
   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
 else
   if test "$sdl" = "yes" ; then
-    feature_not_found "sdl"
+    feature_not_found "sdl" "Install SDL devel"
   fi
   sdl=no
 fi
@@ -1851,7 +1853,7 @@ EOF
     fi # static link
   else # sdl not found
     if test "$sdl" = "yes" ; then
-      feature_not_found "sdl"
+      feature_not_found "sdl" "Install SDL devel"
     fi
     sdl=no
   fi # sdl compile test
@@ -1917,10 +1919,10 @@ EOF
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
@@ -1944,7 +1946,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_sasl_cflags"
   else
     if test "$vnc_sasl" = "yes" ; then
-      feature_not_found "vnc-sasl"
+      feature_not_found "vnc-sasl" "Install Cyrus SASL devel"
     fi
     vnc_sasl=no
   fi
@@ -1966,7 +1968,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_jpeg_cflags"
   else
     if test "$vnc_jpeg" = "yes" ; then
-      feature_not_found "vnc-jpeg"
+      feature_not_found "vnc-jpeg" "Install libjpeg-turbo devel"
     fi
     vnc_jpeg=no
   fi
@@ -1998,7 +2000,7 @@ EOF
     QEMU_CFLAGS="$QEMU_CFLAGS $vnc_png_cflags"
   else
     if test "$vnc_png" = "yes" ; then
-      feature_not_found "vnc-png"
+      feature_not_found "vnc-png" "Install libpng devel"
     fi
     vnc_png=no
   fi
@@ -2042,7 +2044,7 @@ EOF
     libs_tools="$uuid_libs $libs_tools"
   else
     if test "$uuid" = "yes" ; then
-      feature_not_found "uuid"
+      feature_not_found "uuid" "Install libuuid devel"
     fi
     uuid=no
   fi
@@ -2076,7 +2078,7 @@ EOF
     xfs="yes"
   else
     if test "$xfs" = "yes" ; then
-      feature_not_found "xfs"
+      feature_not_found "xfs" "Instal xfsprogs/xfslibs devel"
     fi
     xfs=no
   fi
@@ -2102,7 +2104,7 @@ EOF
     libs_tools="$vde_libs $libs_tools"
   else
     if test "$vde" = "yes" ; then
-      feature_not_found "vde"
+      feature_not_found "vde" "Install vde (Virtual Distributed Ethernet) devel"
     fi
     vde=no
   fi
@@ -2145,7 +2147,7 @@ EOF
     libs_tools="$cap_libs $libs_tools"
   else
     if test "$cap_ng" = "yes" ; then
-      feature_not_found "cap_ng"
+      feature_not_found "cap_ng" "Install libcap-ng devel"
     fi
     cap_ng=no
   fi
@@ -2250,7 +2252,7 @@ EOF
     libs_softmmu="$brlapi_libs $libs_softmmu"
   else
     if test "$brlapi" = "yes" ; then
-      feature_not_found "brlapi"
+      feature_not_found "brlapi" "Install brlapi devel"
     fi
     brlapi=no
   fi
@@ -2287,7 +2289,7 @@ EOF
     curses=yes
   else
     if test "$curses" = "yes" ; then
-      feature_not_found "curses"
+      feature_not_found "curses" "Install ncurses devel"
     fi
     curses=no
   fi
@@ -2313,7 +2315,7 @@ EOF
     libs_softmmu="$curl_libs $libs_softmmu"
   else
     if test "$curl" = "yes" ; then
-      feature_not_found "curl"
+      feature_not_found "curl" "Install libcurl devel"
     fi
     curl=no
   fi
@@ -2333,7 +2335,7 @@ EOF
     libs_softmmu="$bluez_libs $libs_softmmu"
   else
     if test "$bluez" = "yes" ; then
-      feature_not_found "bluez"
+      feature_not_found "bluez" "Install bluez-libs/libbluetooth devel"
     fi
     bluez="no"
   fi
@@ -2469,7 +2471,7 @@ EOF
     libs_softmmu="$rbd_libs $libs_softmmu"
   else
     if test "$rbd" = "yes" ; then
-      feature_not_found "rados block device"
+      feature_not_found "rados block device" "Install librbd/ceph devel"
     fi
     rbd=no
   fi
@@ -2535,7 +2537,7 @@ EOF
     libs_tools="$libs_tools -laio"
   else
     if test "$linux_aio" = "yes" ; then
-      feature_not_found "linux AIO"
+      feature_not_found "linux AIO" "Install libaio devel"
     fi
     linux_aio=no
   fi
@@ -2583,7 +2585,7 @@ EOF
     libattr=yes
   else
     if test "$attr" = "yes" ; then
-      feature_not_found "ATTR"
+      feature_not_found "ATTR" "Install libc6 or libattr devel"
     fi
     attr=no
   fi
@@ -2687,7 +2689,7 @@ EOF
     glx=yes
   else
     if test "$glx" = "yes" ; then
-      feature_not_found "glx"
+      feature_not_found "glx" "Install GL devel (e.g. MESA)"
     fi
     glx_libs=
     glx=no
@@ -2709,7 +2711,7 @@ if test "$glusterfs" != "no" ; then
     fi
   else
     if test "$glusterfs" = "yes" ; then
-      feature_not_found "GlusterFS backend support"
+      feature_not_found "GlusterFS backend support" "Install glusterfs-api devel"
     fi
     glusterfs="no"
   fi
@@ -3029,7 +3031,7 @@ if test "$docs" != "no" ; then
     docs=yes
   else
     if test "$docs" = "yes" ; then
-      feature_not_found "docs"
+      feature_not_found "docs" "Install texinfo and Perl/perl-podlators"
     fi
     docs=no
   fi
@@ -3078,7 +3080,7 @@ EOF
     LIBS="$LIBS -liscsi"
   else
     if test "$libiscsi" = "yes" ; then
-      feature_not_found "libiscsi"
+      feature_not_found "libiscsi" "Install libiscsi devel"
     fi
     libiscsi="no"
   fi
@@ -3162,7 +3164,7 @@ EOF
     spice_server_version=$($pkg_config --modversion spice-server)
   else
     if test "$spice" = "yes" ; then
-      feature_not_found "spice"
+      feature_not_found "spice" "Install spice-server and spice-protocol devel"
     fi
     spice="no"
   fi
@@ -3212,7 +3214,7 @@ if test "$libusb" != "no" ; then
         libs_softmmu="$libs_softmmu $libusb_libs"
     else
         if test "$libusb" = "yes"; then
-            feature_not_found "libusb"
+            feature_not_found "libusb" "Install libusb devel"
         fi
         libusb="no"
     fi
@@ -3228,7 +3230,7 @@ if test "$usb_redir" != "no" ; then
         libs_softmmu="$libs_softmmu $usb_redir_libs"
     else
         if test "$usb_redir" = "yes"; then
-            feature_not_found "usb-redir"
+            feature_not_found "usb-redir" "Install usbredir devel"
         fi
         usb_redir="no"
     fi
@@ -4292,7 +4294,7 @@ if test "$trace_backend" = "ftrace"; then
     echo "CONFIG_TRACE_FTRACE=y" >> $config_host_mak
     trace_default=no
   else
-    feature_not_found "ftrace(trace backend)"
+    feature_not_found "ftrace(trace backend)" "ftrace requires Linux"
   fi
 fi
 echo "CONFIG_TRACE_FILE=$trace_file" >> $config_host_mak
-- 
1.8.4.2


