Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09CI-0002X8-Qi
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CB-0002S0-Hf
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CA-0003ks-2W
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09C4-0003hx-Qp; Fri, 28 Oct 2016 11:35:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 262364373D;
	Fri, 28 Oct 2016 18:35:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 97852B51;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6050 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:34 +0300
Message-Id: <5db35b616b8d3a27783ecddfe12353b88b0cb9f1.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/23] target-lm32: fix style issue
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
X-List-Received-Date: Fri, 28 Oct 2016 15:35:52 -0000

From: Michael Walle <michael@walle.cc>

Both branches of the ternary operator have the same expressions. Drop the
operator.

This fixes: https://bugs.launchpad.net/qemu/+bug/1414293

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-lm32/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 2d8caeb..534c17c 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -343,7 +343,7 @@ static void dec_calli(DisasContext *dc)
 static inline void gen_compare(DisasContext *dc, int cond)
 {
     int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
-    int rY = (dc->format == OP_FMT_RR) ? dc->r0 : dc->r0;
+    int rY = dc->r0;
     int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
     int i;
 
-- 
2.1.4


