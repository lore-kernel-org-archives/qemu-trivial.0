Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09Vb-00036U-0X
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VX-00032Z-Vv
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VX-0003OE-8s
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VQ-0003Gv-NK; Fri, 28 Oct 2016 11:55:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C4F7F4374B;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 84C86B50;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6064 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:41 +0300
Message-Id: <c1a900cf4a3925c2e4b313b82da5df955f17b70a.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/23] milkymist-pfpu: fix potential integer
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:52 -0000

From: Michael Walle <michael@walle.cc>

Since the lm32 is a 32 bit architecture, just return a 32 bit value which
is then converted to a 64 bit value.

Spotted by coverity, CID 1005506.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


