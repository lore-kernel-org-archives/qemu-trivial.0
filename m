Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyin-0006yg-6g
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:11:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyih-0006qG-AH
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyic-0006An-L5
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVyiS-00062C-Vj; Mon, 22 Sep 2014 04:11:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DF07D45D0C;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B1C5C702;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: (nullmailer pid 17004 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:17 +0400
Message-Id: <1411373477-16938-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 9/9] arch_init: Setting QEMU_ARCH enum straight
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
X-List-Received-Date: Mon, 22 Sep 2014 08:11:44 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Every QEMU_ARCH is now in (1 << n) notation, instead of a mixture of decimal and hexadecimal.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/sysemu/arch_init.h |   34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 8939233..769ec06 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -6,23 +6,23 @@
 
 enum {
     QEMU_ARCH_ALL = -1,
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
-    QEMU_ARCH_UNICORE32 = 0x4000,
-    QEMU_ARCH_MOXIE = 0x8000,
-    QEMU_ARCH_TRICORE = 0x10000,
+    QEMU_ARCH_ALPHA = (1 << 0),
+    QEMU_ARCH_ARM = (1 << 1),
+    QEMU_ARCH_CRIS = (1 << 2),
+    QEMU_ARCH_I386 = (1 << 3),
+    QEMU_ARCH_M68K = (1 << 4),
+    QEMU_ARCH_LM32 = (1 << 5),
+    QEMU_ARCH_MICROBLAZE = (1 << 6),
+    QEMU_ARCH_MIPS = (1 << 7),
+    QEMU_ARCH_PPC = (1 << 8),
+    QEMU_ARCH_S390X = (1 << 9),
+    QEMU_ARCH_SH4 = (1 << 10),
+    QEMU_ARCH_SPARC = (1 << 11),
+    QEMU_ARCH_XTENSA = (1 << 12),
+    QEMU_ARCH_OPENRISC = (1 << 13),
+    QEMU_ARCH_UNICORE32 = (1 << 14),
+    QEMU_ARCH_MOXIE = (1 << 15),
+    QEMU_ARCH_TRICORE = (1 << 16),
 };
 
 extern const uint32_t arch_type;
-- 
1.7.10.4


