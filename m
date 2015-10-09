Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zka2u-0007jm-AZ
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:57:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2L-0006nA-3h
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2J-0005N2-Ih
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1Zka2E-00053A-DS; Fri, 09 Oct 2015 11:56:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 0EB7A550CD;
	Fri,  9 Oct 2015 15:56:42 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99Fud3K025235; Fri, 9 Oct 2015 11:56:41 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  9 Oct 2015 17:56:35 +0200
Message-Id: <1444406198-6521-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1444406198-6521-1-git-send-email-thuth@redhat.com>
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 1/4] hw/dma/pxa2xx: Remove superfluous
	memset
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
X-List-Received-Date: Fri, 09 Oct 2015 15:56:50 -0000

g_malloc0 already clears the memory, so no need for
the additional memset here. And while we're at it,
also convert the g_malloc0 to the preferred g_new0.

Signed-off-by: Thomas Huth <thuth@redhat.com>
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
1.8.3.1


