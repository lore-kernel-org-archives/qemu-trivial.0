Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5eZ-0008ST-9q
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eU-0008Mj-6l
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eT-0006u4-8x
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5eO-0006rY-Kh; Wed, 14 Sep 2016 04:34:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F9604184B;
	Wed, 14 Sep 2016 11:34:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6E221AEB;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17343 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:42 +0300
Message-Id: <22615ae878f8b923f5325bb13af83897f5452898.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/27] cpus: update comments
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
X-List-Received-Date: Wed, 14 Sep 2016 08:34:43 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

The returned value of cpu_get_clock() is plused with the offset,
so it is the time elapsed in virtual machine when vm is active.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/cpus.c b/cpus.c
index a70b536..5d5e374 100644
--- a/cpus.c
+++ b/cpus.c
@@ -191,7 +191,7 @@ int64_t cpu_icount_to_ns(int64_t icount)
     return icount << icount_time_shift;
 }
 
-/* return the host CPU cycle counter and handle stop/restart */
+/* return the host CPU cycle counter */
 /* Caller must hold the BQL */
 int64_t cpu_get_ticks(void)
 {
@@ -229,7 +229,8 @@ static int64_t cpu_get_clock_locked(void)
     return time;
 }
 
-/* return the host CPU monotonic time */
+/* Return the monotonic time elapsed in VM, i.e.,
+ * the time between vm_start and vm_stop */
 int64_t cpu_get_clock(void)
 {
     int64_t ti;
-- 
2.1.4


