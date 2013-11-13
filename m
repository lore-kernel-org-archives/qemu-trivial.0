Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaNl-0001Sz-ML
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:21:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNd-0001C8-A4
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNY-0005Pt-DG
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaNL-0005NU-GA; Wed, 13 Nov 2013 08:20:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 21BB84175F;
	Wed, 13 Nov 2013 17:20:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2726953A;
	Wed, 13 Nov 2013 17:01:26 +0400 (MSK)
Received: (nullmailer pid 16048 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:12 +0400
Message-Id: <1384347680-15976-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 08/16] pci-assign: Fix error_report of
	pci-stub message
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
X-List-Received-Date: Wed, 13 Nov 2013 13:21:18 -0000

From: Cole Robinson <crobinso@redhat.com>

Using multiple calls to error_report here means every line is
prefaced with the (potentially long) pci-assign command line
arguments.

Use a single error_printf to preserve the intended formatting.
Since this code path is always preceded by an error_report call,
we don't lose the command line reporting.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/kvm/pci-assign.c |   36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index 011764f..aae4309 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -791,26 +791,22 @@ static void assign_failed_examine(AssignedDevice *dev)
         goto fail;
     }
 
-    error_report("*** The driver '%s' is occupying your device "
-                 "%04x:%02x:%02x.%x.",
-                 ns, dev->host.domain, dev->host.bus, dev->host.slot,
-                 dev->host.function);
-    error_report("***");
-    error_report("*** You can try the following commands to free it:");
-    error_report("***");
-    error_report("*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/"
-                 "new_id", vendor_id, device_id);
-    error_report("*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
-                 "%s/unbind",
-                 dev->host.domain, dev->host.bus, dev->host.slot,
-                 dev->host.function, ns);
-    error_report("*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
-                 "pci-stub/bind",
-                 dev->host.domain, dev->host.bus, dev->host.slot,
-                 dev->host.function);
-    error_report("*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub"
-                 "/remove_id", vendor_id, device_id);
-    error_report("***");
+    error_printf("*** The driver '%s' is occupying your device "
+        "%04x:%02x:%02x.%x.\n"
+        "***\n"
+        "*** You can try the following commands to free it:\n"
+        "***\n"
+        "*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/new_id\n"
+        "*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/%s/unbind\n"
+        "*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
+        "pci-stub/bind\n"
+        "*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/remove_id\n"
+        "***",
+        ns, dev->host.domain, dev->host.bus, dev->host.slot,
+        dev->host.function, vendor_id, device_id,
+        dev->host.domain, dev->host.bus, dev->host.slot, dev->host.function,
+        ns, dev->host.domain, dev->host.bus, dev->host.slot,
+        dev->host.function, vendor_id, device_id);
 
     return;
 
-- 
1.7.10.4


