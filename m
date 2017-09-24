Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEfE-0003Hy-3t
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEfB-0003EE-LF
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEfA-0004qG-Nq
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEf2-0004lb-Jp; Sun, 24 Sep 2017 17:42:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E621641C92;
	Mon, 25 Sep 2017 00:41:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 31865B75;
	Mon, 25 Sep 2017 00:22:55 +0300 (MSK)
Received: (nullmailer pid 28290 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:43 +0300
Message-Id: <7ac5511eea4f8ee511cd78e47a92436b0bdb3627.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 25/31] osdep: Fix ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Sun, 24 Sep 2017 21:42:10 -0000

From: Eric Blake <eblake@redhat.com>

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
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/osdep.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 72b75bf044..9dd318a7dd 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -205,13 +205,13 @@ extern int daemon(int, int);
 
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
2.11.0


