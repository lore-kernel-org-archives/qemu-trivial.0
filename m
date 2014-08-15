Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJED-000163-Qo
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE7-00010x-RL
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE1-0005cc-OX
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDn-0005aU-J9; Fri, 15 Aug 2014 11:15:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DE41C4307B;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC97F6DF;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: (nullmailer pid 17904 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:52 +0400
Message-Id: <1408115711-17836-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/20] apic: Fix reported DFR content
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:40 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

IA-32 SDM, Figure 10-14: Bits 27:0 are reserved as 1.

Fixes Jailhouse hypervisor start with in-kernel irqchips off.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/apic.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index ef19e55..03ff9e9 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -698,7 +698,7 @@ static uint32_t apic_mem_readl(void *opaque, hwaddr addr)
         val = s->log_dest << 24;
         break;
     case 0x0e:
-        val = s->dest_mode << 28;
+        val = (s->dest_mode << 28) | 0xfffffff;
         break;
     case 0x0f:
         val = s->spurious_vec;
-- 
1.7.10.4


