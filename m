Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1voO-00049t-5a
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 09:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1voL-000487-RH
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1voL-0003pE-4v
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:42:37 -0400
Received: from [59.151.112.132] (port=43030 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c1voE-0003iX-EJ; Wed, 02 Nov 2016 09:42:31 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12601527"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Nov 2016 21:42:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 60C7D43972CE;
	Wed,  2 Nov 2016 21:42:23 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 2 Nov 2016 21:42:22 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <peter.maydell@linaro.org>, <eblake@redhat.com>,
	<armbru@redhat.com>, <mst@redhat.com>
Date: Wed, 2 Nov 2016 21:44:47 +0800
Message-ID: <1478094287-15009-3-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 60C7D43972CE.ABC0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v4 2/2] util/mmap-alloc: refactor a little
 bit for readability
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
X-List-Received-Date: Wed, 02 Nov 2016 13:42:38 -0000

1st mmap returns *ptr* which aligns to host page size,

    |             size + align               |
    ------------------------------------------
 ptr

input param *align* could be 1M, or 2M, or host page size. After
QEMU_ALIGN_UP, offset will >= 0

2nd mmap use flag MAP_FIXED, then it return ptr+offset, or else fail.
If it success, then we will have something like:

    | offset |          size             |
    --------------------------------------
 ptr      ptr1

*ptr1* is what we really want to return, it equals ptr+offset.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 util/mmap-alloc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

This one may be controversial, take it or not as you will:)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index d713a72..2f55f5e 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -84,22 +84,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
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




