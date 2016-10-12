Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buS7l-0002fn-Kj
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 18:35:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7h-0002cq-3j
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7f-0002d1-31
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:39 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:49245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buS7Z-0002ZW-DJ; Wed, 12 Oct 2016 18:35:33 -0400
Received: from apollo.fritz.box (ip5f585ef2.dynamic.kabel-deutschland.de
	[95.88.94.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id B297122278;
	Thu, 13 Oct 2016 00:35:29 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476311730;
	bh=1sRkqAL6FqZoYf6UmGbuCpY2F4DJuv/XiJIkHPou1T0=;
	h=From:To:Cc:Subject:Date:From;
	b=OwtLsbiOcHKfS6pSGSpcybPXPQ4czycniRVlCb9s7hNZdvJQNLoxBf/MNYKnQv6Us
	bJ5SbT5otVT0RCG4jkTZuf3IQS9Q3ERS3TIGzVzSD2WHxJmC65PRn2Uat+dLnXHKGQ
	HhriMu1dMPc93ppyBRcqXBbfGIbcgsKH+WK9LrYY=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Thu, 13 Oct 2016 00:35:05 +0200
Message-Id: <1476311708-14792-1-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH 1/4] target-lm32: swap operand of wcsr in
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
X-List-Received-Date: Wed, 12 Oct 2016 22:35:42 -0000

Be consistent with the reference manual.

Signed-off-by: Michael Walle <michael@walle.cc>
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


