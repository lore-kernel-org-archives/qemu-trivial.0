Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2o-00014K-K0
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2j-0000sk-6g
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2f-00008A-4j
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-00005u-SB; Mon, 02 Sep 2013 07:11:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36D2040242;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 08A07214;
	Mon,  2 Sep 2013 15:01:58 +0400 (MSK)
Received: (nullmailer pid 14647 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:31 +0400
Message-Id: <1378119695-14568-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/15] target-arm: Report unimplemented
	opcodes (LOG_UNIMP)
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:41 -0000

From: Stefan Weil <sw@weilnetz.de>

These unimplemented opcodes are handled like illegal opcodes, but
they are used in existing code. We should at least report when they
are executed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/translate.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index d1e8538..92d9f16 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -6715,6 +6715,7 @@ static void disas_arm_insn(CPUARMState * env, DisasContext *s)
             /* setend */
             if (((insn >> 9) & 1) != s->bswap_code) {
                 /* Dynamic endianness switching not implemented. */
+                qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
                 goto illegal_op;
             }
             return;
@@ -8740,6 +8741,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
 
                 if (insn & (1 << 26)) {
                     /* Secure monitor call (v6Z) */
+                    qemu_log_mask(LOG_UNIMP,
+                                  "arm: unimplemented secure monitor call\n");
                     goto illegal_op; /* not implemented.  */
                 } else {
                     op = (insn >> 20) & 7;
@@ -9779,6 +9782,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 ARCH(6);
                 if (((insn >> 3) & 1) != s->bswap_code) {
                     /* Dynamic endianness switching not implemented. */
+                    qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
                     goto illegal_op;
                 }
                 break;
-- 
1.7.10.4


