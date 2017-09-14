Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsUWc-00061z-RV
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 09:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dsUWa-0005wm-LQ
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 09:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dsUWV-0007Tt-QE
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 09:49:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dsUWJ-0007GV-Lw; Thu, 14 Sep 2017 09:49:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 589A7C04B310;
	Thu, 14 Sep 2017 13:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 589A7C04B310
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-120-201.rdu2.redhat.com [10.10.120.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDAF16FE47;
	Thu, 14 Sep 2017 13:49:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, lersek@redhat.com, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Date: Thu, 14 Sep 2017 08:49:23 -0500
Message-Id: <20170914134923.2479-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 14 Sep 2017 13:49:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] osdep: Fix ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Thu, 14 Sep 2017 13:49:49 -0000

When using bit-wise operations that exploit the power-of-two
nature of the second argument of ROUND_UP(), we still need to
ensure that the mask is as wide as the first argument (done
by using a ternary to force proper arithmetic promotion).
Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
instead of the intended 2TiB, because negation of an unsigned
32-bit quantity followed by widening to 64-bits does not
sign-extend the mask.

Broken since its introduction in commit 292c8e50 (v1.5.0).
Callers that passed the same width type to both macro parameters,
or that had other code to ensure the first parameter's maximum
runtime value did not exceed the second parameter's width, are
unaffected, but I did not audit to see which (if any) existing
clients of the macro could trigger incorrect behavior (I found
the bug while adding a new use of the macro).

While preparing the patch, checkpatch complained about poor
spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.

CC: qemu-trivial@nongnu.org
CC: qemu-stable@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>

---
v2: use ternary instead of addition of 0 [Laszlo], improve commit message
---
 include/qemu/osdep.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 6855b94bbf..f4ff372d41 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -189,13 +189,13 @@ extern int daemon(int, int);

 /* Round number up to multiple. Requires that d be a power of 2 (see
  * QEMU_ALIGN_UP for a safer but slower version on arbitrary
- * numbers) */
+ * numbers); works even if d is a smaller type than n.  */
 #ifndef ROUND_UP
-#define ROUND_UP(n,d) (((n) + (d) - 1) & -(d))
+#define ROUND_UP(n, d) (((n) + (d) - 1) & -(0 ? (n) : (d)))
 #endif

 #ifndef DIV_ROUND_UP
-#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
+#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 #endif

 /*
-- 
2.13.5


