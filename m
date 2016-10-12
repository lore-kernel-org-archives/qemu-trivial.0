Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buMK2-000271-G1
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 12:24:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buMJz-00024u-Sx
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buMJx-0000Wy-UG
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:23:58 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:52122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buMJs-0000Tq-7q; Wed, 12 Oct 2016 12:23:52 -0400
Received: from mwalle01.kse.adk.loc (unknown [194.25.174.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 01F4122265;
	Wed, 12 Oct 2016 18:23:45 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476289426;
	bh=9FwRVrMn1qTtUOUGGCLRpqrxVxfGYumOOl7Tt95jC84=;
	h=From:To:Cc:Subject:Date:From;
	b=UB0L10G72lpegirmFr4Jz3956PE6vNgcIQZew/rOBe7pSiekIh8JgdfkgvnNulBn5
	j6zJHCG8jFS7XZQv+JDe+Wvhj0dkFb8i9+jA6H5VjsjdkOkRK+5cy7onD/n9d6KxeA
	EBf9CNIOyv6GmlUdYb3+H1oLspcyq+81wlZAMrPU=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
	Michael Walle <michael@walle.cc>
Date: Wed, 12 Oct 2016 18:23:16 +0200
Message-Id: <1476289396-10780-1-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH] target-lm32: fix style issue
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
X-List-Received-Date: Wed, 12 Oct 2016 16:24:01 -0000

Both branches of the ternary operator have the same expressions. Drop the
operator.

This fixes: https://bugs.launchpad.net/qemu/+bug/1414293

Signed-off-by: Michael Walle <michael@walle.cc>
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


