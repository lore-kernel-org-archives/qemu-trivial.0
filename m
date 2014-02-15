Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeS7-0006aN-6Z
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:34:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeS0-0006RB-0D
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeRv-0002pr-FT
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:34:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeRm-0002oX-ES; Sat, 15 Feb 2014 07:34:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CAA041C2B;
	Sat, 15 Feb 2014 16:34:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id ECCD6634;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21825 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:13 +0400
Message-Id: <1392466700-21770-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/10] configure: add hint of libfdt to DTC
	dependency not found message
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
X-List-Received-Date: Sat, 15 Feb 2014 12:34:36 -0000

From: Stewart Smith <stewart@linux.vnet.ibm.com>

Most distros package it as libfdt, and mentioning libfdt here makes it
much easier to find the package you're missing.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 88133a1..f58fa84 100755
--- a/configure
+++ b/configure
@@ -2662,8 +2662,8 @@ EOF
     fdt_libs="-L\$(BUILD_DIR)/dtc/libfdt $fdt_libs"
   elif test "$fdt" = "yes" ; then
     # have neither and want - prompt for system/submodule install
-    error_exit "DTC not present. Your options:" \
-        "  (1) Preferred: Install the DTC devel package" \
+    error_exit "DTC (libfdt) not present. Your options:" \
+        "  (1) Preferred: Install the DTC (libfdt) devel package" \
         "  (2) Fetch the DTC submodule, using:" \
         "      git submodule update --init dtc"
   else
-- 
1.7.10.4


