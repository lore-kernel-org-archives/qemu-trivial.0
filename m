Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWoCY-0005Up-2J
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 11:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWoCV-0005RL-RR
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 11:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWoCU-00020Z-TJ
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 11:42:07 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YWoCT-000200-1y; Sat, 14 Mar 2015 11:42:05 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E6A0317F713; Sat, 14 Mar 2015 16:42:01 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 14 Mar 2015 16:42:01 +0100
Message-Id: <1426347721-8349-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] elf-loader: Add missing error handling for
	call of lseek
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
X-List-Received-Date: Sat, 14 Mar 2015 15:42:08 -0000

This fixes a warning from Coverity.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/hw/elf_ops.h |    4 +++-
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
1.7.10.4


