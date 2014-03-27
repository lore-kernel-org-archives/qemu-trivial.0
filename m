Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCNu-0000Xb-Dr
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNo-0000Lj-D2
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNk-0006J5-2s
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCNX-0006G6-FF; Thu, 27 Mar 2014 11:38:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2FD0443726;
	Thu, 27 Mar 2014 19:38:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DBCAE68D;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1790 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:17 +0400
Message-Id: <1395934108-1694-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/23] hw/pci/pci_host.c: Avoid shifting left
	into sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 15:38:25 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci/pci_host.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 77c7d1f..3e26f92 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -142,8 +142,9 @@ static uint64_t pci_host_data_read(void *opaque,
 {
     PCIHostState *s = opaque;
     uint32_t val;
-    if (!(s->config_reg & (1 << 31)))
+    if (!(s->config_reg & (1U << 31))) {
         return 0xffffffff;
+    }
     val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
     PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
                 addr, len, val);
-- 
1.7.10.4


