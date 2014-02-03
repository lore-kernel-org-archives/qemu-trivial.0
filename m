Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAFfp-00035i-NV
	for mharc-qemu-trivial@gnu.org; Mon, 03 Feb 2014 04:18:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WAFfi-0002vv-MJ
	for qemu-trivial@nongnu.org; Mon, 03 Feb 2014 04:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WAFfd-0007Jg-I8
	for qemu-trivial@nongnu.org; Mon, 03 Feb 2014 04:18:30 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:44312
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WAFfT-0007GM-EC; Mon, 03 Feb 2014 04:18:15 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 0AD7F652CFD; Mon,  3 Feb 2014 10:18:13 +0100 (CET)
Received: from linux-7i4a.eb.z (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id 686D4652CF6;
	Mon,  3 Feb 2014 10:18:13 +0100 (CET)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Date: Mon,  3 Feb 2014 10:18:11 +0100
Message-Id: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org,
	Sebastian Huber <sebastian.huber@embedded-brains.de>
Subject: [Qemu-trivial] [PATCH] sparc/leon3: Initialize stack pointer
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
X-List-Received-Date: Mon, 03 Feb 2014 09:18:35 -0000

A lot of real world LEON3 systems are shipped with the GRMON boot
loader.  This boot loader initializes the stack pointer with the end of
RAM address.  The application can use this to detect the RAM size of a
particular board variant.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/sparc/leon3.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index c583c3d..c16e9e4 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -45,6 +45,7 @@
 typedef struct ResetData {
     SPARCCPU *cpu;
     uint32_t  entry;            /* save kernel entry in case of reset */
+    target_ulong sp;            /* initial stack pointer */
 } ResetData;
 
 static void main_cpu_reset(void *opaque)
@@ -58,6 +59,7 @@ static void main_cpu_reset(void *opaque)
     cpu->halted = 0;
     env->pc     = s->entry;
     env->npc    = s->entry + 4;
+    env->regbase[6] = s->sp;
 }
 
 void leon3_irq_ack(void *irq_manager, int intno)
@@ -133,6 +135,7 @@ static void leon3_generic_hw_init(QEMUMachineInitArgs *args)
     /* Reset data */
     reset_info        = g_malloc0(sizeof(ResetData));
     reset_info->cpu   = cpu;
+    reset_info->sp    = 0x40000000 + ram_size;
     qemu_register_reset(main_cpu_reset, reset_info);
 
     /* Allocate IRQ manager */
-- 
1.7.7


