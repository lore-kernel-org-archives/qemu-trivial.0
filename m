Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9g6a-0001wA-Ek
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2015 16:56:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z9g6X-0001sH-QT
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 16:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z9g6W-0005D8-P8
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 16:56:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Z9g6Q-0005Bg-G1; Mon, 29 Jun 2015 16:56:30 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id F2330359D51;
	Mon, 29 Jun 2015 20:56:29 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5TKuTfP031377; Mon, 29 Jun 2015 16:56:29 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jun 2015 16:56:26 -0400
Message-Id: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] trivial: remove trailing newline from
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
X-List-Received-Date: Mon, 29 Jun 2015 20:56:38 -0000

Minor cleanup.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/ahci.c      | 2 +-
 hw/vfio/platform.c | 2 +-
 net/tap-linux.c    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index b4b65c1..8478d25 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -885,7 +885,7 @@ static int ahci_populate_sglist(AHCIDevice *ad, QEMUSGList *sglist,
                             prdt_tbl_entry_size(&tbl[i]));
             if (sglist->size > INT32_MAX) {
                 error_report("AHCI Physical Region Descriptor Table describes "
-                             "more than 2 GiB.\n");
+                             "more than 2 GiB.");
                 qemu_sglist_destroy(sglist);
                 r = -1;
                 goto out;
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5c678b9..932d631 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -225,7 +225,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
 
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
2.1.0


