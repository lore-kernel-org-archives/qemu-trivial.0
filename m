Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VDv8o-0005lF-6Z
	for mharc-qemu-trivial@gnu.org; Mon, 26 Aug 2013 07:39:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VDv8g-0005b2-PZ
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 07:39:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VDv8a-00069t-Rl
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 07:39:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VDv8N-00066I-TB; Mon, 26 Aug 2013 07:39:00 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7QBcwEU032517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 26 Aug 2013 07:38:58 -0400
Received: from localhost (ovpn-112-23.ams2.redhat.com [10.36.112.23])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7QBctOF005276; Mon, 26 Aug 2013 07:38:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 26 Aug 2013 13:38:50 +0200
Message-Id: <1377517130-12343-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] curl: qemu_bh_new() can never return NULL
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
X-List-Received-Date: Mon, 26 Aug 2013 11:39:24 -0000

Drop error code path which cannot be taken since qemu_bh_new() does not
return NULL.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/curl.c | 6 ------
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
1.8.3.1


