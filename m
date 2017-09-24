Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEVX-0004z6-M7
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:32:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVS-0004so-Ot
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVR-0000LK-Qg
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEVN-0000Ip-Sq; Sun, 24 Sep 2017 17:32:02 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D791F41C96;
	Mon, 25 Sep 2017 00:31:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8FB4BF7;
	Mon, 25 Sep 2017 00:22:55 +0300 (MSK)
Received: (nullmailer pid 28274 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:35 +0300
Message-Id: <8b1fd84c8da075ed20d1c5284aab458940b8cb04.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/31] filter-mirror: segfault when specifying
 non existent device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 21:32:08 -0000

From: Eduardo Otubo <otubo@redhat.com>

When using filter-mirror like the example below where the interface
'ndev0' does not exist on the host, QEMU crashes into segmentation
fault.

 $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0

This happens because the function filter_mirror_setup() does not checks
if the device actually exists and still keep on processing calling
qemu_chr_find(). This patch fixes this issue.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Reviewed-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/filter-mirror.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 90e2c92337..e18a4b16a0 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -213,14 +213,22 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
     MirrorState *s = FILTER_MIRROR(nf);
     Chardev *chr;
 
+    if (s->outdev == NULL) {
+        goto err;
+    }
+
     chr = qemu_chr_find(s->outdev);
+
     if (chr == NULL) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", s->outdev);
-        return;
+        goto err;
     }
 
     qemu_chr_fe_init(&s->chr_out, chr, errp);
+
+err:
+    error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Device '%s' not found",
+              nf->netdev_id);
+    return;
 }
 
 static void redirector_rs_finalize(SocketReadState *rs)
-- 
2.11.0


