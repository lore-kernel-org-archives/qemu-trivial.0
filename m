Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTDNh-0000Yo-Jq
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:46:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNb-0000MG-K9
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNa-0004Gs-RR
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTDNS-0004CV-7p; Wed, 04 Mar 2015 12:46:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A56C6408AD;
	Wed,  4 Mar 2015 20:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0D231982;
	Wed,  4 Mar 2015 20:07:12 +0300 (MSK)
Received: (nullmailer pid 17548 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:49 +0300
Message-Id: <4c533118c4f7b7432bc0b8dca0949d624cbe0327.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 32/47] milkymist.c: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 17:46:44 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/lm32/milkymist.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 256c102..7f62261 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -155,6 +155,7 @@ milkymist_init(MachineState *machine)
                 bios_name);
         exit(1);
     }
+    g_free(bios_filename);
 
     milkymist_uart_create(0x60000000, irq[0]);
     milkymist_sysctl_create(0x60001000, irq[1], irq[2], irq[3],
-- 
2.1.4


