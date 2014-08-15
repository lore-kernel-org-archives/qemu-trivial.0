Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJH-0001k4-Er
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ8-0001cp-1p
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ3-0007S0-JF
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIr-0007Id-In; Fri, 15 Aug 2014 11:20:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0CA7E4307C;
	Fri, 15 Aug 2014 19:20:29 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC8586EF;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17927 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:03 +0400
Message-Id: <1408115711-17836-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/20] vl: don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    5 +++--
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
1.7.10.4


