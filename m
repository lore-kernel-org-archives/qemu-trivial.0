Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUML-0002M1-S9
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMJ-0002Ey-Ie
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMI-0002nl-Es
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:23 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMG-0002B9-0N; Sun, 14 Oct 2012 16:00:20 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/A/Qr/OUlrA4s4VFZoEtY2wBMXr0wbh3Yfkfwn0cy68=;
	b=MTGYGDblLD5d3KLGXSO5FdSkf7JxXpq3UocfyiqruZb30vEXqmzGwKkAKkj6Q55mTp
	1Jain4g8d3L6NG2C73U7uwz+TJR2V2HPxBCcZm/go/cb9zHJGTrmpBNTf0xNNIR2ZlhH
	5SY2bh2zvRj4duE+G12jozaJk2PUg/FufYrVlMc48sIs4tubm8LQSypjeQ4hwDXOkgMX
	m8MhberxqUMmys/wyoWW2ZcTlgBS9MluGaSU6UaQ9Y55S+qw67j/7+EBgQU02nz0Ixup
	Frjx/DYILQrUr9Vkktkm0/QPEJscUISY1Xz9BTNkUpSOIRJsjv+sgrl+RgDlEy+OEPxK
	8WoQ==
Received: by 10.112.48.133 with SMTP id l5mr1031598lbn.53.1350244819203;
	Sun, 14 Oct 2012 13:00:19 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:18 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:54 +0000
Message-Id: <8c1894260d79472792554a769d6f07e594dd5022.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH 06/11] sun4c: remove unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:25 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/sun4c_intctl.c |   23 -----------------------
 hw/sun4m.h        |    4 ----
 2 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/hw/sun4c_intctl.c b/hw/sun4c_intctl.c
index 8dfa5ec..09ef937 100644
--- a/hw/sun4c_intctl.c
+++ b/hw/sun4c_intctl.c
@@ -94,29 +94,6 @@ static const MemoryRegionOps sun4c_intctl_mem_ops = {
     },
 };
 
-void sun4c_pic_info(Monitor *mon, void *opaque)
-{
-    Sun4c_INTCTLState *s = opaque;
-
-    monitor_printf(mon, "master: pending 0x%2.2x, enabled 0x%2.2x\n",
-                   s->pending, s->reg);
-}
-
-void sun4c_irq_info(Monitor *mon, void *opaque)
-{
-#ifndef DEBUG_IRQ_COUNT
-    monitor_printf(mon, "irq statistic code not compiled.\n");
-#else
-    Sun4c_INTCTLState *s = opaque;
-    int64_t count;
-
-    monitor_printf(mon, "IRQ statistics:\n");
-    count = s->irq_count;
-    if (count > 0)
-        monitor_printf(mon, " %" PRId64 "\n", count);
-#endif
-}
-
 static const uint32_t intbit_to_level[] = { 0, 1, 4, 6, 8, 10, 0, 14, };
 
 static void sun4c_check_interrupts(void *opaque)
diff --git a/hw/sun4m.h b/hw/sun4m.h
index 504c3af..a7b7ac7 100644
--- a/hw/sun4m.h
+++ b/hw/sun4m.h
@@ -26,10 +26,6 @@ static inline void sparc_iommu_memory_write(void *opaque,
 void slavio_pic_info(Monitor *mon, DeviceState *dev);
 void slavio_irq_info(Monitor *mon, DeviceState *dev);
 
-/* sun4c_intctl.c */
-void sun4c_pic_info(Monitor *mon, void *opaque);
-void sun4c_irq_info(Monitor *mon, void *opaque);
-
 /* sun4m.c */
 void sun4m_pic_info(Monitor *mon);
 void sun4m_irq_info(Monitor *mon);
-- 
1.7.2.5


