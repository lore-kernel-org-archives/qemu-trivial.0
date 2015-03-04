Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHh-0002BM-SD
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHf-00027k-KM
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHe-0008RW-Uj
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHM-0008LG-Nn; Wed, 04 Mar 2015 16:56:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 581AD4095F;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8E9B797A;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17542 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:46 +0300
Message-Id: <23c071d0c2d50e30b2aa5e3870e78db03ee8d968.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 29/47] nbd: fix resource leak
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
X-List-Received-Date: Wed, 04 Mar 2015 21:56:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 697c021..6634a69 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -274,6 +274,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      */
     sock = nbd_establish_connection(bs, errp);
     if (sock < 0) {
+        g_free(export);
         return sock;
     }
 
-- 
2.1.4


