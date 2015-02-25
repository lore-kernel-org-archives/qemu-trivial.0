Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVX-0005cf-AH
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVS-0005R9-W0
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVS-0006Ur-7O
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:30 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:35153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVK-0006Qu-Rm; Tue, 24 Feb 2015 23:23:23 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJW53945; Wed, 25 Feb 2015 12:23:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:10 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:32 +0800
Message-ID: <1424838157-5524-7-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 06/11] vhost-scsi: Remove superfluous '\n'
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:32 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/scsi/vhost-scsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index dcb2bc5..54f916e 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -82,7 +82,7 @@ static int vhost_scsi_start(VHostSCSI *s)
     if (abi_version > VHOST_SCSI_ABI_VERSION) {
         error_report("vhost-scsi: The running tcm_vhost kernel abi_version:"
                      " %d is greater than vhost_scsi userspace supports: %d, please"
-                     " upgrade your version of QEMU\n", abi_version,
+                     " upgrade your version of QEMU", abi_version,
                      VHOST_SCSI_ABI_VERSION);
         return -ENOSYS;
     }
@@ -140,7 +140,7 @@ static void vhost_scsi_stop(VHostSCSI *s)
     if (k->set_guest_notifiers) {
         ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
         if (ret < 0) {
-                error_report("vhost guest notifier cleanup failed: %d\n", ret);
+                error_report("vhost guest notifier cleanup failed: %d", ret);
         }
     }
     assert(ret >= 0);
@@ -185,7 +185,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
 
         ret = vhost_scsi_start(s);
         if (ret < 0) {
-            error_report("virtio-scsi: unable to start vhost: %s\n",
+            error_report("virtio-scsi: unable to start vhost: %s",
                          strerror(-ret));
 
             /* There is no userspace virtio-scsi fallback so exit */
-- 
1.7.12.4



