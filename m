Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XmPqz-0004I5-NN
	for mharc-qemu-trivial@gnu.org; Thu, 06 Nov 2014 11:24:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1XmPqt-000496-CS
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 11:24:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1XmPqn-00081N-Sq
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 11:24:03 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:54372
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1XmPqn-00081J-K8
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 11:23:57 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 54F2E2B3F34C;
	Thu,  6 Nov 2014 17:23:54 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-lvRTDbK5cy; Thu,  6 Nov 2014 17:23:54 +0100 (CET)
Received: from lanoue.act-europe.fr (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 25A932B3F334;
	Thu,  6 Nov 2014 17:23:54 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Thu,  6 Nov 2014 17:23:50 +0100
Message-Id: <1415291030-15485-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: agraf@suse.de
Subject: [Qemu-trivial] [PATCH] target-ppc: Fix breakpoint registers for e300
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
X-List-Received-Date: Thu, 06 Nov 2014 16:24:08 -0000

In the previous patch, the registers were added to init_proc_G2LE
instead of init_proc_e300.

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 target-ppc/translate_init.c |   52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 20d58c0..1fece7b 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -4374,32 +4374,6 @@ static void init_proc_G2LE (CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* Breakpoints */
-    /* XXX : not implemented */
-    spr_register(env, SPR_DABR, "DABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_DABR2, "DABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR2, "IABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IBCR, "IBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_DBCR, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
 
     /* Memory management */
     gen_low_BATs(env);
@@ -4628,6 +4602,32 @@ static void init_proc_e300 (CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
+    /* Breakpoints */
+    /* XXX : not implemented */
+    spr_register(env, SPR_DABR, "DABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_DABR2, "DABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR2, "IABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IBCR, "IBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_DBCR, "DBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
-- 
1.7.9.5


