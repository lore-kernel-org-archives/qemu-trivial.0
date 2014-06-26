Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X06Tt-0001aJ-GV
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 06:00:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1X06Tl-0001Wl-Te
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 06:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1X06Tg-0004pe-CC
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 06:00:29 -0400
Received: from [59.151.112.132] (port=24626 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1X06TU-0004hY-Nm; Thu, 26 Jun 2014 06:00:13 -0400
X-IronPort-AV: E=Sophos;i="5.00,783,1396972800"; d="scan'208";a="32468876"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2014 17:57:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s5Q9akNW018307;
	Thu, 26 Jun 2014 17:37:06 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com (10.167.226.102) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 26 Jun 2014 17:36:52 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Thu, 26 Jun 2014 17:34:50 +0800
Message-ID: <1403775290-22307-1-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.102]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] configure: explicitly state version
	requirements to devel packages
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
X-List-Received-Date: Thu, 26 Jun 2014 10:00:35 -0000

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 configure | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 7102964..adff12e 100755
--- a/configure
+++ b/configure
@@ -3066,7 +3066,8 @@ if test "$glusterfs" != "no" ; then
     fi
   else
     if test "$glusterfs" = "yes" ; then
-      feature_not_found "GlusterFS backend support" "Install glusterfs-api devel"
+      feature_not_found "GlusterFS backend support" \
+          "Install glusterfs-api devel >= 3"
     fi
     glusterfs="no"
   fi
@@ -3511,7 +3512,8 @@ EOF
     spice_server_version=$($pkg_config --modversion spice-server)
   else
     if test "$spice" = "yes" ; then
-      feature_not_found "spice" "Install spice-server and spice-protocol devel"
+      feature_not_found "spice" \
+          "Install spice-server(>=0.12.0) and spice-protocol(>=0.12.3) devel"
     fi
     spice="no"
   fi
@@ -3542,7 +3544,7 @@ EOF
         smartcard_nss="yes"
     else
         if test "$smartcard_nss" = "yes"; then
-            feature_not_found "nss"
+            feature_not_found "nss" "Install nss devel >= 3.12.8"
         fi
         smartcard_nss="no"
     fi
@@ -3558,7 +3560,7 @@ if test "$libusb" != "no" ; then
         libs_softmmu="$libs_softmmu $libusb_libs"
     else
         if test "$libusb" = "yes"; then
-            feature_not_found "libusb" "Install libusb devel"
+            feature_not_found "libusb" "Install libusb devel >= 1.0.13"
         fi
         libusb="no"
     fi
@@ -3983,7 +3985,7 @@ if test "$libnfs" != "no" ; then
     LIBS="$LIBS $libnfs_libs"
   else
     if test "$libnfs" = "yes" ; then
-      feature_not_found "libnfs"
+      feature_not_found "libnfs" "Install libnfs devel >= 1.9.3"
     fi
     libnfs="no"
   fi
-- 
1.9.3


