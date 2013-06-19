Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpPcQ-0007Rs-NO
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 17:08:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UpPcO-0007PA-IL
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 17:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UpPcN-0006cu-JT
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 17:08:40 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38565
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UpPcK-0006b7-Tw; Wed, 19 Jun 2013 17:08:37 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E92A2181736; Wed, 19 Jun 2013 23:08:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 19 Jun 2013 23:08:29 +0200
Message-Id: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] pseries: Fix compiler warning (conversion of
	pointer to integral value)
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
X-List-Received-Date: Wed, 19 Jun 2013 21:08:42 -0000

This kind of type cast must use uintptr_t or target_ulong to be portable
for hosts with sizeof(void *) != sizeof(long).

Here the value is assigned to a variable of type target_ulong.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ppc/spapr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 218ea23..6e6f6a5 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -670,7 +670,7 @@ static void spapr_cpu_reset(void *opaque)
     env->external_htab = spapr->htab;
     env->htab_base = -1;
     env->htab_mask = HTAB_SIZE(spapr) - 1;
-    env->spr[SPR_SDR1] = (unsigned long)spapr->htab |
+    env->spr[SPR_SDR1] = (target_ulong)spapr->htab |
         (spapr->htab_shift - 18);
 }
 
-- 
1.7.10.4


