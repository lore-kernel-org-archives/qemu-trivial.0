Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEKjJ-00058t-Mt
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 14:49:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eEKjH-000557-BO
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 14:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eEKjG-0004hs-5K
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 14:49:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eEKj8-0004a4-M4; Mon, 13 Nov 2017 14:49:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80DD8C047B91;
	Mon, 13 Nov 2017 19:49:01 +0000 (UTC)
Received: from red.redhat.com (ovpn-123-105.rdu2.redhat.com [10.10.123.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47867993DD;
	Mon, 13 Nov 2017 19:49:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@virtuozzo.com, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Nov 2017 13:48:57 -0600
Message-Id: <20171113194857.13933-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 Nov 2017 19:49:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.11] nbd/client: Don't hard-disconnect
 on ESHUTDOWN from server
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
X-List-Received-Date: Mon, 13 Nov 2017 19:49:12 -0000

The NBD spec says that a server may fail any transmission request
with ESHUTDOWN when it is apparent that no further request from
the client can be successfully honored.  The client is supposed
to then initiate a soft shutdown (wait for all remaining in-flight
requests to be answered, then send NBD_CMD_DISC).  However, since
qemu's server never uses ESHUTDOWN errors, this code was mostly
untested since its introduction in commit b6f5d3b5.

More recently, I learned that nbdkit as the NBD server is able to
send ESHUTDOWN errors, so I finally tested this code, and noticed
that our client was special-casing ESHUTDOWN to cause a hard
shutdown (immediate disconnect, with no NBD_CMD_DISC), but only
if the server sends this error as a simple reply.  Further
investigation found that commit d2febedb introduced a regression
where structured replies behave differently than simple replies -
but that the structured reply behavior is more in line with the
spec (even if we still lack code in nbd-client.c to properly quit
sending further requests).  So this patch reverts the portion of
b6f5d3b5 that introduced an improper hard-disconnect special-case
at the lower level, and leaves the future enhancement of a nicer
soft-disconnect at the higher level for another day.

CC: qemu-trivial@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/nbd/client.c b/nbd/client.c
index 4e15fc484d..eea236ca06 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -996,15 +996,9 @@ int nbd_receive_reply(QIOChannel *ioc, NBDReply *reply, Error **errp)
         if (ret < 0) {
             break;
         }
-
         trace_nbd_receive_simple_reply(reply->simple.error,
                                        nbd_err_lookup(reply->simple.error),
                                        reply->handle);
-        if (reply->simple.error == NBD_ESHUTDOWN) {
-            /* This works even on mingw which lacks a native ESHUTDOWN */
-            error_setg(errp, "server shutting down");
-            return -EINVAL;
-        }
         break;
     case NBD_STRUCTURED_REPLY_MAGIC:
         ret = nbd_receive_structured_reply_chunk(ioc, &reply->structured, errp);
-- 
2.13.6


