Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1f-0001FC-Sj
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Y-00011k-1k
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006go-D7
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:00 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:55823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eU-M7; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0MHG1D-1Q2azT2Evz-00E8T8; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002BR-Oa; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:30 +0200
Message-Id: <1304004042-8334-6-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:WX3PZX45BREyN5oSI+599aaQu2FMVS2SoXbGQmjMlJE
	h6whg9nHdKztxefDBCECJxtEYG2/OjixkwQHGljjjgRRtlxI+4
	N4lGMJ6pA+09K/iHiSB4Tx7sbXec64ajofzKCQrBxMwMsq3BJY
	iyxKRoqqsPnmRHI/h1Cu9J00+2ov++SiAdkgQXBiRECTiQ91GF
	txp7JAcBs8Fg+55jWf8ewFlL3gSOFWtUlnbusByrfgS9vuJGoV 3yBsMWBPu1Kjs
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 06/18] Fix typo in comment (embeded ->
	embedded)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:01 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 target-ppc/cpu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 04b1259..e438b17 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -225,7 +225,7 @@ enum {
     /* 970FX specific exceptions                                             */
     POWERPC_EXCP_SOFTP    = 88, /* Soft patch exception                      */
     POWERPC_EXCP_MAINT    = 89, /* Maintenance exception                     */
-    /* Freescale embeded cores specific exceptions                           */
+    /* Freescale embedded cores specific exceptions                          */
     POWERPC_EXCP_MEXTBR   = 90, /* Maskable external breakpoint              */
     POWERPC_EXCP_NMEXTBR  = 91, /* Non maskable external breakpoint          */
     POWERPC_EXCP_ITLBE    = 92, /* Instruction TLB error                     */
-- 
1.7.2.5


