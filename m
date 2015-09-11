Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiO-0000vM-GY
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiK-0000np-E8
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiJ-0004vE-IO
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiC-0004sB-7N; Fri, 11 Sep 2015 07:41:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 09B234143E;
	Fri, 11 Sep 2015 14:41:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 97086A58;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22776 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:36 +0300
Message-Id: <594fd21102aa7b7dce1509b31944d10836108c6b.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PULL 12/26] trivial: remove trailing newline from
	error_report
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
X-List-Received-Date: Fri, 11 Sep 2015 11:41:57 -0000

From: John Snow <jsnow@redhat.com>

Minor cleanup.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/ahci.c      | 2 +-
 hw/vfio/platform.c | 2 +-
 net/tap-linux.c    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index d83efa4..44f6e27 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -876,7 +876,7 @@ static int ahci_populate_sglist(AHCIDevice *ad, QEMUSGList *sglist,
                                 limit - sglist->size));
             if (sglist->size > INT32_MAX) {
                 error_report("AHCI Physical Region Descriptor Table describes "
-                             "more than 2 GiB.\n");
+                             "more than 2 GiB.");
                 qemu_sglist_destroy(sglist);
                 r = -1;
                 goto out;
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 60365d1..de4ec52 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -234,7 +234,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
 
     ret = event_notifier_test_and_clear(&intp->interrupt);
     if (!ret) {
-        error_report("Error when clearing fd=%d (ret = %d)\n",
+        error_report("Error when clearing fd=%d (ret = %d)",
                      event_notifier_get_fd(&intp->interrupt), ret);
     }
 
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 394f2a6..5bd9d21 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -211,7 +211,7 @@ int tap_fd_set_vnet_le(int fd, int is_le)
         return -errno;
     }
 
-    error_report("TUNSETVNETLE ioctl() failed: %s.\n", strerror(errno));
+    error_report("TUNSETVNETLE ioctl() failed: %s.", strerror(errno));
     abort();
 }
 
@@ -228,7 +228,7 @@ int tap_fd_set_vnet_be(int fd, int is_be)
         return -errno;
     }
 
-    error_report("TUNSETVNETBE ioctl() failed: %s.\n", strerror(errno));
+    error_report("TUNSETVNETBE ioctl() failed: %s.", strerror(errno));
     abort();
 }
 
-- 
2.1.4


