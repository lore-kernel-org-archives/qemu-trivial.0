Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08w5-0004N9-FI
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08w2-0004Jg-3i
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vw-0004bH-Ar
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vr-0004Tw-Jq; Fri, 28 Oct 2016 11:18:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61F3D4372D;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3B1FFB43;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6060 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:39 +0300
Message-Id: <0a04e11f32cb51d3210007d902e170cc164bb813.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/23] target-lm32: rewrite gen_compare()
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
X-List-Received-Date: Fri, 28 Oct 2016 15:19:11 -0000

From: Michael Walle <michael@walle.cc>

Drop the rX, rY and rZ stuff and use dc->r{0,1,2} directly. This should
also fix the false positive in coverity CID 1005720.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-lm32/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 792637f..842af63 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -344,9 +344,6 @@ static void dec_calli(DisasContext *dc)
 
 static inline void gen_compare(DisasContext *dc, int cond)
 {
-    int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
-    int rY = dc->r0;
-    int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
     int i;
 
     if (dc->format == OP_FMT_RI) {
@@ -360,9 +357,9 @@ static inline void gen_compare(DisasContext *dc, int cond)
             break;
         }
 
-        tcg_gen_setcondi_tl(cond, cpu_R[rX], cpu_R[rY], i);
+        tcg_gen_setcondi_tl(cond, cpu_R[dc->r1], cpu_R[dc->r0], i);
     } else {
-        tcg_gen_setcond_tl(cond, cpu_R[rX], cpu_R[rY], cpu_R[rZ]);
+        tcg_gen_setcond_tl(cond, cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
     }
 }
 
-- 
2.1.4


