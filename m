Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9T0L-0001ux-3H
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0I-0001rg-K0
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0C-00084b-Rw
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9T02-00081c-JU; Sun, 05 Jun 2016 04:01:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4ED0040912;
	Sun,  5 Jun 2016 11:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 56212B02;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1192 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cornelia.huck@de.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:27 +0300
Message-Id: <ac8eb9b954f267b8d9145cb8833a2f0b346f5913.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 50/52] pc-bios/s390-ccw: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 08:01:51 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Cornelia Huck <cornelia.huck@de.ibm.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 pc-bios/s390-ccw/bootmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 611102e..ecdc52d 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -599,7 +599,7 @@ static void load_iso_bc_entry(IsoBcSection *load)
 
     if (real_size) {
         /* Round up blocks to load */
-        blks_to_load = (real_size + ISO_SECTOR_SIZE - 1) / ISO_SECTOR_SIZE;
+        blks_to_load = DIV_ROUND_UP(real_size, ISO_SECTOR_SIZE);
         sclp_print("ISO boot image size verified\n");
     } else {
         sclp_print("ISO boot image size could not be verified\n");
-- 
2.1.4


