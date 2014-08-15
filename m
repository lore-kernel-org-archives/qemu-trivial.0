Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJSv-0000el-JQ
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:30:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSp-0000ZO-32
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSk-0002Q0-Hg
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJSY-0002Co-A2; Fri, 15 Aug 2014 11:30:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EE0F14307D;
	Fri, 15 Aug 2014 19:30:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 458996DF;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17923 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:01 +0400
Message-Id: <1408115711-17836-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/20] don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:30:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qdev-monitor.c      |    2 +-
 qemu-char.c         |    2 +-
 util/qemu-sockets.c |    2 +-
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
1.7.10.4


