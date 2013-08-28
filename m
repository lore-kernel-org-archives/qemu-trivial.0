Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEXY6-0007hT-G2
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 00:40:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEXY3-0007cl-Vu
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 00:40:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEXY3-0005Y3-20
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 00:40:03 -0400
Received: from [2a03:4000:2:362::1] (port=46711
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEXY0-0005Rg-IP; Wed, 28 Aug 2013 00:40:00 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4284B17FCC5; Wed, 28 Aug 2013 06:39:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 28 Aug 2013 06:39:56 +0200
Message-Id: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Brook <paul@codesourcery.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-arm: Report unimplemented opcodes
	(LOG_UNIMP)
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
X-List-Received-Date: Wed, 28 Aug 2013 04:40:04 -0000

These unimplemented opcodes are handled like illegal opcodes, but
they are used in existing code. We should at least report when they
are executed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

When running a QEMU system emulation of an ARM system
(Raspberry PI), Linux booted, but when I tried to run a
user session, it terminated without error message.

It took me some time to see that bash got an illegal
instruction exception. It was caused by ARM opcode 'setend'
which is not implemented in QEMU's ARM emulation.
The patch should help detecting similar scenarios in
the future.

Raspberry PI uses 'setend' in an optimized version of
memcmp, so lots of other executables also fail with QEMU.

As a workaround, the preloading of that optimized code
can be removed. Of course an improved QEMU emulation
would be better.

Regards,
Stefan

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


