Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVZ9y-0005As-LU
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 01:30:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aVZ9v-00056X-N9
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 01:30:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aVZ9u-0006Iw-U1
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 01:30:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aVZ9o-0006Hw-Rs; Tue, 16 Feb 2016 01:30:45 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8699F41AC7;
	Tue, 16 Feb 2016 09:30:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0BF5FAC4;
	Tue, 16 Feb 2016 09:30:36 +0300 (MSK)
Received: (nullmailer pid 3355 invoked by uid 1000);
	Tue, 16 Feb 2016 06:30:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 09:30:35 +0300
Message-Id: <1455604235-3313-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] s390: remove misleading comment
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
X-List-Received-Date: Tue, 16 Feb 2016 06:30:52 -0000

The comment talks about a non-ELF object while the
example gives ELF object.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/s390x/ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index c9cf7cc..2213405 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
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


