Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6HG-0000wF-KY
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:14:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HE-0000sz-3Q
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HD-0003mH-2T
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk6H7-0003iN-Ma; Wed, 14 Sep 2016 05:14:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0D9FB41859;
	Wed, 14 Sep 2016 12:14:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E9F9CAF3;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17341 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:41 +0300
Message-Id: <5bf6ef20e190cb6189081f9abe7236ebc5836c41.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/27] cpus: rename local variable to
 meaningful one
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
X-List-Received-Date: Wed, 14 Sep 2016 09:14:45 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

The function actually returns monotonic time value in nanosecond,
the "ticks" is not suitable.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 0ab4ab1..a70b536 100644
--- a/cpus.c
+++ b/cpus.c
@@ -219,14 +219,14 @@ int64_t cpu_get_ticks(void)
 
 static int64_t cpu_get_clock_locked(void)
 {
-    int64_t ticks;
+    int64_t time;
 
-    ticks = timers_state.cpu_clock_offset;
+    time = timers_state.cpu_clock_offset;
     if (timers_state.cpu_ticks_enabled) {
-        ticks += get_clock();
+        time += get_clock();
     }
 
-    return ticks;
+    return time;
 }
 
 /* return the host CPU monotonic time */
-- 
2.1.4


