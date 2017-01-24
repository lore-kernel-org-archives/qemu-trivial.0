Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVykd-0004v0-O5
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:54:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0004rT-8w
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVykZ-0006UT-En
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVykT-0006SN-Sf; Tue, 24 Jan 2017 05:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 60F7942118;
	Tue, 24 Jan 2017 13:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9610856F;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12655 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:27 +0300
Message-Id: <c15c23efebc92bfcf886114d06b8e2a1bc8e48bb.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/31] util/mmap-alloc: refactor a little bit
 for readability
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
X-List-Received-Date: Tue, 24 Jan 2017 10:54:57 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/mmap-alloc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

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
2.1.4


