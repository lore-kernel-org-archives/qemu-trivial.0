Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCXX-0001tJ-RY
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:48:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXR-0001iO-Nq
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXN-0001XW-Dq
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCXD-0001UA-HT; Thu, 27 Mar 2014 11:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4E3314372A;
	Thu, 27 Mar 2014 19:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A7ED0697;
	Thu, 27 Mar 2014 19:28:36 +0400 (MSK)
Received: (nullmailer pid 1792 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:18 +0400
Message-Id: <1395934108-1694-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/23] hw/i386/acpi_build.c: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 15:48:22 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/acpi-build.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7597517..b34d927 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -907,7 +907,7 @@ static void build_pci_bus_end(PCIBus *bus, void *bus_state)
 
             build_append_byte(notify, 0x7B); /* AndOp */
             build_append_byte(notify, 0x68); /* Arg0Op */
-            build_append_int(notify, 0x1 << i);
+            build_append_int(notify, 0x1U << i);
             build_append_byte(notify, 0x00); /* NullName */
             build_append_byte(notify, 0x86); /* NotifyOp */
             build_append_nameseg(notify, "S%.02X_", PCI_DEVFN(i, 0));
-- 
1.7.10.4


