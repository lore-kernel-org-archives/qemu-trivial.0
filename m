Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csTp9-0004m6-Nj
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2017 08:32:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1csTp5-0004kD-Sa
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 08:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1csTp5-0003IA-1h
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 08:32:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1csTp0-0003GL-8f; Mon, 27 Mar 2017 08:32:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7BA6C04BD5E;
	Mon, 27 Mar 2017 12:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C7BA6C04BD5E
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=stefanha@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C7BA6C04BD5E
Received: from localhost (unknown [10.36.118.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0BD6189E6;
	Mon, 27 Mar 2017 12:32:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-trivial@nongnu.org>, <qemu-block@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 27 Mar 2017 13:32:23 +0100
Message-Id: <20170327123223.1199-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 27 Mar 2017 12:32:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] nbd: drop unused NBDClientSession.is_unix
 field
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
X-List-Received-Date: Mon, 27 Mar 2017 12:32:36 -0000

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nbd-client.h | 2 --
 block/nbd.c        | 2 --
 2 files changed, 4 deletions(-)

diff --git a/block/nbd-client.h b/block/nbd-client.h
index 8cdfc92..891ba44 100644
--- a/block/nbd-client.h
+++ b/block/nbd-client.h
@@ -30,8 +30,6 @@ typedef struct NBDClientSession {
 
     Coroutine *recv_coroutine[MAX_NBD_REQUESTS];
     NBDReply reply;
-
-    bool is_unix;
 } NBDClientSession;
 
 NBDClientSession *nbd_get_client_session(BlockDriverState *bs);
diff --git a/block/nbd.c b/block/nbd.c
index f478f80..1b832c2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -285,8 +285,6 @@ static SocketAddress *nbd_config(BDRVNBDState *s, QDict *options, Error **errp)
         goto done;
     }
 
-    s->client.is_unix = saddr->type == SOCKET_ADDRESS_KIND_UNIX;
-
 done:
     QDECREF(addr);
     qobject_decref(crumpled_addr);
-- 
2.9.3


