Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxob-0001o6-Tg
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoZ-0001l4-Jw
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoV-0005kl-TX
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005iT-7o; Tue, 24 Jan 2017 04:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 106C842106;
	Tue, 24 Jan 2017 12:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B229558F;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12653 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:26 +0300
Message-Id: <693cd2e4aaa0c4c642f363a4915d1584aeadd88b.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/31] util/mmap-alloc: check parameter before
 using
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
X-List-Received-Date: Tue, 24 Jan 2017 09:55:00 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/mmap-alloc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5a85aa3..d713a72 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
+#include "qemu/host-utils.h"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -61,18 +62,18 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
 #else
     void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 #endif
-    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
+    size_t offset;
     void *ptr1;
 
     if (ptr == MAP_FAILED) {
         return MAP_FAILED;
     }
 
-    /* Make sure align is a power of 2 */
-    assert(!(align & (align - 1)));
+    assert(is_power_of_2(align));
     /* Always align to host page size */
     assert(align >= getpagesize());
 
+    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
     ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
                 MAP_FIXED |
                 (fd == -1 ? MAP_ANONYMOUS : 0) |
-- 
2.1.4


