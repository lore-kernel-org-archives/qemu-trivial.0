Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHcr-0001bf-RW
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcm-0001Xv-9U
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcl-0005Nb-AM
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHcg-0005Il-Hj; Sun, 20 May 2018 02:15:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C93F9410E4;
	Sun, 20 May 2018 09:15:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A65281074;
	Sun, 20 May 2018 09:15:11 +0300 (MSK)
Received: (nullmailer pid 7343 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:47 +0300
Message-Id: <1d349821551c2da4dfefe36c6ac17319f33ebbd5.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/22] tcg: fix s/compliment/complement/ typos
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
X-List-Received-Date: Sun, 20 May 2018 06:15:21 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/translate.c | 2 +-
 target/m68k/translate.c | 2 +-
 tcg/README              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index b0f69838f2..7c21814676 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -113,7 +113,7 @@ typedef struct DisasContext {
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
-    int vex_v;  /* vex vvvv register, without 1's compliment.  */
+    int vex_v;  /* vex vvvv register, without 1's complement.  */
     int ss32;   /* 32 bit stack segment */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 44a0ac4e2e..8959e4d0f0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4002,7 +4002,7 @@ DISAS_INSN(bfext_reg)
     TCGv shift;
 
     /* In general, we're going to rotate the field so that it's at the
-       top of the word and then right-shift by the compliment of the
+       top of the word and then right-shift by the complement of the
        width to extend the field.  */
     if (ext & 0x20) {
         /* Variable width.  */
diff --git a/tcg/README b/tcg/README
index a5237a9edb..d22ee084b8 100644
--- a/tcg/README
+++ b/tcg/README
@@ -561,7 +561,7 @@ E.g. VECL=1 -> 64 << 1 -> v128, and VECE=2 -> 1 << 2 -> i32.
 * orc_vec   v0, v1, v2
 * not_vec   v0, v1
 
-  Similarly, logical operations with and without compliment.
+  Similarly, logical operations with and without complement.
   Note that VECE is unused.
 
 * shli_vec   v0, v1, i2
-- 
2.11.0


