Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88r2-0007rp-6P
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qv-0007eT-HR
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qq-0001m0-GU
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001d6-1s; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8792243869;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 603696BB;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 623 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:07 +0400
Message-Id: <1405692553-564-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 2/8] Fix new typos in comments (found by
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:42 -0000

From: Stefan Weil <sw@weilnetz.de>

arbitary -> arbitrary
basicly -> basically

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc_piix.c                     |    2 +-
 hw/i386/pc_q35.c                      |    2 +-
 include/libdecnumber/decNumberLocal.h |    2 +-
 xen-hvm.c                             |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ec8ccdb..7081c08 100644
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


