Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXUpa-0008TH-CJ
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 12:31:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXUpX-0008S4-Q6
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 12:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXUpW-0004uk-P9
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 12:31:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30035)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gXUpQ-0004oL-Do; Thu, 13 Dec 2018 12:31:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE5C3C0495A6;
	Thu, 13 Dec 2018 17:31:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7A41019630;
	Thu, 13 Dec 2018 17:31:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 011A2113860E; Thu, 13 Dec 2018 18:31:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 13 Dec 2018 18:31:13 +0100
Message-Id: <20181213173113.11211-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 13 Dec 2018 17:31:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] error: Remove NULL checks on
 error_propagate() calls
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
X-List-Received-Date: Thu, 13 Dec 2018 17:31:25 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Whitespace tidied up manually.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 blockdev.c              | 4 +---
 hw/s390x/s390-pci-bus.c | 4 +---
 qga/commands-posix.c    | 7 ++-----
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 81f95d920b..5f2cbe352d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -992,9 +992,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     blk = blockdev_init(filename, bs_opts, &local_err);
     bs_opts = NULL;
     if (!blk) {
-        if (local_err) {
-            error_propagate(errp, local_err);
-        }
+        error_propagate(errp, local_err);
         goto fail;
     } else {
         assert(!local_err);
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 060ff062bc..98c9d6206a 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -731,9 +731,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
 
     css_register_io_adapters(CSS_IO_ADAPTER_PCI, true, false,
                              S390_ADAPTER_SUPPRESSIBLE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
+    error_propagate(errp, local_err);
 }
 
 static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1877976522..2e719d9b6b 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1573,10 +1573,7 @@ static bool systemd_supports_mode(SuspendMode mode, Error **errp)
         return true;
     }
 
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
-
+    error_propagate(errp, local_err);
     return false;
 }
 
@@ -1782,7 +1779,7 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (!mode_supported) {
         error_setg(errp,
                    "the requested suspend mode is not supported by the guest");
-    } else if (local_err) {
+    } else {
         error_propagate(errp, local_err);
     }
 }
-- 
2.17.2


