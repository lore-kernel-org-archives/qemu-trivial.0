Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLSyE-00086Z-Ug
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jul 2016 06:25:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bLSyC-00083z-MG
	for qemu-trivial@nongnu.org; Fri, 08 Jul 2016 06:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bLSyA-0004Qe-M2
	for qemu-trivial@nongnu.org; Fri, 08 Jul 2016 06:25:15 -0400
Received: from [59.151.112.132] (port=13491 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bLSy1-0004Fn-NC; Fri, 08 Jul 2016 06:25:09 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8522348"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jul 2016 18:24:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B35E341C0BBF;
	Fri,  8 Jul 2016 18:24:52 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 8 Jul 2016 18:24:52 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <bonzini@redhat.com>, <crosthwaite.peter@gmail.com>, <rth@twiddle.net>,
	<qemu-trivial@nongnu.org>
Date: Fri, 8 Jul 2016 18:31:37 +0800
Message-ID: <1467973897-13734-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: B35E341C0BBF.AE3F5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] timer/cpus: fix some typos and update some
 comments
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
X-List-Received-Date: Fri, 08 Jul 2016 10:25:18 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 cpus.c               | 6 +++---
 include/qemu/timer.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 84c3520..d4afd93 100644
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
+ * Caller must hold BQL which serve as mutex for vm_clock_seqlock.
  */
 void cpu_enable_ticks(void)
 {
@@ -260,7 +260,7 @@ void cpu_enable_ticks(void)
 
 /* disable cpu_get_ticks() : the clock is stopped. You must not call
  * cpu_get_ticks() after that.
- * Caller must hold BQL which server as mutex for vm_clock_seqlock.
+ * Caller must hold BQL which serve as mutex for vm_clock_seqlock.
  */
 void cpu_disable_ticks(void)
 {
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 7fea97f..930b5d3 100644
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
2.1.0




