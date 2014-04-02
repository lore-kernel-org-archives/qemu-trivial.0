Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVMUD-0006BE-K7
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 10:49:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WVMU8-00063k-7z
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WVMU3-00068s-Hf
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:49:48 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:36778
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WVMTt-000667-DA; Wed, 02 Apr 2014 10:49:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 8C937272002C;
	Wed,  2 Apr 2014 16:49:31 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XWhD5GCY8R7; Wed,  2 Apr 2014 16:49:31 +0200 (CEST)
Received: from lanoue.act-europe.fr (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 515462720016;
	Wed,  2 Apr 2014 16:49:31 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  2 Apr 2014 16:49:32 +0200
Message-Id: <1396450172-31322-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: peter.maydell@linaro.org, agraf@suse.de, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] Fix typo in eTSEC Ethernet controller
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
X-List-Received-Date: Wed, 02 Apr 2014 14:49:52 -0000

IRQ are lowered when ievent bit is cleared, so irq_pulse makes no sense
here...

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 hw/net/fsl_etsec/rings.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index e36cfbe..d4a494f 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -159,7 +159,7 @@ static void ievent_set(eTSEC    *etsec,
 
     if ((flags & IEVENT_RXB && etsec->regs[IMASK].value & IMASK_RXBEN)
         || (flags & IEVENT_RXF && etsec->regs[IMASK].value & IMASK_RXFEN)) {
-        qemu_irq_pulse(etsec->rx_irq);
+        qemu_irq_raise(etsec->rx_irq);
         RING_DEBUG("%s Raise Rx IRQ\n", __func__);
     }
 }
-- 
1.7.9.5


