Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVe4C-0001fH-KP
	for mharc-qemu-trivial@gnu.org; Sun, 21 Sep 2014 06:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1XVe45-0001Ws-V6
	for qemu-trivial@nongnu.org; Sun, 21 Sep 2014 06:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1XVe40-0007X5-Tf
	for qemu-trivial@nongnu.org; Sun, 21 Sep 2014 06:08:21 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:47458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1XVe3q-0007Qp-R6; Sun, 21 Sep 2014 06:08:06 -0400
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Sun, 21 Sep 2014 12:07:21 +0100
Message-Id: <1411297641-24062-1-git-send-email-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.1.0
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.1.1.2430161, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2014.9.21.100020
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH v2] arch_init: Setting QEMU_ARCH enum straight
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
X-List-Received-Date: Sun, 21 Sep 2014 10:08:27 -0000

Every QEMU_ARCH is now in (1 << n) notation, instead of a mixture of decimal and hexadecimal.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
v1 -> v2:
    - As Michael suggested it is now in (1 << n) notation.

 include/sysemu/arch_init.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 8939233..42a99bc 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -7,22 +7,22 @@
 enum {
     QEMU_ARCH_ALL = -1,
     QEMU_ARCH_ALPHA = 1,
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
2.1.0


