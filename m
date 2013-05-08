Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua2Qi-0003RR-8P
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 07:21:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua2Qb-0003Qy-87
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 07:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua2QX-0003zE-58
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 07:20:57 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:53555
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua2QW-0003yh-QL
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 07:20:53 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id 8246425BD4C
	for <qemu-trivial@nongnu.org>; Wed,  8 May 2013 13:20:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-trivial@nongnu.org
Date: Wed,  8 May 2013 13:17:40 +0200
Message-Id: <1368011861-57373-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
Cc: petar.jovanovic@imgtec.com
Subject: [Qemu-trivial] [PATCH] target-mips: fix incorrect behaviour for INSV
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
X-List-Received-Date: Wed, 08 May 2013 11:21:02 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

Corner case for INSV instruction when size=32 has not been correctly
implemented. The mask for size should be one bit wider, and preparing the
filter variable should be aware of this case too.

The test for INSV has been extended to include the case that triggers the
bug.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 target-mips/dsp_helper.c         |    4 ++--
 tests/tcg/mips/mips32-dsp/insv.c |   13 +++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
index 805247d..9212789 100644
--- a/target-mips/dsp_helper.c
+++ b/target-mips/dsp_helper.c
@@ -2921,7 +2921,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong rs,  \
         return rt;                                              \
     }                                                           \
                                                                 \
-    filter = ((int32_t)0x01 << size) - 1;                       \
+    filter = ((int64_t)0x01 << size) - 1;                       \
     filter = filter << pos;                                     \
     temprs = (rs << pos) & filter;                              \
     temprt = rt & ~filter;                                      \
@@ -2930,7 +2930,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong rs,  \
     return (target_long)(ret_type)temp;                         \
 }
 
-BIT_INSV(insv, 0x1F, 0x1F, int32_t);
+BIT_INSV(insv, 0x1F, 0x3F, int32_t);
 #ifdef TARGET_MIPS64
 BIT_INSV(dinsv, 0x7F, 0x3F, target_long);
 #endif
diff --git a/tests/tcg/mips/mips32-dsp/insv.c b/tests/tcg/mips/mips32-dsp/insv.c
index 243b007..9d67469 100644
--- a/tests/tcg/mips/mips32-dsp/insv.c
+++ b/tests/tcg/mips/mips32-dsp/insv.c
@@ -19,5 +19,18 @@ int main()
         );
     assert(rt == result);
 
+    dsp    = 0x1000;
+    rt     = 0xF0F0F0F0;
+    rs     = 0xA5A5A5A5;
+    result = 0xA5A5A5A5;
+
+    __asm
+        ("wrdsp %2\n\t"
+         "insv  %0, %1\n\t"
+         : "+r"(rt)
+         : "r"(rs), "r"(dsp)
+        );
+    assert(rt == result);
+
     return 0;
 }
-- 
1.7.9.5


