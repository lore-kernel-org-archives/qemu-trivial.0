Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpFH-000426-63
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpF4-0003ff-Ij
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEz-0003oT-PM
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:26 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:65064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEm-0003hJ-Jb; Mon, 11 Aug 2014 09:02:09 -0400
Received: from 172.24.2.119 (EHLO szxeml410-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71219; Mon, 11 Aug 2014 21:01:19 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml410-hub.china.huawei.com
	(10.82.67.137) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 21:01:09 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:55 +0800
Message-ID: <1407762058-11512-6-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 5/8] don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:37 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qdev-monitor.c      | 2 +-
 qemu-char.c         | 2 +-
 util/qemu-sockets.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index f87f3d8..81a4e9b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -694,7 +694,7 @@ void qmp_device_del(const char *id, Error **errp)
     DeviceState *dev;
 
     dev = qdev_find_recursive(sysbus_get_default(), id);
-    if (NULL == dev) {
+    if (!dev) {
         error_set(errp, QERR_DEVICE_NOT_FOUND, id);
         return;
     }
diff --git a/qemu-char.c b/qemu-char.c
index 6964a2d..3dcc39a 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -4121,7 +4121,7 @@ void qmp_chardev_remove(const char *id, Error **errp)
     CharDriverState *chr;
 
     chr = qemu_chr_find(id);
-    if (NULL == chr) {
+    if (chr == NULL) {
         error_setg(errp, "Chardev '%s' not found", id);
         return;
     }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 74cf078..5d38395 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -732,7 +732,7 @@ int unix_connect_opts(QemuOpts *opts, Error **errp,
     ConnectState *connect_state = NULL;
     int sock, rc;
 
-    if (NULL == path) {
+    if (path == NULL) {
         error_setg(errp, "unix connect: no path specified");
         return -1;
     }
-- 
1.7.12.4



