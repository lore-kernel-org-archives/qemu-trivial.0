Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDg-0002UT-Gt
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDY-0002EE-MB
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDT-0007Xf-OL
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDH-0007Un-NK; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A16A3412D0;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2AE196CD;
	Tue, 10 Jun 2014 20:08:49 +0400 (MSK)
Received: (nullmailer pid 13342 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:43 +0400
Message-Id: <1402416523-13212-26-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 25/25] virtio.c: fix error message
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:17 -0000

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3557c17..a07ae8a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -440,7 +440,7 @@ void virtqueue_map_sg(struct iovec *sg, hwaddr *addr,
         len = sg[i].iov_len;
         sg[i].iov_base = cpu_physical_memory_map(addr[i], &len, is_write);
         if (sg[i].iov_base == NULL || len != sg[i].iov_len) {
-            error_report("virtio: trying to map MMIO memory");
+            error_report("virtio: error trying to map MMIO memory");
             exit(1);
         }
     }
-- 
1.7.10.4


