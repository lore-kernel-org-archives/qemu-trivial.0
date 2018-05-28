Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNMcL-0005iW-7A
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 14:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNMcG-0005gs-Dw
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 14:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNMcB-0007BI-Em
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 14:11:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34270 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fNMc6-00078C-Ja; Mon, 28 May 2018 14:11:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AFE7818BAF6;
	Mon, 28 May 2018 18:11:22 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-88.ams2.redhat.com [10.36.116.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87836ED178;
	Mon, 28 May 2018 18:11:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 28 May 2018 20:11:19 +0200
Message-Id: <1527531079-32717-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 28 May 2018 18:11:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 28 May 2018 18:11:22 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] target/ppc: Use proper logging function for
 possible guest errors
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2018 18:11:33 -0000

fprintf() and qemu_log_separate() are frowned upon these days for printing
logging information in QEMU. Accessing the wrong SPRs indicates wrong guest
behaviour in most cases, and we've got a proper way to log such situations,
which is the qemu_log_mask(LOG_GUEST_ERROR, ...) function. So use this
function now for logging the bad SPR accesses instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/ppc/translate.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e30d99f..0806ee0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3933,13 +3933,9 @@ static inline void gen_op_mfspr(DisasContext *ctx)
              * allowing userland application to read the PVR
              */
             if (sprn != SPR_PVR) {
-                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
-                        TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-                if (qemu_log_separate()) {
-                    qemu_log("Trying to read privileged spr %d (0x%03x) at "
-                             TARGET_FMT_lx "\n", sprn, sprn,
-                             ctx->base.pc_next - 4);
-                }
+                qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
+                              "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
+                              ctx->base.pc_next - 4);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -3951,12 +3947,9 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             return;
         }
         /* Not defined */
-        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-        if (qemu_log_separate()) {
-            qemu_log("Trying to read invalid spr %d (0x%03x) at "
-                     TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Trying to read invalid spr %d (0x%03x) at "
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
          * it can generate a priv, a hv emu or a no-op
@@ -4097,12 +4090,9 @@ static void gen_mtspr(DisasContext *ctx)
             (*write_cb)(ctx, sprn, rS(ctx->opcode));
         } else {
             /* Privilege exception */
-            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
-                    TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-            if (qemu_log_separate()) {
-                qemu_log("Trying to write privileged spr %d (0x%03x) at "
-                         TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-            }
+            qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
+                          "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
+                          ctx->base.pc_next - 4);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -4114,12 +4104,9 @@ static void gen_mtspr(DisasContext *ctx)
         }
 
         /* Not defined */
-        if (qemu_log_separate()) {
-            qemu_log("Trying to write invalid spr %d (0x%03x) at "
-                     TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
-        }
-        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Trying to write invalid spr %d (0x%03x) at "
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
 
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
-- 
1.8.3.1


