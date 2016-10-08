Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSp-0002YU-Fz
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSj-0002Qj-Qg
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSh-0007t0-TQ
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSd-0007mE-Vq; Sat, 08 Oct 2016 04:58:28 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E0ED40ED7;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 87022B2F;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19255 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Li Qiang <liqiang6-s@360.cn>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:03 +0300
Message-Id: <b16c129daf0fed91febbb88de23dae8271c8898a.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/26] usb: ehci: fix memory leak in
 ehci_process_itd
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
X-List-Received-Date: Sat, 08 Oct 2016 08:58:37 -0000

From: Li Qiang <liqiang6-s@360.cn>

While processing isochronous transfer descriptors(iTD), if the page
select(PG) field value is out of bands it will return. In this
situation the ehci's sg list is not freed thus leading to a memory
leak issue. This patch avoid this.

Signed-off-by: Li Qiang <liqiang6-s@360.cn>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-ehci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index b093db7..f4ece9a 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1426,6 +1426,7 @@ static int ehci_process_itd(EHCIState *ehci,
             if (off + len > 4096) {
                 /* transfer crosses page border */
                 if (pg == 6) {
+                    qemu_sglist_destroy(&ehci->isgl);
                     return -1;  /* avoid page pg + 1 */
                 }
                 ptr2 = (itd->bufptr[pg + 1] & ITD_BUFPTR_MASK);
-- 
2.1.4


