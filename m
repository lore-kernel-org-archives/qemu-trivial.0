Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCub-0000eN-Vf
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:16:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuX-0000SU-OK
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuT-0000y4-C4
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCuO-0000vH-HH; Wed, 04 Mar 2015 12:16:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EADC74089A;
	Wed,  4 Mar 2015 20:16:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DC49E970;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17518 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:34 +0300
Message-Id: <452445ea8a09f73376a7ebe79690ad38bb04b05d.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/47] vhost-scsi: Remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Wed, 04 Mar 2015 17:16:43 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/scsi/vhost-scsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 618b0af..335f442 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -83,7 +83,7 @@ static int vhost_scsi_start(VHostSCSI *s)
     if (abi_version > VHOST_SCSI_ABI_VERSION) {
         error_report("vhost-scsi: The running tcm_vhost kernel abi_version:"
                      " %d is greater than vhost_scsi userspace supports: %d, please"
-                     " upgrade your version of QEMU\n", abi_version,
+                     " upgrade your version of QEMU", abi_version,
                      VHOST_SCSI_ABI_VERSION);
         return -ENOSYS;
     }
@@ -141,7 +141,7 @@ static void vhost_scsi_stop(VHostSCSI *s)
     if (k->set_guest_notifiers) {
         ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
         if (ret < 0) {
-                error_report("vhost guest notifier cleanup failed: %d\n", ret);
+                error_report("vhost guest notifier cleanup failed: %d", ret);
         }
     }
     assert(ret >= 0);
@@ -186,7 +186,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
 
         ret = vhost_scsi_start(s);
         if (ret < 0) {
-            error_report("virtio-scsi: unable to start vhost: %s\n",
+            error_report("virtio-scsi: unable to start vhost: %s",
                          strerror(-ret));
 
             /* There is no userspace virtio-scsi fallback so exit */
-- 
2.1.4


