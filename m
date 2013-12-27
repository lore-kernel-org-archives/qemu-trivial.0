Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZY-0002xY-6C
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZS-0002k4-8Q
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZO-0003xh-4I
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003s2-0K; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A433438A0;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E0ED15FE;
	Sat, 28 Dec 2013 02:07:34 +0400 (MSK)
Received: (nullmailer pid 10339 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:20 +0400
Message-Id: <1388182050-10270-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/17] x86: only allow real mode to access
	32bit without LMA
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2013 22:07:58 -0000

From: Alexander Graf <agraf@suse.de>

When we're running in non-64bit mode with qemu-system-x86_64 we can
still end up with virtual addresses that are above the 32bit boundary
if a segment offset is set up.

GNU Hurd does exactly that. It sets the segment offset to 0x80000000 and
puts its EIP value to 0x8xxxxxxx to access low memory.

This doesn't hit us when we enable paging, as there we just mask away the
unused bits. But with real mode, we assume that vaddr == paddr which is
wrong in this case. Real hardware wraps the virtual address around at the
32bit boundary. So let's do the same.

This fixes booting GNU Hurd in qemu-system-x86_64 for me.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/helper.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target-i386/helper.c b/target-i386/helper.c
index 7c196ff..ed965d6 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -531,6 +531,12 @@ int cpu_x86_handle_mmu_fault(CPUX86State *env, target_ulong addr,
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
         pte = addr;
+#ifdef TARGET_X86_64
+        if (!(env->hflags & HF_LMA_MASK)) {
+            /* Without long mode we can only address 32bits in real mode */
+            pte = (uint32_t)pte;
+        }
+#endif
         virt_addr = addr & TARGET_PAGE_MASK;
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         page_size = 4096;
-- 
1.7.10.4


