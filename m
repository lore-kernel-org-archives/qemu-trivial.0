Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCuZ-0000Ww-EG
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuT-0000HF-1I
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuR-0000xK-SL
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCuO-0000vG-H4; Wed, 04 Mar 2015 12:16:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EB00C408A1;
	Wed,  4 Mar 2015 20:16:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D005693B;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: (nullmailer pid 17493 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:22 +0300
Message-Id: <9e46c8b5da7959b601469c3fca3d4d930ed6ba02.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Gabriel L. Somlo" <gsomlo@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gabriel Somlo <somlo@cmu.edu>
Subject: [Qemu-trivial] [PULL 05/47] smbios: document cmdline options for
	smbios type 2-4, 17 structures
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
X-List-Received-Date: Wed, 04 Mar 2015 17:16:41 -0000

From: "Gabriel L. Somlo" <gsomlo@gmail.com>

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 85ca3ad..ee4b223 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1364,11 +1364,25 @@ ETEXI
 DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "-smbios file=binary\n"
     "                load SMBIOS entry from binary file\n"
-    "-smbios type=0[,vendor=str][,version=str][,date=str][,release=%d.%d][,uefi=on|off]\n"
+    "-smbios type=0[,vendor=str][,version=str][,date=str][,release=%d.%d]\n"
+    "              [,uefi=on|off]\n"
     "                specify SMBIOS type 0 fields\n"
     "-smbios type=1[,manufacturer=str][,product=str][,version=str][,serial=str]\n"
     "              [,uuid=uuid][,sku=str][,family=str]\n"
-    "                specify SMBIOS type 1 fields\n", QEMU_ARCH_I386)
+    "                specify SMBIOS type 1 fields\n"
+    "-smbios type=2[,manufacturer=str][,product=str][,version=str][,serial=str]\n"
+    "              [,asset=str][,location=str]\n"
+    "                specify SMBIOS type 2 fields\n"
+    "-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str]\n"
+    "              [,sku=str]\n"
+    "                specify SMBIOS type 3 fields\n"
+    "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
+    "              [,asset=str][,part=str]\n"
+    "                specify SMBIOS type 4 fields\n"
+    "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
+    "               [,asset=str][,part=str]\n"
+    "                specify SMBIOS type 17 fields\n",
+    QEMU_ARCH_I386)
 STEXI
 @item -smbios file=@var{binary}
 @findex -smbios
@@ -1377,8 +1391,20 @@ Load SMBIOS entry from binary file.
 @item -smbios type=0[,vendor=@var{str}][,version=@var{str}][,date=@var{str}][,release=@var{%d.%d}][,uefi=on|off]
 Specify SMBIOS type 0 fields
 
-@item -smbios type=1[,manufacturer=@var{str}][,product=@var{str}] [,version=@var{str}][,serial=@var{str}][,uuid=@var{uuid}][,sku=@var{str}] [,family=@var{str}]
+@item -smbios type=1[,manufacturer=@var{str}][,product=@var{str}][,version=@var{str}][,serial=@var{str}][,uuid=@var{uuid}][,sku=@var{str}][,family=@var{str}]
 Specify SMBIOS type 1 fields
+
+@item -smbios type=2[,manufacturer=@var{str}][,product=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,location=@var{str}][,family=@var{str}]
+Specify SMBIOS type 2 fields
+
+@item -smbios type=3[,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,sku=@var{str}]
+Specify SMBIOS type 3 fields
+
+@item -smbios type=4[,sock_pfx=@var{str}][,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+Specify SMBIOS type 4 fields
+
+@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+Specify SMBIOS type 17 fields
 ETEXI
 
 STEXI
-- 
2.1.4


