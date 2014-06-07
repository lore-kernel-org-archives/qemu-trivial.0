Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtK3A-0007pQ-HH
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 13:05:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK38-0007mR-LW
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:04:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK37-0005mK-Rh
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:04:58 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK35-0005lq-SH; Sat, 07 Jun 2014 13:04:56 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK35-0003fF-DS; Sat, 07 Jun 2014 18:04:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 18:04:55 +0100
Message-Id: <1402160695-14060-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-i386/translate.c: Remove unused
	tcg_gen_lshift()
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
X-List-Received-Date: Sat, 07 Jun 2014 17:04:59 -0000

The function tcg_gen_lshift() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-i386/translate.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target-i386/translate.c b/target-i386/translate.c
index 3aa52eb..c02f7fd 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -1505,14 +1505,6 @@ static void gen_shift_rm_im(DisasContext *s, TCGMemOp ot, int op1, int op2,
     }
 }
 
-static inline void tcg_gen_lshift(TCGv ret, TCGv arg1, target_long arg2)
-{
-    if (arg2 >= 0)
-        tcg_gen_shli_tl(ret, arg1, arg2);
-    else
-        tcg_gen_shri_tl(ret, arg1, -arg2);
-}
-
 static void gen_rot_rm_T1(DisasContext *s, TCGMemOp ot, int op1, int is_right)
 {
     target_ulong mask = (ot == MO_64 ? 0x3f : 0x1f);
-- 
1.8.5.4


