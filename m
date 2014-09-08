Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XQz4V-0005Qs-Ly
	for mharc-qemu-trivial@gnu.org; Mon, 08 Sep 2014 09:33:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1XQx6C-0002Jl-DS
	for qemu-trivial@nongnu.org; Mon, 08 Sep 2014 07:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1XQx67-0003aP-GL
	for qemu-trivial@nongnu.org; Mon, 08 Sep 2014 07:27:08 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:49181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1XQx5x-0003WB-90; Mon, 08 Sep 2014 07:26:53 -0400
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Mon,  8 Sep 2014 13:30:57 +0100
Message-Id: <1410179457-19737-1-git-send-email-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.1.0
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.1.1.2430161, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2014.9.8.111820
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Mon, 08 Sep 2014 09:33:30 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] arch_init: Setting QEMU_ARCH enum straight
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
X-List-Received-Date: Mon, 08 Sep 2014 11:27:14 -0000

Every QEMU_ARCH is now hexadecimal instead of a mixture of decimal and hexadecimal.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 include/sysemu/arch_init.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 8939233..e1ec025 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -5,21 +5,21 @@
 #include "qemu/option.h"
 
 enum {
-    QEMU_ARCH_ALL = -1,
-    QEMU_ARCH_ALPHA = 1,
-    QEMU_ARCH_ARM = 2,
-    QEMU_ARCH_CRIS = 4,
-    QEMU_ARCH_I386 = 8,
-    QEMU_ARCH_M68K = 16,
-    QEMU_ARCH_LM32 = 32,
-    QEMU_ARCH_MICROBLAZE = 64,
-    QEMU_ARCH_MIPS = 128,
-    QEMU_ARCH_PPC = 256,
-    QEMU_ARCH_S390X = 512,
-    QEMU_ARCH_SH4 = 1024,
-    QEMU_ARCH_SPARC = 2048,
-    QEMU_ARCH_XTENSA = 4096,
-    QEMU_ARCH_OPENRISC = 8192,
+    QEMU_ARCH_ALL = -0x1,
+    QEMU_ARCH_ALPHA = 0x1,
+    QEMU_ARCH_ARM = 0x2,
+    QEMU_ARCH_CRIS = 0x4,
+    QEMU_ARCH_I386 = 0x8,
+    QEMU_ARCH_M68K = 0x10,
+    QEMU_ARCH_LM32 = 0x20,
+    QEMU_ARCH_MICROBLAZE = 0x40,
+    QEMU_ARCH_MIPS = 0x80,
+    QEMU_ARCH_PPC = 0x100,
+    QEMU_ARCH_S390X = 0x200,
+    QEMU_ARCH_SH4 = 0x400,
+    QEMU_ARCH_SPARC = 0x800,
+    QEMU_ARCH_XTENSA = 0x1000,
+    QEMU_ARCH_OPENRISC = 0x2000,
     QEMU_ARCH_UNICORE32 = 0x4000,
     QEMU_ARCH_MOXIE = 0x8000,
     QEMU_ARCH_TRICORE = 0x10000,
-- 
2.1.0


