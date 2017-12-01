Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKug1-0007W1-PD
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:25:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufw-0007QC-GV
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufv-0004LR-KD
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKufs-0004Ir-98; Fri, 01 Dec 2017 18:24:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69C3891FC8;
	Fri,  1 Dec 2017 23:24:51 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91EC55D6A3;
	Fri,  1 Dec 2017 23:24:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Date: Fri,  1 Dec 2017 17:24:31 -0600
Message-Id: <20171201232433.25193-6-eblake@redhat.com>
In-Reply-To: <20171201232433.25193-1-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Dec 2017 23:24:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 5/7] tests: Avoid 'do/while(false);
 ' in vhost-user-bridge
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
X-List-Received-Date: Fri, 01 Dec 2017 23:24:59 -0000

Use of a do/while(0) loop as a way to allow break statements in
the middle of execute-once code is unusual.  More typical is
the use of goto for early exits, with a label at the end of
the execute-once code, rather than nesting code in a scope;
however, the comment at the end of the existing code makes this
alternative a bit unpractical.

So, to avoid false positives from a future syntax check about
'while (false);', and to keep the loop form (in case someone
ever does add DONTWAIT support, where they can just as easily
manipulate the initial loop condition or add an if around the
final 'break'), I opted to use the form of a while(1) loop (the
break as an early exit is more idiomatic there), coupled with
a final break preserving the original comment.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/vhost-user-bridge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index d820033a72..e0605a529e 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -283,7 +283,7 @@ vubr_backend_recv_cb(int sock, void *ctx)
         return;
     }

-    do {
+    while (1) {
         struct iovec *sg;
         ssize_t ret, total = 0;
         unsigned int num;
@@ -343,7 +343,9 @@ vubr_backend_recv_cb(int sock, void *ctx)

         free(elem);
         elem = NULL;
-    } while (false); /* could loop if DONTWAIT worked? */
+
+        break;        /* could loop if DONTWAIT worked? */
+    }

     if (mhdr_cnt) {
         mhdr.num_buffers = i;
-- 
2.14.3


