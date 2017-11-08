Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCTdj-0004Cy-30
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 11:55:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCTdd-00046A-7R
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 11:55:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCTdY-0000pC-KA
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 11:55:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCTdS-0000ll-AP; Wed, 08 Nov 2017 11:55:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4768EC04AC64;
	Wed,  8 Nov 2017 16:55:29 +0000 (UTC)
Received: from red.redhat.com (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8F305D9C6;
	Wed,  8 Nov 2017 16:55:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com,
	Kevin Wolf <kwolf@redhat.com>
Date: Wed,  8 Nov 2017 10:55:19 -0600
Message-Id: <20171108165519.8931-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Nov 2017 16:55:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] coroutine: Fix documentation of
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
X-List-Received-Date: Wed, 08 Nov 2017 16:55:46 -0000

co_sleep_ns() was removed in commit 0b9caf9b, leaving behind a
stale comment.  Update the documentation to match the current
usage of this function.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>

---
v2: instead of just blindly cribbing from Paolo's email, try to incorporate
the feedback given on the wording
---
 include/qemu/coroutine.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 9aff9a735e..10ab50a98c 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -262,8 +262,11 @@ void qemu_co_rwlock_unlock(CoRwlock *lock);
 /**
  * Yield the coroutine for a given duration
  *
- * Behaves similarly to co_sleep_ns(), but the sleeping coroutine will be
- * resumed when using aio_poll().
+ * This function uses timers and hence needs to know the event loop
+ * (#AioContext) to place the timer on.  After the time elapses, the
+ * current coroutine will restart with the same #AioContext it is
+ * currently running in, even if that is different than the timer
+ * context passed to co_aio_sleep_ns().
  */
 void coroutine_fn co_aio_sleep_ns(AioContext *ctx, QEMUClockType type,
                                   int64_t ns);
-- 
2.13.6


