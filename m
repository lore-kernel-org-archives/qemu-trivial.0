Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqME-0006TT-8m
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM7-0006Mr-GQ
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM3-00088O-Q0
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLv-0007lO-0p; Tue, 13 Sep 2016 12:14:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E4DB2416DB;
	Tue, 13 Sep 2016 19:14:26 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 365BDAFB;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: (nullmailer pid 31912 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:53 +0300
Message-Id: <3224e8786fcbe531746f1530c37210c425625213.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/16] timer/cpus: fix some typos and update
 some comments
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:47 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c               | 6 +++---
 include/qemu/timer.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 84c3520..0ab4ab1 100644
--- a/cpus.c
+++ b/cpus.c
@@ -229,7 +229,7 @@ static int64_t cpu_get_clock_locked(void)
     return ticks;
 }
 
-/* return the host CPU monotonic timer and handle stop/restart */
+/* return the host CPU monotonic time */
 int64_t cpu_get_clock(void)
 {
     int64_t ti;
@@ -244,7 +244,7 @@ int64_t cpu_get_clock(void)
 }
 
 /* enable cpu_get_ticks()
- * Caller must hold BQL which server as mutex for vm_clock_seqlock.
+ * Caller must hold BQL which serves as mutex for vm_clock_seqlock.
  */
 void cpu_enable_ticks(void)
 {
@@ -260,7 +260,7 @@ void cpu_enable_ticks(void)
 
 /* disable cpu_get_ticks() : the clock is stopped. You must not call
  * cpu_get_ticks() after that.
- * Caller must hold BQL which server as mutex for vm_clock_seqlock.
+ * Caller must hold BQL which serves as mutex for vm_clock_seqlock.
  */
 void cpu_disable_ticks(void)
 {
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index e6c089e..4bfcd35 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -802,7 +802,7 @@ static inline int64_t get_max_clock_jump(void)
  * Low level clock functions
  */
 
-/* real time host monotonic timer */
+/* get host real time in nanosecond */
 static inline int64_t get_clock_realtime(void)
 {
     struct timeval tv;
-- 
2.1.4


