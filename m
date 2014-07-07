Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EAj-0004I1-TV
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EAZ-0004Ey-RH
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EAR-0002Oy-FP
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:01:43 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36581)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4E9f-0002DC-Pd; Mon, 07 Jul 2014 15:00:47 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7A70717FA16; Mon,  7 Jul 2014 21:00:43 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:00:41 +0200
Message-Id: <1404759642-29232-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Tom Musta <tommusta@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PATCH] Fix new typos in comments (found by
	codespell)
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
X-List-Received-Date: Mon, 07 Jul 2014 19:01:52 -0000

arbitary -> arbitrary
basicly -> basically

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/pc_piix.c                     |    2 +-
 hw/i386/pc_q35.c                      |    2 +-
 include/libdecnumber/decNumberLocal.h |    2 +-
 xen-hvm.c                             |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2dccb34..43fd8a1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -114,7 +114,7 @@ static void pc_init1(MachineState *machine,
         lowmem = 0xe0000000;
     }
 
-    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
+    /* Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(qemu limit, user limit).
      */
     if (lowmem > pc_machine->max_ram_below_4g) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 36b6ab0..f551961 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -103,7 +103,7 @@ static void pc_q35_init(MachineState *machine)
         lowmem = 0xb0000000;
     }
 
-    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
+    /* Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(qemu limit, user limit).
      */
     if (lowmem > pc_machine->max_ram_below_4g) {
diff --git a/include/libdecnumber/decNumberLocal.h b/include/libdecnumber/decNumberLocal.h
index cd4eb79..71ed77b 100644
--- a/include/libdecnumber/decNumberLocal.h
+++ b/include/libdecnumber/decNumberLocal.h
@@ -153,7 +153,7 @@
 
 
   /* ---------------------------------------------------------------- */
-  /* Definitions for arbitary-precision modules (only valid after     */
+  /* Definitions for arbitrary-precision modules (only valid after    */
   /* decNumber.h has been included)				      */
   /* ---------------------------------------------------------------- */
 
diff --git a/xen-hvm.c b/xen-hvm.c
index c928b36..a2486cf 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -165,7 +165,7 @@ static void xen_ram_init(ram_addr_t *below_4g_mem_size,
                                                    PC_MACHINE_MAX_RAM_BELOW_4G,
                                                    &error_abort);
 
-    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
+    /* Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(xen limit, user limit).
      */
     if (HVM_BELOW_4G_RAM_END <= user_lowmem) {
-- 
1.7.10.4


