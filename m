Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1erL3G-0002Pj-An
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2018 05:03:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1erL39-0002KQ-E0
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 05:03:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1erL34-0002IV-Jl
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 05:02:55 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:59058
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1erL2t-000241-LT; Thu, 01 Mar 2018 05:02:39 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id B78AD8139B;
	Thu,  1 Mar 2018 11:02:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwg_uIcJRKcg; Thu,  1 Mar 2018 11:02:36 +0100 (CET)
Received: from localhost.localdomain (unknown [46.218.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 90C4A8139A;
	Thu,  1 Mar 2018 11:02:35 +0100 (CET)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Cc: jcd@tribudubois.net, chouteau@adacore.com, mark.cave-ayland@ilande.co.uk,
	qemu-trivial@nongnu.org, frederic.konrad@adacore.com
Date: Thu,  1 Mar 2018 11:02:16 +0100
Message-Id: <1519898536-19027-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: [Qemu-trivial] [PATCH] grlib_apbuart: always enable tx and rx
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 10:03:01 -0000

We often use a bootloader for this board. So lets set the uart in a state
which it can emit characters as if we were using a bootloader.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 hw/char/grlib_apbuart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index bac11be..a8020ea 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -265,8 +265,8 @@ static void grlib_apbuart_reset(DeviceState *d)
 
     /* Transmitter FIFO and shift registers are always empty in QEMU */
     uart->status =  UART_TRANSMIT_FIFO_EMPTY | UART_TRANSMIT_SHIFT_EMPTY;
-    /* Everything is off */
-    uart->control = 0;
+    /* Enable Tx and Rx as the bootloader would do */
+    uart->control = UART_RECEIVE_ENABLE | UART_TRANSMIT_ENABLE;
     /* Flush receive FIFO */
     uart->len = 0;
     uart->current = 0;
-- 
1.8.3.1


