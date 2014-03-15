Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSF-0004Ig-Cg
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS8-00045t-PF
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS4-0007BN-Id
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRu-00076I-EA; Sat, 15 Mar 2014 06:04:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0079641D99;
	Sat, 15 Mar 2014 14:04:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 68D0766E;
	Sat, 15 Mar 2014 13:57:05 +0400 (MSK)
Received: (nullmailer pid 20034 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:59 +0400
Message-Id: <1394877419-19949-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/13] FSL eTSEC: Fix typo in rx ring
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
X-List-Received-Date: Sat, 15 Mar 2014 10:04:33 -0000

From: Fabien Chouteau <chouteau@adacore.com>

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/fsl_etsec/rings.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 26b71f6..e36cfbe 100644
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
1.7.10.4


