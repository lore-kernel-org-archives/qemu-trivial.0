Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGSCY-0000Oo-Hi
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCS-0000CQ-Fz
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCN-0003GZ-H4
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGSCA-0003E3-UD; Mon, 02 Sep 2013 07:21:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8760A40242;
	Mon,  2 Sep 2013 15:21:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8FF86210;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14635 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:26 +0400
Message-Id: <1378119695-14568-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL 06/15] curl: qemu_bh_new() can never return
	NULL
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
X-List-Received-Date: Mon, 02 Sep 2013 11:21:45 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

Drop error code path which cannot be taken since qemu_bh_new() does not
return NULL.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/curl.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index e566855..ca2cedc 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -572,12 +572,6 @@ static BlockDriverAIOCB *curl_aio_readv(BlockDriverState *bs,
     acb->nb_sectors = nb_sectors;
 
     acb->bh = qemu_bh_new(curl_readv_bh_cb, acb);
-
-    if (!acb->bh) {
-        DPRINTF("CURL: qemu_bh_new failed\n");
-        return NULL;
-    }
-
     qemu_bh_schedule(acb->bh);
     return &acb->common;
 }
-- 
1.7.10.4


