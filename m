Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CE1-0006jP-0b
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:43:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDy-0006fr-Gf
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDx-0006Td-JY
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CDs-0006Pe-So; Mon, 16 Oct 2017 16:42:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3004540D2D;
	Mon, 16 Oct 2017 23:42:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7B3DCC39;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12336 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:40 +0300
Message-Id: <aa1530dec499f7525d2ccaa0e3a876dc8089ed1e.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/14] filter-mirror: segfault when specifying
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
X-List-Received-Date: Mon, 16 Oct 2017 20:42:59 -0000

From: Eduardo Otubo <otubo@redhat.com>

When using filter-mirror like the example below where the interface
'ndev0' does not exist on the host, QEMU crashes into segmentation
fault.

 $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0

This happens because the function filter_mirror_setup() does not check
if the device actually exists and still keep on processing calling
qemu_chr_find(). This patch fixes this issue.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/filter-mirror.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 90e2c92337..ce0dc23c2a 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -213,6 +213,12 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
     MirrorState *s = FILTER_MIRROR(nf);
     Chardev *chr;
 
+    if (s->outdev == NULL) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "filter-mirror parameter"\
+                  " 'outdev' cannot be empty");
+        return;
+    }
+
     chr = qemu_chr_find(s->outdev);
     if (chr == NULL) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-- 
2.11.0


