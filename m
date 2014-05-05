Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNLr-0005R0-NA
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:10:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLk-0005G9-OO
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLd-0003qx-DC
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNLJ-0003hB-Uf; Mon, 05 May 2014 14:10:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 11FCB40752;
	Mon,  5 May 2014 22:10:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AAFB06B8;
	Mon,  5 May 2014 22:02:08 +0400 (MSK)
Received: (nullmailer pid 24261 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:02:02 +0400
Message-Id: <1399312923-24129-22-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 21/22] docs/memory.txt: Fix document on MMIO
	operations
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
X-List-Received-Date: Mon, 05 May 2014 18:10:54 -0000

From: Fam Zheng <famz@redhat.com>

.impl.valid should be .impl.unaligned and the description needs some
fixes.

.old_portio is removed since commit b40acf99b (ioport: Switch
dispatching to memory core layer).

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/memory.txt       |   10 +++++-----
 include/exec/memory.h |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 22eaec7..5bdbdb3 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -232,8 +232,8 @@ various constraints can be supplied to control how these callbacks are called:
    (in bytes) supported by the *implementation*; other access sizes will be
    emulated using the ones available.  For example a 4-byte write will be
    emulated using four 1-byte writes, if .impl.max_access_size = 1.
- - .impl.valid specifies that the *implementation* only supports unaligned
-   accesses; unaligned accesses will be emulated by two aligned accesses.
- - .old_portio and .old_mmio can be used to ease porting from code using
-   cpu_register_io_memory() and register_ioport().  They should not be used
-   in new code.
+ - .impl.unaligned specifies that the *implementation* supports unaligned
+   accesses; if false, unaligned accesses will be emulated by two aligned
+   accesses.
+ - .old_mmio can be used to ease porting from code using
+   cpu_register_io_memory(). It should not be used in new code.
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c084db2..1d55ad9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -110,7 +110,7 @@ struct MemoryRegionOps {
         /* If true, unaligned accesses are supported.  Otherwise all accesses
          * are converted to (possibly multiple) naturally aligned accesses.
          */
-         bool unaligned;
+        bool unaligned;
     } impl;
 
     /* If .read and .write are not present, old_mmio may be used for
-- 
1.7.10.4


