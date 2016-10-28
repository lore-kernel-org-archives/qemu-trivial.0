Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08w8-0004Q0-BR
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vz-0004HB-O2
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vz-0004eX-2V
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vr-0004Tx-Jr; Fri, 28 Oct 2016 11:18:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A57884372F;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 82161B3E;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6054 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:36 +0300
Message-Id: <49285e11d8ce90d2fd76d8bf16b330731e220495.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/23] target-lm32: swap operand of wcsr in
 LOG_DIS()
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
X-List-Received-Date: Fri, 28 Oct 2016 15:19:13 -0000

From: Michael Walle <michael@walle.cc>

Be consistent with the reference manual.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-lm32/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index dc64cc6..fa8416a 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -865,7 +865,7 @@ static void dec_wcsr(DisasContext *dc)
 {
     int no;
 
-    LOG_DIS("wcsr r%d, %d\n", dc->r1, dc->csr);
+    LOG_DIS("wcsr %d, r%d\n", dc->csr, dc->r1);
 
     switch (dc->csr) {
     case CSR_IE:
-- 
2.1.4


