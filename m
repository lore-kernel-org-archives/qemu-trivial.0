Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpF2-0003cN-RC
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEw-0003Qy-2D
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEr-0003je-07
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:17 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:25448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEd-0003fK-HL; Mon, 11 Aug 2014 09:02:01 -0400
Received: from 172.24.2.119 (EHLO szxeml418-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BXZ04220; Mon, 11 Aug 2014 21:01:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml418-hub.china.huawei.com
	(10.82.67.157) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 21:01:11 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:57 +0800
Message-ID: <1407762058-11512-8-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 7/8] vl: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:23 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index a8029d5..9783133 100644
--- a/vl.c
+++ b/vl.c
@@ -1154,7 +1154,7 @@ static int drive_init_func(QemuOpts *opts, void *opaque)
 
 static int drive_enable_snapshot(QemuOpts *opts, void *opaque)
 {
-    if (NULL == qemu_opt_get(opts, "snapshot")) {
+    if (qemu_opt_get(opts, "snapshot") == NULL) {
         qemu_opt_set(opts, "snapshot", "on");
     }
     return 0;
@@ -2506,8 +2506,9 @@ static int foreach_device_config(int type, int (*func)(const char *cmdline))
         loc_push_restore(&conf->loc);
         rc = func(conf->cmdline);
         loc_pop(&conf->loc);
-        if (0 != rc)
+        if (rc) {
             return rc;
+        }
     }
     return 0;
 }
-- 
1.7.12.4



