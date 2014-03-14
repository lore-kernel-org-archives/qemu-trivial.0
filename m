Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOVL4-0002Vs-1j
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:52:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WOVKv-0002MV-R3
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WOVKr-00045u-Bg
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:51:57 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:46379
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WOVKi-00043I-6M; Fri, 14 Mar 2014 12:51:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 3CFE027031B1;
	Fri, 14 Mar 2014 17:51:43 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3mvfXfxL3nR; Fri, 14 Mar 2014 17:51:43 +0100 (CET)
Received: from lanoue.act-europe.fr (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 2051F27030A3;
	Fri, 14 Mar 2014 17:51:43 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 14 Mar 2014 17:51:41 +0100
Message-Id: <1394815901-7153-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: peter.maydell@linaro.org, agraf@suse.de, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] FSL eTSEC: Fix typo in rx ring
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
X-List-Received-Date: Fri, 14 Mar 2014 16:52:02 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 hw/net/fsl_etsec/rings.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 7760272..31e6f58 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -592,7 +592,7 @@ void etsec_walk_rx_ring(eTSEC *etsec, int ring_nbr)
 
                 /* TODO: Broadcast and Multicast */
 
-                if (bd.flags | BD_INTERRUPT) {
+                if (bd.flags & BD_INTERRUPT) {
                     /* Set RXFx */
                     etsec->regs[RSTAT].value |= 1 << (7 - ring_nbr);
 
@@ -601,7 +601,7 @@ void etsec_walk_rx_ring(eTSEC *etsec, int ring_nbr)
                 }
 
             } else {
-                if (bd.flags | BD_INTERRUPT) {
+                if (bd.flags & BD_INTERRUPT) {
                     /* Set IEVENT */
                     ievent_set(etsec, IEVENT_RXB);
                 }
-- 
1.7.9.5


