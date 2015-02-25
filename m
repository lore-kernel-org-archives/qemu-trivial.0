Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQYcE-0000SV-NP
	for mharc-qemu-trivial@gnu.org; Wed, 25 Feb 2015 04:50:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YQYcC-0000NN-Kz
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 04:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YQYcB-0003OR-Qn
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 04:50:48 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:38278
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1YQYc6-0003Ng-WF; Wed, 25 Feb 2015 04:50:43 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id C9BCF2CE56C3;
	Wed, 25 Feb 2015 10:50:38 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tqlb1H2vWeXw; Wed, 25 Feb 2015 10:50:38 +0100 (CET)
Received: from localhost.localdomain (unknown [37.161.86.37])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 89C9B2CE55E2;
	Wed, 25 Feb 2015 10:50:36 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 25 Feb 2015 10:50:28 +0100
Message-Id: <1424857828-4411-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: agraf@suse.de
Subject: [Qemu-trivial] [PATCH] Openpic: check that cpu id is within the
	number of cpus
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
X-List-Received-Date: Wed, 25 Feb 2015 09:50:49 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 hw/intc/openpic.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 7d1f3b9..305377d 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1013,7 +1013,7 @@ static void openpic_cpu_write_internal(void *opaque, hwaddr addr,
     DPRINTF("%s: cpu %d addr %#" HWADDR_PRIx " <= 0x%08x\n", __func__, idx,
             addr, val);
 
-    if (idx < 0) {
+    if (idx < 0 || idx >= opp->nb_cpus) {
         return;
     }
 
@@ -1152,7 +1152,7 @@ static uint32_t openpic_cpu_read_internal(void *opaque, hwaddr addr,
     DPRINTF("%s: cpu %d addr %#" HWADDR_PRIx "\n", __func__, idx, addr);
     retval = 0xFFFFFFFF;
 
-    if (idx < 0) {
+    if (idx < 0 || idx >= opp->nb_cpus) {
         return retval;
     }
 
-- 
1.7.9.5


