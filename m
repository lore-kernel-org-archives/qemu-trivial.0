Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYXbT-0004Qm-1I
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 06:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbR-0004NO-KY
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbN-00070j-1V
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:23:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYXb4-0006wQ-47; Thu, 19 Mar 2015 06:22:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 133C141E5B;
	Thu, 19 Mar 2015 13:22:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C053941;
	Thu, 19 Mar 2015 12:05:48 +0300 (MSK)
Received: (nullmailer pid 371 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:41 +0300
Message-Id: <23bf2e76806390bf12798c2234a23c5c8a15c35d.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 23/24] elf-loader: Add missing error handling
	for call of lseek
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
X-List-Received-Date: Thu, 19 Mar 2015 10:23:02 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from Coverity.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/elf_ops.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 16a627b..bd71968 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -315,7 +315,9 @@ static int glue(load_elf, SZ)(const char *name, int fd,
     glue(load_symbols, SZ)(&ehdr, fd, must_swab, clear_lsb);
 
     size = ehdr.e_phnum * sizeof(phdr[0]);
-    lseek(fd, ehdr.e_phoff, SEEK_SET);
+    if (lseek(fd, ehdr.e_phoff, SEEK_SET) != ehdr.e_phoff) {
+        goto fail;
+    }
     phdr = g_malloc0(size);
     if (!phdr)
         goto fail;
-- 
2.1.4


