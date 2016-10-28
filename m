Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c02wD-0002Gc-As
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 04:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c02w7-0002BS-Vm
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 04:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c02w7-0005D7-5w
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 04:54:52 -0400
Received: from [59.151.112.132] (port=10574 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c02w1-00052k-GG; Fri, 28 Oct 2016 04:54:45 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12435202"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2016 16:54:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 66F3C480B69F;
	Fri, 28 Oct 2016 16:54:26 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 28 Oct 2016 16:54:26 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <eblake@redhat.com>, <peter.maydell@linaro.org>, <armbru@redhat.com>,
	<mst@redhat.com>, <thuth@redhat.com>
Date: Fri, 28 Oct 2016 16:56:36 +0800
Message-ID: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 66F3C480B69F.ADA97
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v3] util/mmap-alloc: check parameter before
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
X-List-Received-Date: Fri, 28 Oct 2016 08:54:56 -0000

Also refactor a little bit for readability

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 util/mmap-alloc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5a85aa3..2f55f5e 100644
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
@@ -83,22 +84,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
         return MAP_FAILED;
     }
 
-    ptr += offset;
-    total -= offset;
-
     if (offset > 0) {
-        munmap(ptr - offset, offset);
+        munmap(ptr, offset);
     }
 
     /*
      * Leave a single PROT_NONE page allocated after the RAM block, to serve as
      * a guard page guarding against potential buffer overflows.
      */
+    total -= offset;
     if (total > size + getpagesize()) {
-        munmap(ptr + size + getpagesize(), total - size - getpagesize());
+        munmap(ptr1 + size + getpagesize(), total - size - getpagesize());
     }
 
-    return ptr;
+    return ptr1;
 }
 
 void qemu_ram_munmap(void *ptr, size_t size)
-- 
2.1.0




