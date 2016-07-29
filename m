Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bT5Ut-0003LV-QJ
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2016 06:58:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT5Up-0003Gj-9P
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 06:58:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT5Uo-000814-DA
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 06:58:27 -0400
Received: from [59.151.112.132] (port=6110 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bT5Uh-0007y4-5M; Fri, 29 Jul 2016 06:58:19 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9304769"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 18:58:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A27542B5491;
	Fri, 29 Jul 2016 18:58:04 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 18:58:03 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
	Henderson <rth@twiddle.net>
Date: Fri, 29 Jul 2016 19:05:38 +0800
Message-ID: <1469790338-28990-4-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0A27542B5491.AAFCF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH 3/3] cpus: update comments
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
X-List-Received-Date: Fri, 29 Jul 2016 10:58:30 -0000

The returned value of cpu_get_clock() is plused with the offset,
so it is the time elapsed in virtual machine when vm is active.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 cpus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/cpus.c b/cpus.c
index d534f78..722f503 100644
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
2.1.0




