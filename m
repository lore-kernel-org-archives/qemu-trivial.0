Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCCUq-00078M-WC
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 17:37:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCCUo-000779-FH
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 17:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCCUn-0003o1-Pp
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 17:37:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCCUh-0003lo-GQ; Tue, 07 Nov 2017 17:37:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E2697EAA0;
	Tue,  7 Nov 2017 22:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6E2697EAA0
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70A0C60BE3;
	Tue,  7 Nov 2017 22:37:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Date: Tue,  7 Nov 2017 16:37:08 -0600
Message-Id: <20171107223708.17935-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 07 Nov 2017 22:37:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] coroutine: Fix documentation of
 co_aio_sleep_ns()
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
X-List-Received-Date: Tue, 07 Nov 2017 22:37:27 -0000

co_sleep_ns() was removed in commit 0b9caf9b, leaving behind a
stale comment.  Update the documentation to match the current
usage of this function.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/coroutine.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 9aff9a735e..01ae415767 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -262,8 +262,11 @@ void qemu_co_rwlock_unlock(CoRwlock *lock);
 /**
  * Yield the coroutine for a given duration
  *
- * Behaves similarly to co_sleep_ns(), but the sleeping coroutine will be
- * resumed when using aio_poll().
+ * This function uses timers and hence needs to know the event loop
+ * (#AioContext) to place the timer on.  In any case, co_aio_sleep_ns()
+ * does not affect the #AioContext where the current coroutine is running,
+ * as the coroutine will restart on the same #AioContext that it is
+ * running on.
  */
 void coroutine_fn co_aio_sleep_ns(AioContext *ctx, QEMUClockType type,
                                   int64_t ns);
-- 
2.13.6


