Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Wf-0000p6-66
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:24:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Wc-0000kn-6G
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Wa-0005iA-D0
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30WT-0005gg-4F; Wed, 18 May 2016 08:24:21 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2CA93417A3;
	Wed, 18 May 2016 15:24:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 613CBADF;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12382 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Wed, 18 May 2016 15:05:56 +0300
Message-Id: <f35c1f66adb4c472830329a2fb23e0a8fd8ca5f4.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/13] s390: remove misleading comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 12:24:31 -0000

The comment talks about a non-ELF object while the
example gives ELF object.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/s390x/ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 5786b5e..e6bf7cf 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -129,7 +129,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
             /* Adjust ELF start address to final location */
             ipl->bios_start_addr += fwbase;
         } else {
-            /* Try to load non-ELF file (e.g. s390-ccw.img) */
+            /* Try to load non-ELF file */
             bios_size = load_image_targphys(bios_filename, ZIPL_IMAGE_START,
                                             4096);
             ipl->bios_start_addr = ZIPL_IMAGE_START;
-- 
2.1.4


