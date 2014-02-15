Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIp-0007s4-Nl
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:25:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIj-0007ft-A8
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIf-0000aF-8f
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeIW-0000ZA-Ly; Sat, 15 Feb 2014 07:24:44 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6871F41C26;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 49F1F21C;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21822 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:12 +0400
Message-Id: <1392466700-21770-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/10] sparc/leon3: Initialize stack pointer
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
X-List-Received-Date: Sat, 15 Feb 2014 12:25:01 -0000

From: Sebastian Huber <sebastian.huber@embedded-brains.de>

A lot of real world LEON3 systems are shipped with the GRMON boot
loader.  This boot loader initializes the stack pointer with the end of
RAM address.  The application can use this to detect the RAM size of a
particular board variant.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
Reviewed-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sparc/leon3.c |    3 +++
 1 file changed, 3 insertions(+)

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
1.7.10.4


