Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buzA5-0007VQ-Sh
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 05:52:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buzA3-0007UZ-WD
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 05:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buzA3-0005sA-4k
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 05:52:19 -0400
Received: from ssl.serverraum.org ([2a01:4f8:130:84d6::1:2]:47347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buz9v-0005ol-K9; Fri, 14 Oct 2016 05:52:11 -0400
Received: from mwalle01.kse.adk.loc (unknown [194.25.174.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D4C082226C;
	Fri, 14 Oct 2016 11:52:04 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476438725;
	bh=Oqd9BzCJJqln+PV2AheoBgPJLy624Jyo6EwTlYFEJVU=;
	h=From:To:Cc:Subject:Date:From;
	b=Ucq0/JKr7PBCv6bf++P/o0upvIkZeHMLPDikLaKycpsWk7VofIj0L/vBZPkX40nQ1
	eRYjWAULzBU5CDRyrWphU19QafkDSKuuZSHJTHj12TNYPM3U4wcKB2yE0bsYIvBeBw
	qEuH6Ok/En+/OA1A/ElyiAgtblbpcvizTrIn2PTA=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Fri, 14 Oct 2016 11:51:50 +0200
Message-Id: <1476438710-9226-1-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:130:84d6::1:2
Subject: [Qemu-trivial] [PATCH] milkymist-pfpu: fix potential integer
 overflow
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
X-List-Received-Date: Fri, 14 Oct 2016 09:52:21 -0000

Since the lm32 is a 32 bit architecture, just return a 32 bit value which
is then converted to a 64 bit value.

Spotted by coverity, CID 1005506.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 hw/misc/milkymist-pfpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 1da21a6..3ca2589 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -137,7 +137,7 @@ struct MilkymistPFPUState {
 };
 typedef struct MilkymistPFPUState MilkymistPFPUState;
 
-static inline hwaddr
+static inline uint32_t
 get_dma_address(uint32_t base, uint32_t x, uint32_t y)
 {
     return base + 8 * (128 * y + x);
-- 
2.1.4


