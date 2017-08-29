Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dml1N-0005IQ-Nc
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2017 14:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dml1L-0005HM-Oi
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 14:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dml1K-0001pi-Qp
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 14:13:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dml1E-0001nd-Lw; Tue, 29 Aug 2017 14:13:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57E10C047B86;
	Tue, 29 Aug 2017 18:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 57E10C047B86
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB4385D9C8;
	Tue, 29 Aug 2017 18:13:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 29 Aug 2017 20:13:36 +0200
Message-Id: <1504030416-18618-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 29 Aug 2017 18:13:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
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
X-List-Received-Date: Tue, 29 Aug 2017 18:13:52 -0000

Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
opaque BAR handle") a while ago, but nobody noticed since the tests are
only run in SPEED=slow mode: The msix_pba_bar is not correctly initialized
anymore if bir_pba has the same value as bir_table. With this fix,
"make check SPEED=slow" should work fine again.

Fixes: b4ba67d9a702507793c2724e56f98e9b0f7be02b
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
index 2dcdead..28d576c 100644
--- a/tests/libqos/pci.c
+++ b/tests/libqos/pci.c
@@ -120,6 +120,8 @@ void qpci_msix_enable(QPCIDevice *dev)
     bir_pba = table & PCI_MSIX_FLAGS_BIRMASK;
     if (bir_pba != bir_table) {
         dev->msix_pba_bar = qpci_iomap(dev, bir_pba, NULL);
+    } else {
+        dev->msix_pba_bar = dev->msix_table_bar;
     }
     dev->msix_pba_off = table & ~PCI_MSIX_FLAGS_BIRMASK;
 
@@ -138,8 +140,11 @@ void qpci_msix_disable(QPCIDevice *dev)
     qpci_config_writew(dev, addr + PCI_MSIX_FLAGS,
                                                 val & ~PCI_MSIX_FLAGS_ENABLE);
 
+    if (dev->msix_pba_bar.addr != dev->msix_table_bar.addr) {
+        qpci_iounmap(dev, dev->msix_pba_bar);
+    }
     qpci_iounmap(dev, dev->msix_table_bar);
-    qpci_iounmap(dev, dev->msix_pba_bar);
+
     dev->msix_enabled = 0;
     dev->msix_table_off = 0;
     dev->msix_pba_off = 0;
-- 
1.8.3.1


