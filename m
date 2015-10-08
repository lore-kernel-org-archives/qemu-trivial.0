Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkdd1-0003u5-Er
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:46:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyL-0004at-U3
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyL-0006Ek-3a
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyJ-0006DR-7U; Thu, 08 Oct 2015 15:35:23 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E94D367;
	Thu,  8 Oct 2015 19:35:22 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3I009701; Thu, 8 Oct 2015 15:35:21 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:12 +0200
Message-Id: <1444332916-16476-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1444332916-16476-1-git-send-email-thuth@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/5] hw/dma/pxa2xx: Remove superfluous memset
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
X-List-Received-Date: Thu, 08 Oct 2015 19:35:27 -0000

g_malloc0 already clears the memory, so no need for
the additional memset here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/pxa2xx_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index d4501fb..3f0a720 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -461,7 +461,6 @@ static int pxa2xx_dma_init(SysBusDevice *sbd)
 
     s->chan = g_malloc0(sizeof(PXA2xxDMAChannel) * s->channels);
 
-    memset(s->chan, 0, sizeof(PXA2xxDMAChannel) * s->channels);
     for (i = 0; i < s->channels; i ++)
         s->chan[i].state = DCSR_STOPINTR;
 
-- 
1.8.3.1


