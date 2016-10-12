Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bu8vs-0005Nw-3P
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 22:06:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1bu8vq-0005MI-MA
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 22:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1bu8vo-0008Je-Ls
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 22:06:09 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:4093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1bu8ve-0008F8-BT; Tue, 11 Oct 2016 22:06:01 -0400
Received: from 172.24.1.136 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DSL02694; Wed, 12 Oct 2016 10:05:23 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 12 Oct 2016 10:05:12 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <herongguang.he@huawei.com>, <mjt@tls.msk.ru>, 
	Gonglei <arei.gonglei@huawei.com>
Date: Wed, 12 Oct 2016 10:05:01 +0800
Message-ID: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: [Qemu-trivial] [PATCH] mmap-alloc: check before use for ptr pointer
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
X-List-Received-Date: Wed, 12 Oct 2016 02:06:11 -0000

If ptr mmap failed, we don't need to do a superfluous
calculation for offset variable by ptr (MAP_FAILED).

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/mmap-alloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5a85aa3..577862b 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -61,13 +61,15 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
 #else
     void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 #endif
-    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
+    size_t offset;
     void *ptr1;
 
     if (ptr == MAP_FAILED) {
         return MAP_FAILED;
     }
 
+    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
+
     /* Make sure align is a power of 2 */
     assert(!(align & (align - 1)));
     /* Always align to host page size */
-- 
1.8.3.1



