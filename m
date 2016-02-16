Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVnIy-0000it-Nt
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 16:37:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1aVnIw-0000eb-74
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 16:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1aVnIv-0001hB-FQ
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 16:37:06 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:57992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1aVnIr-0001gX-9b; Tue, 16 Feb 2016 16:37:01 -0500
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 22:36:52 +0100
Message-Id: <1455658612-7275-1-git-send-email-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.7.1
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.1.2493963, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.2.16.212717
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-tricore: Fix wrong precedences on
	psw_write
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
X-List-Received-Date: Tue, 16 Feb 2016 21:37:07 -0000

Wrong braces on the restore of the cached TCGv SV and V bit could lead to
a wrong PSW. While at this it removes unnecessary braces for the restore
of the cached TCGv AV and SAV bits.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target-tricore/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-tricore/helper.c b/target-tricore/helper.c
index a8fd418..7d96dad 100644
--- a/target-tricore/helper.c
+++ b/target-tricore/helper.c
@@ -127,9 +127,9 @@ uint32_t psw_read(CPUTriCoreState *env)
 void psw_write(CPUTriCoreState *env, uint32_t val)
 {
     env->PSW_USB_C = (val & MASK_USB_C);
-    env->PSW_USB_V = (val & MASK_USB_V << 1);
-    env->PSW_USB_SV = (val & MASK_USB_SV << 2);
-    env->PSW_USB_AV = ((val & MASK_USB_AV) << 3);
-    env->PSW_USB_SAV = ((val & MASK_USB_SAV) << 4);
+    env->PSW_USB_V = (val & MASK_USB_V) << 1;
+    env->PSW_USB_SV = (val & MASK_USB_SV) << 2;
+    env->PSW_USB_AV = (val & MASK_USB_AV) << 3;
+    env->PSW_USB_SAV = (val & MASK_USB_SAV) << 4;
     env->PSW = val;
 }
-- 
2.7.1


