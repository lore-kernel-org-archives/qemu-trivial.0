Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDHO-0004xW-AZ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDHI-0004wW-Q3
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVCut-0005Ds-Cc
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:41:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVCuN-000532-Qr; Tue, 10 Mar 2015 01:40:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9D73041302;
	Tue, 10 Mar 2015 08:40:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7D956722;
	Tue, 10 Mar 2015 08:40:46 +0300 (MSK)
Received: (nullmailer pid 13552 invoked by uid 1000);
	Tue, 10 Mar 2015 05:40:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 08:40:45 +0300
Message-Id: <1425966045-13510-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] cris: remove unused cris_cond15 declarations
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
X-List-Received-Date: Tue, 10 Mar 2015 06:04:33 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/cris.c              | 11 -----------
 target-cris/opcode-cris.h | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/disas/cris.c b/disas/cris.c
index 9dfb4e3..0fc7e54 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -1214,17 +1214,6 @@ cris_cc_strings[] =
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


