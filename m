Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSm-0005VK-4H
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSh-0005Lh-8V
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSg-0001XX-Do
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSa-0001S3-E2; Fri, 06 Nov 2015 07:49:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2690F40DD1;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5BABCAB7;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31694 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:48 +0300
Message-Id: <1a13b27273cdc4f6fd18bc1e83950d47c6b5928b.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/24] hw/dma/pxa2xx: Remove superfluous memset
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
X-List-Received-Date: Fri, 06 Nov 2015 12:49:48 -0000

From: Thomas Huth <thuth@redhat.com>

g_malloc0 already clears the memory, so no need for
the additional memset here. And while we're at it,
also convert the g_malloc0 to the preferred g_new0.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/pxa2xx_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index d4501fb..54cdb25 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -459,9 +459,8 @@ static int pxa2xx_dma_init(SysBusDevice *sbd)
         return -1;
     }
 
-    s->chan = g_malloc0(sizeof(PXA2xxDMAChannel) * s->channels);
+    s->chan = g_new0(PXA2xxDMAChannel, s->channels);
 
-    memset(s->chan, 0, sizeof(PXA2xxDMAChannel) * s->channels);
     for (i = 0; i < s->channels; i ++)
         s->chan[i].state = DCSR_STOPINTR;
 
-- 
2.1.4


