Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpT-000487-JD
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpQ-00042X-L2
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpP-00059T-MH
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zpJ-000578-LE; Mon, 22 Jun 2015 07:23:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E224641E42;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D0212A52;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: (nullmailer pid 9246 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:11 +0300
Message-Id: <4f2cc7f55da197279bcfcf19e8a2d71548944b4b.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 04/21] Print error when failing to load PCI
	config data
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:53 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When loading migration fails due to a disagreement about
PCI config data we don't currently get any errors explaining
that was the cause of the problem or which byte in the config
data was at fault.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2158043..ef44e04 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -427,6 +427,10 @@ static int get_pci_config_device(QEMUFile *f, void *pv, size_t size)
     for (i = 0; i < size; ++i) {
         if ((config[i] ^ s->config[i]) &
             s->cmask[i] & ~s->wmask[i] & ~s->w1cmask[i]) {
+            error_report("%s: Bad config data: i=0x%x read: %x device: %x "
+                         "cmask: %x wmask: %x w1cmask:%x", __func__,
+                         i, config[i], s->config[i],
+                         s->cmask[i], s->wmask[i], s->w1cmask[i]);
             g_free(config);
             return -EINVAL;
         }
-- 
2.1.4


