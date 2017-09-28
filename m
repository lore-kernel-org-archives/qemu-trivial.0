Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxeG2-0006Y8-Lz
	for mharc-qemu-trivial@gnu.org; Thu, 28 Sep 2017 15:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dxeFx-0006V8-O8
	for qemu-trivial@nongnu.org; Thu, 28 Sep 2017 15:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dxeFr-0002TO-Sy
	for qemu-trivial@nongnu.org; Thu, 28 Sep 2017 15:13:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dxeFe-0002PO-2Y; Thu, 28 Sep 2017 15:13:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89872C2D0D47;
	Thu, 28 Sep 2017 19:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 89872C2D0D47
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 703FA17BAF;
	Thu, 28 Sep 2017 19:13:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block I/O path)
Date: Thu, 28 Sep 2017 14:13:25 -0500
Message-Id: <20170928191325.30253-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 28 Sep 2017 19:13:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block: Typo fix in copy_on_readv()
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2017 19:14:01 -0000

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index c02c4c9c20..38c55d1c8a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -953,7 +953,7 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     /* FIXME We cannot require callers to have write permissions when all they
      * are doing is a read request. If we did things right, write permissions
      * would be obtained anyway, but internally by the copy-on-read code. As
-     * long as it is implemented here rather than in a separat filter driver,
+     * long as it is implemented here rather than in a separate filter driver,
      * the copy-on-read code doesn't have its own BdrvChild, however, for which
      * it could request permissions. Therefore we have to bypass the permission
      * system for the moment. */
-- 
2.13.5


