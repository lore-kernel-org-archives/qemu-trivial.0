Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QA6wP-0007dm-3I
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2011 16:45:33 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QA6wM-0007Yz-Le
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2011 16:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QA6wL-0006JN-Im
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2011 16:45:30 -0400
Received: from moutng.kundenserver.de ([212.227.126.171]:61964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QA6wH-0006IQ-3d; Wed, 13 Apr 2011 16:45:25 -0400
Received: from flocke.fritz.box (p54AD9A55.dip.t-dialin.net [84.173.154.85])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0Mddka-1QXI6B2Hbo-00PJ04; Wed, 13 Apr 2011 22:45:23 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QA6wE-000410-Nu; Wed, 13 Apr 2011 22:45:22 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Wed, 13 Apr 2011 22:45:22 +0200
Message-Id: <1302727522-15406-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:63JDjnTooCQE1r7IPY61kuIhZODCZ2LjCOwdkBdYQ3a
	9Aman1Mf5+viMwomWGhuzsUFWTc7Wky6kQjwdBJHbDLJjamcUa
	CCBmYytrU3yX/LXUcphgxwOf/IiYCwV8XDiXnkocP3JC0XULbB
	cl9sFK7yW0S3dtD+3FAkn827g6x8HoDsUKIFhrLc3x8QG6+jms
	NGdbzdsmw/44NFSHfDOTdkAwsdHm3kXjbQjm6BiO+TZo/omdoV S3Z5YO8ix7zAB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.171
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix some typos in comments and documentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Apr 2011 20:45:31 -0000

helpfull -> helpful
usefull -> useful
cotrol -> control

and a grammar fix.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 qemu-options.hx     |    4 ++--
 savevm.c            |    2 +-
 target-arm/helper.c |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ef60730..677c550 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -937,8 +937,8 @@ a lot of bandwidth at the expense of quality.
 Disable adaptive encodings. Adaptive encodings are enabled by default.
 An adaptive encoding will try to detect frequently updated screen regions,
 and send updates in these regions using a lossy encoding (like JPEG).
-This can be really helpfull to save bandwidth when playing videos. Disabling
-adaptive encodings allow to restore the original static behavior of encodings
+This can be really helpful to save bandwidth when playing videos. Disabling
+adaptive encodings allows to restore the original static behavior of encodings
 like Tight.
 
 @end table
diff --git a/savevm.c b/savevm.c
index 03fce62..c1c5467 100644
--- a/savevm.c
+++ b/savevm.c
@@ -1007,7 +1007,7 @@ const VMStateInfo vmstate_info_buffer = {
 };
 
 /* unused buffers: space that was used for some fields that are
-   not usefull anymore */
+   not useful anymore */
 
 static int get_unused_buffer(QEMUFile *f, void *pv, size_t size)
 {
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 9172fc7..a0ec643 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1378,7 +1378,7 @@ void HELPER(set_cp15)(CPUState *env, uint32_t insn, uint32_t val)
             /* This may enable/disable the MMU, so do a TLB flush.  */
             tlb_flush(env, 1);
             break;
-        case 1: /* Auxiliary cotrol register.  */
+        case 1: /* Auxiliary control register.  */
             if (arm_feature(env, ARM_FEATURE_XSCALE)) {
                 env->cp15.c1_xscaleauxcr = val;
                 break;
-- 
1.7.2.5


