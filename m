Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOfR-0003Yt-Di
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:12:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfO-0003WB-BD
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfI-0004DA-2P
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:46 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:23239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOfH-0004BG-H5; Tue, 10 Feb 2015 23:12:40 -0500
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHD48401; Wed, 11 Feb 2015 12:12:34 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:24 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:12 +0800
Message-ID: <1423627934-11676-10-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 09/11] tpm: Remove superfluous '\n' around
	error_report()
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
X-List-Received-Date: Wed, 11 Feb 2015 04:12:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/tpm/tpm_passthrough.c | 12 ++++++------
 tpm.c                    |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 2bf3c6f..13ac1d2 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -126,7 +126,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
         if (!tpm_pt->tpm_op_canceled ||
             (tpm_pt->tpm_op_canceled && errno != ECANCELED)) {
             error_report("tpm_passthrough: error while transmitting data "
-                         "to TPM: %s (%i)\n",
+                         "to TPM: %s (%i)",
                          strerror(errno), errno);
         }
         goto err_exit;
@@ -139,14 +139,14 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
         if (!tpm_pt->tpm_op_canceled ||
             (tpm_pt->tpm_op_canceled && errno != ECANCELED)) {
             error_report("tpm_passthrough: error while reading data from "
-                         "TPM: %s (%i)\n",
+                         "TPM: %s (%i)",
                          strerror(errno), errno);
         }
     } else if (ret < sizeof(struct tpm_resp_hdr) ||
                tpm_passthrough_get_size_from_buffer(out) != ret) {
         ret = -1;
         error_report("tpm_passthrough: received invalid response "
-                     "packet from TPM\n");
+                     "packet from TPM");
     }
 
 err_exit:
@@ -282,7 +282,7 @@ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
         if (tpm_pt->cancel_fd >= 0) {
             n = write(tpm_pt->cancel_fd, "-", 1);
             if (n != 1) {
-                error_report("Canceling TPM command failed: %s\n",
+                error_report("Canceling TPM command failed: %s",
                              strerror(errno));
             } else {
                 tpm_pt->tpm_op_canceled = true;
@@ -413,13 +413,13 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
 
     tpm_pt->tpm_fd = qemu_open(tpm_pt->tpm_dev, O_RDWR);
     if (tpm_pt->tpm_fd < 0) {
-        error_report("Cannot access TPM device using '%s': %s\n",
+        error_report("Cannot access TPM device using '%s': %s",
                      tpm_pt->tpm_dev, strerror(errno));
         goto err_free_parameters;
     }
 
     if (tpm_passthrough_test_tpmdev(tpm_pt->tpm_fd)) {
-        error_report("'%s' is not a TPM device.\n",
+        error_report("'%s' is not a TPM device.",
                      tpm_pt->tpm_dev);
         goto err_close_tpmdev;
     }
diff --git a/tpm.c b/tpm.c
index c371023..0541535 100644
--- a/tpm.c
+++ b/tpm.c
@@ -134,7 +134,7 @@ static int configure_tpm(QemuOpts *opts)
     Error *local_err = NULL;
 
     if (!QLIST_EMPTY(&tpm_backends)) {
-        error_report("Only one TPM is allowed.\n");
+        error_report("Only one TPM is allowed.");
         return 1;
     }
 
-- 
1.7.12.4



