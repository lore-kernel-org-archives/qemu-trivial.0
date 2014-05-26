Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopD2-0005Nw-Rg
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:20:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCx-0005F2-38
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCs-0007OT-MF
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopCh-0007Ky-Ob; Mon, 26 May 2014 03:20:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D0A0442FA4;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8EE83644;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: (nullmailer pid 22996 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:53 +0400
Message-Id: <1401088811-22923-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/23] configure: Automatically select GTK+
	3.0 if GTK+ 2.0 is unavailable
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
X-List-Received-Date: Mon, 26 May 2014 07:20:35 -0000

From: Stefan Weil <sw@weilnetz.de>

The configure option --with-gtkabi=3.0 is still supported, but no longer
needed when GTK+-2.0 is missing. When no GTK+ ABI is selected by the
user, configure first tries 2.0, then 3.0.

For some platforms (e.g. Windows) newer binaries of GTK+ are only
available for GTK+ 3.0. Now building on these platforms is a little bit
easier.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 605a0ec..678a106 100755
--- a/configure
+++ b/configure
@@ -317,7 +317,7 @@ glusterfs_discard="no"
 glusterfs_zerofill="no"
 virtio_blk_data_plane=""
 gtk=""
-gtkabi="2.0"
+gtkabi=""
 vte=""
 tpm="no"
 libssh2=""
@@ -1970,6 +1970,18 @@ fi
 ##########################################
 # GTK probe
 
+if test "$gtkabi" = ""; then
+    # The GTK ABI was not specified explicitly, so try whether 2.0 is available.
+    # Use 3.0 as a fallback if that is available.
+    if $pkg_config --exists "gtk+-2.0 >= 2.18.0"; then
+        gtkabi=2.0
+    elif $pkg_config --exists "gtk+-3.0 >= 3.0.0"; then
+        gtkabi=3.0
+    else
+        gtkabi=2.0
+    fi
+fi
+
 if test "$gtk" != "no"; then
     gtkpackage="gtk+-$gtkabi"
     if test "$gtkabi" = "3.0" ; then
@@ -1983,7 +1995,7 @@ if test "$gtk" != "no"; then
         libs_softmmu="$gtk_libs $libs_softmmu"
         gtk="yes"
     elif test "$gtk" = "yes"; then
-        feature_not_found "gtk" "Install gtk2 or gtk3 (requires --with-gtkabi=3.0 option to configure) devel"
+        feature_not_found "gtk" "Install gtk2 or gtk3 devel"
     else
         gtk="no"
     fi
@@ -2006,7 +2018,11 @@ if test "$vte" != "no"; then
         libs_softmmu="$vte_libs $libs_softmmu"
         vte="yes"
     elif test "$vte" = "yes"; then
-        feature_not_found "vte" "Install libvte or libvte-2.90 (requires --with-gtkabi=3.0 option to configure) devel"
+        if test "$gtkabi" = "3.0"; then
+            feature_not_found "vte" "Install libvte-2.90 devel"
+        else
+            feature_not_found "vte" "Install libvte devel"
+        fi
     else
         vte="no"
     fi
-- 
1.7.10.4


