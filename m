Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQYRz-0006ML-3p
	for mharc-qemu-trivial@gnu.org; Wed, 25 Feb 2015 04:40:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YQYRv-0006DZ-Cp
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 04:40:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YQYRp-0000Ep-Mv
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 04:40:11 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:37466
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1YQYRl-0008WP-4n; Wed, 25 Feb 2015 04:40:01 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A5F392CE552C;
	Wed, 25 Feb 2015 10:39:48 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCT6hqfrrZIp; Wed, 25 Feb 2015 10:39:48 +0100 (CET)
Received: from localhost.localdomain (unknown [37.161.86.37])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id CB7C12CE5528;
	Wed, 25 Feb 2015 10:39:45 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 25 Feb 2015 10:39:25 +0100
Message-Id: <1424857165-26277-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: Tristan Gingold <gingold@adacore.com>, agraf@suse.de
Subject: [Qemu-trivial] [PATCH] [POWERPC] display cpu id dump state
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
X-List-Received-Date: Wed, 25 Feb 2015 09:40:14 -0000

From: Tristan Gingold <gingold@adacore.com>


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 target-ppc/translate.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index 88c18e3..2a78e99 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -11214,8 +11214,9 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
     int i;
 
     cpu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
-                TARGET_FMT_lx " XER " TARGET_FMT_lx "\n",
-                env->nip, env->lr, env->ctr, cpu_read_xer(env));
+                TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
+                env->nip, env->lr, env->ctr, cpu_read_xer(env),
+                cs->cpu_index);
     cpu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
                 TARGET_FMT_lx " idx %d\n", env->msr, env->spr[SPR_HID0],
                 env->hflags, env->mmu_idx);
-- 
1.7.9.5


