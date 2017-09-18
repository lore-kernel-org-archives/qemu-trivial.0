Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1du3sd-0007yw-N2
	for mharc-qemu-trivial@gnu.org; Mon, 18 Sep 2017 17:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1du3sb-0007xS-FW
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 17:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1du3sa-00021P-Ik
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 17:47:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1du3sT-0001y4-Mm; Mon, 18 Sep 2017 17:46:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C2C215561;
	Mon, 18 Sep 2017 21:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C2C215561
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64D01610B0;
	Mon, 18 Sep 2017 21:46:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Date: Mon, 18 Sep 2017 16:46:49 -0500
Message-Id: <20170918214649.17550-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 18 Sep 2017 21:46:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] nbd-client: Use correct macro
 parenthesization
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
X-List-Received-Date: Mon, 18 Sep 2017 21:47:02 -0000

If 'bs' is a complex expression, we were only casting the front half
rather than the full expression.  Luckily, none of the callers were
passing bad arguments, but it's better to be robust up front.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I plan to take this through my NBD queue, unless it is picked up
by qemu-trivial first...

 block/nbd-client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nbd-client.c b/block/nbd-client.c
index 5f241ecc22..2a528dd217 100644
--- a/block/nbd-client.c
+++ b/block/nbd-client.c
@@ -31,8 +31,8 @@
 #include "qapi/error.h"
 #include "nbd-client.h"

-#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ ((uint64_t)(intptr_t)bs))
-#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ ((uint64_t)(intptr_t)bs))
+#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
+#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))

 static void nbd_recv_coroutines_wake_all(NBDClientSession *s)
 {
-- 
2.13.5


