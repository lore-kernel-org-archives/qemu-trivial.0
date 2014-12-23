Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3YCW-0007J0-5C
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 17:45:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YCQ-0007BO-Ca
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YCM-0007pe-3h
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:45:06 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:47684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YCL-0007nb-Un
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:45:02 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Y3Xup-0004gk-Ss; Tue, 23 Dec 2014 22:26:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Dec 2014 22:26:54 +0000
Message-Id: <1419373615-17989-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
References: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/3] translate-all: Mark map_exec() with the
	'unused' attribute
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
X-List-Received-Date: Tue, 23 Dec 2014 22:45:10 -0000

From: SeokYeon Hwang <syeon.hwang@samsung.com>

Mark map_exec() with the 'unused' attribute to avoid '-Wunused-function'
warnings on clang 3.4 or later. This means we don't need to mark it
'inline', which is what we were previously using to suppress the warning
(a trick which only works with gcc, not clang).

Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
[PMM: tweaked comment message a little]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 translate-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index c24cfe8..62b2efa 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -276,14 +276,14 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t retaddr)
 }
 
 #ifdef _WIN32
-static inline void map_exec(void *addr, long size)
+static __attribute__((unused)) void map_exec(void *addr, long size)
 {
     DWORD old_protect;
     VirtualProtect(addr, size,
                    PAGE_EXECUTE_READWRITE, &old_protect);
 }
 #else
-static inline void map_exec(void *addr, long size)
+static __attribute__((unused)) void map_exec(void *addr, long size)
 {
     unsigned long start, end, page_size;
 
-- 
1.9.1


