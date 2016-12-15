Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cHXZY-00029P-E6
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2016 10:03:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>) id 1cHTr9-0002BO-5O
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2016 06:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>) id 1cHTr5-0007Vk-6I
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2016 06:05:47 -0500
Received: from nmsh4.e.nsc.no ([193.213.121.75]:35108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>)
	id 1cHTr4-0007RI-Pm; Thu, 15 Dec 2016 06:05:43 -0500
Received: from ncopa-desktop.copa.dup.pw (15.63.200.37.customer.cdi.no
	[37.200.63.15])
	by nmsh4.nsc.no (8.14.7/8.14.7) with ESMTP id uBFB5PUq001603;
	Thu, 15 Dec 2016 12:05:28 +0100 (MET)
From: Natanael Copa <ncopa@alpinelinux.org>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-trivial@nongnu.org,
	Natanael Copa <ncopa@alpinelinux.org>
Date: Thu, 15 Dec 2016 12:04:59 +0100
Message-Id: <20161215110459.27985-1-ncopa@alpinelinux.org>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 193.213.121.75
X-Mailman-Approved-At: Thu, 15 Dec 2016 10:03:50 -0500
Subject: [Qemu-trivial] [PATCH] linux-user: fix build with musl on aarch64
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
X-List-Received-Date: Thu, 15 Dec 2016 11:05:48 -0000

Use the standard uint64_t instead of internal __u64.

This fixes compiler error with musl libc on aarch64:
.../qemu-2.7.0/linux-user/host/aarch64/hostdep.h:28:5:
error: unknown type name '__u64'
     __u64 *pcreg = &uc->uc_mcontext.pc;
     ^~~~~

Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
---
 linux-user/host/aarch64/hostdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
index 64f75cef49..6fd6e36b2a 100644
--- a/linux-user/host/aarch64/hostdep.h
+++ b/linux-user/host/aarch64/hostdep.h
@@ -25,7 +25,7 @@ extern char safe_syscall_end[];
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
     struct ucontext *uc = puc;
-    __u64 *pcreg = &uc->uc_mcontext.pc;
+    uint64_t *pcreg = &uc->uc_mcontext.pc;
 
     if (*pcreg > (uintptr_t)safe_syscall_start
         && *pcreg < (uintptr_t)safe_syscall_end) {
-- 
2.11.0


