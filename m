Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8Qe-0003J4-Ak
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:25:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QY-00036l-4T
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QT-00068j-Jo
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8QJ-00066W-GY; Thu, 11 Dec 2014 13:25:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6E2EA41D47;
	Thu, 11 Dec 2014 21:25:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BA6108C5;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22968 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:55 +0300
Message-Id: <4ad608803c46c0acc09114a2e8352742ffd20b6b.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 07/20] Drop superfluous conditionals around
	qemu_opts_del()
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
X-List-Received-Date: Thu, 11 Dec 2014 18:25:30 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/qdev.c | 4 +---
 qemu-char.c    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 35fd00d..901f289 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1141,9 +1141,7 @@ static void device_finalize(Object *obj)
     NamedGPIOList *ngl, *next;
 
     DeviceState *dev = DEVICE(obj);
-    if (dev->opts) {
-        qemu_opts_del(dev->opts);
-    }
+    qemu_opts_del(dev->opts);
 
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
diff --git a/qemu-char.c b/qemu-char.c
index a8b01da..ef84b53 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3825,9 +3825,7 @@ void qemu_chr_delete(CharDriverState *chr)
     }
     g_free(chr->filename);
     g_free(chr->label);
-    if (chr->opts) {
-        qemu_opts_del(chr->opts);
-    }
+    qemu_opts_del(chr->opts);
     g_free(chr);
 }
 
-- 
2.1.3


