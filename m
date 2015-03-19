Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWfE-0004gR-Vc
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfB-0004aH-FX
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfA-000337-Hz
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWf1-0002xM-V6; Thu, 19 Mar 2015 05:22:40 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9F25541E4A;
	Thu, 19 Mar 2015 12:22:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9D8E8938;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 323 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:19 +0300
Message-Id: <302cb24addd18213c615dfa57de22dcae4776d2a.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/24] cris: remove unused cris_cond15
	declarations
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
X-List-Received-Date: Thu, 19 Mar 2015 09:22:50 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 disas/cris.c              | 13 +------------
 target-cris/opcode-cris.h | 10 ----------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/disas/cris.c b/disas/cris.c
index 9dfb4e3..e6cff7a 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -1210,21 +1210,10 @@ cris_cc_strings[] =
   "le",
   "a",
   /* This is a placeholder.  In v0, this would be "ext".  In v32, this
-     is "sb".  See cris_conds15.  */
+     is "sb". */
   "wf"
 };
 
-/* Different names and semantics for condition 1111 (0xf).  */
-const struct cris_cond15 cris_cond15s[] =
-{
-  /* FIXME: In what version did condition "ext" disappear?  */
-  {"ext", cris_ver_v0_3},
-  {"wf", cris_ver_v10},
-  {"sb", cris_ver_v32p},
-  {NULL, 0}
-};
-
-
 /*
  * Local variables:
  * eval: (c-set-style "gnu")
diff --git a/target-cris/opcode-cris.h b/target-cris/opcode-cris.h
index 779d4aa..e7ebb98 100644
--- a/target-cris/opcode-cris.h
+++ b/target-cris/opcode-cris.h
@@ -108,16 +108,6 @@ struct cris_support_reg
 };
 extern const struct cris_support_reg cris_support_regs[];
 
-struct cris_cond15
-{
-  /* The name of the condition.  */
-  const char *const name;
-
-  /* What CPU version this condition name applies to.  */
-  enum cris_insn_version_usage applicable_version;
-};
-extern const struct cris_cond15 cris_conds15[];
-
 /* Opcode-dependent constants.  */
 #define AUTOINCR_BIT (0x04)
 
-- 
2.1.4


