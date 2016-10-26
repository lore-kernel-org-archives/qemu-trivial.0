Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzISU-0007N8-Os
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 03:17:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bzIST-0007Lh-3d
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 03:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bzISS-0002Ez-Af
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 03:17:09 -0400
Received: from [59.151.112.132] (port=16823 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bzISN-0002D8-8S; Wed, 26 Oct 2016 03:17:03 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12332220"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Oct 2016 15:16:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 78A0141B5F4D;
	Wed, 26 Oct 2016 15:16:49 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 26 Oct 2016 15:16:48 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <mst@redhat.com>, <peter.maydell@linaro.org>, <armbru@redhat.com>,
	<gkurz@linux.vnet.ibm.com>, <riel@redhat.com>
Date: Wed, 26 Oct 2016 15:18:54 +0800
Message-ID: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 78A0141B5F4D.AD1E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] util/mmap-alloc: check parameter before using
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
X-List-Received-Date: Wed, 26 Oct 2016 07:17:10 -0000

Also refactor some code hunk for readability

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 util/mmap-alloc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5a85aa3..92c123a 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -41,6 +41,11 @@ size_t qemu_fd_getpagesize(int fd)
 
 void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
 {
+    /* Make sure align is a power of 2 */
+    assert(!(align & (align - 1)));
+    /* Always align to host page size */
+    assert(align >= getpagesize());
+
     /*
      * Note: this always allocates at least one extra page of virtual address
      * space, even if size is already aligned.
@@ -68,11 +73,6 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
         return MAP_FAILED;
     }
 
-    /* Make sure align is a power of 2 */
-    assert(!(align & (align - 1)));
-    /* Always align to host page size */
-    assert(align >= getpagesize());
-
     ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
                 MAP_FIXED |
                 (fd == -1 ? MAP_ANONYMOUS : 0) |
@@ -83,22 +83,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
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




