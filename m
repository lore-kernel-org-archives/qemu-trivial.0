Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufpix-0001uB-4I
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 06:59:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Ufpir-0001nj-Ia
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 06:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Ufpio-0002du-Qx
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 06:59:45 -0400
Received: from [78.47.199.172] (port=36354
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Ufpid-0002Yw-0e; Fri, 24 May 2013 06:59:31 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9C6B67280041; Fri, 24 May 2013 12:19:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id xwXPDJURZhta; Fri, 24 May 2013 12:19:36 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id C820C728004A; Fri, 24 May 2013 12:19:36 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 24 May 2013 12:19:25 +0200
Message-Id: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Voevodin <e.voevodin@samsung.com>,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] Remove unnecessary break statements
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
X-List-Received-Date: Fri, 24 May 2013 10:59:49 -0000

Fix these warnings from cppcheck:

hw/display/cirrus_vga.c:2603:
hw/sd/sd.c:348:
hw/timer/exynos4210_mct.c:1033:
target-arm/translate.c:9886:
target-s390x/mem_helper.c:518:
target-unicore32/translate.c:1936:
 style: Consecutive return, break, continue, goto or throw statements are unnecessary.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/display/cirrus_vga.c      |    1 -
 hw/timer/exynos4210_mct.c    |    1 -
 target-arm/translate.c       |    1 -
 target-s390x/mem_helper.c    |    1 -
 target-unicore32/translate.c |    1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 64bfe2b..a5dbc39 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2600,7 +2600,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 #endif
 	cirrus_vga_write_sr(c, val);
         break;
-	break;
     case 0x3c6:
 	cirrus_write_hidden_dac(c, val);
 	break;
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 87ce75b..38dcc1a 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1030,7 +1030,6 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
     case G_INT_ENB:
         value = s->g_timer.reg.int_enb;
         break;
-        break;
     case G_WSTAT:
         value = s->g_timer.reg.wstat;
         break;
diff --git a/target-arm/translate.c b/target-arm/translate.c
index a1b7b8c..053d2f2 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -9883,7 +9883,6 @@ static inline void gen_intermediate_code_internal(CPUARMState *env,
                        invalidate this TB.  */
                     dc->pc += 2;
                     goto done_generating;
-                    break;
                 }
             }
         }
diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
index 02bc432..1422ae9 100644
--- a/target-s390x/mem_helper.c
+++ b/target-s390x/mem_helper.c
@@ -515,7 +515,6 @@ uint32_t HELPER(ex)(CPUS390XState *env, uint32_t cc, uint64_t v1,
             break;
         default:
             goto abort;
-            break;
         }
     } else if ((insn & 0xff00) == 0x0a00) {
         /* supervisor call */
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 151e35e..3dc7856 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -1933,7 +1933,6 @@ static inline void gen_intermediate_code_internal(CPUUniCore32State *env,
                        invalidate this TB.  */
                     dc->pc += 2; /* FIXME */
                     goto done_generating;
-                    break;
                 }
             }
         }
-- 
1.7.10.4


