Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9cM4-00066T-8A
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2015 12:56:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <schlatow@ida.ing.tu-bs.de>) id 1Z9bG4-0005U6-Ei
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 11:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <schlatow@ida.ing.tu-bs.de>) id 1Z9bFz-0003Vp-6b
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 11:46:08 -0400
Received: from bender.ida.ing.tu-bs.de ([134.169.117.232]:35414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <schlatow@ida.ing.tu-bs.de>) id 1Z9bFy-0003Mb-Nv
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 11:46:03 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bender.ida.ing.tu-bs.de (8.14.4/8.14.4) with ESMTP id t5TFjeCg010474
	for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2015 17:45:40 +0200
Authentication-Results: bender.ida.ing.tu-bs.de (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=ida.ing.tu-bs.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ida.ing.tu-bs.de;
	h=content-transfer-encoding:content-type:content-type
	:mime-version:x-mailer:message-id:subject:subject:from:from:date
	:date:received:received; s=ida1; t=1435592734; bh=JuRU2+j6of1ZJj
	LjEvdppQRdvF/7o8ex73DlG+uEG14=; b=rm8Ql1Kp7LYpWns30kJoNy3LMJ6xmQ
	Z8hbtm/6glhyhF4UccKZ4duxQ1L7UVeZGm8XOlIvv1injejO3vQQyXFmilhtroup
	3b0xf+HPhfeenV5N+2Cf7jGtq6VjjL+dcNuNIIFnD88AT565areoJo4ECbVutpM8
	/snG4G9NSfFRI=
X-Virus-Scanned: amavisd-new at ida.ing.tu-bs.de
Received: from bender.ida.ing.tu-bs.de ([127.0.0.1])
	by localhost (bender.ida.ing.tu-bs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YOMyr2cegvCU; Mon, 29 Jun 2015 17:45:34 +0200 (CEST)
Received: from johanness-latitude (dhcp139.event.etc.tu-bs.de [134.169.60.139])
	(authenticated bits=0)
	by bender.ida.ing.tu-bs.de (8.14.4/8.14.4/RX) with ESMTP id
	t5TFjU4G010424
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2015 17:45:30 +0200
Date: Mon, 29 Jun 2015 17:45:41 +0200
From: Johannes Schlatow <schlatow@ida.ing.tu-bs.de>
To: qemu-trivial@nongnu.org
Message-ID: <20150629174541.25e4226c@johanness-latitude>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.28; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 134.169.117.232
X-Mailman-Approved-At: Mon, 29 Jun 2015 12:56:23 -0400
Subject: [Qemu-trivial] [PATCH] Fix Cortex-A9 global timer
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
X-List-Received-Date: Mon, 29 Jun 2015 15:46:09 -0000

The auto increment bit of the timer control register was wrongly
defined.

See Cortex-A9 MPcore Technical Reference Manual, Section 4.4.2.

Signed-off-by: Johannes Schlatow <schlatow@ida.ing.tu-bs.de>
---
 include/hw/timer/a9gtimer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index b88c02a..98d8e0a 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -37,7 +37,7 @@
 #define R_CONTROL_TIMER_ENABLE      (1 << 0)
 #define R_CONTROL_COMP_ENABLE       (1 << 1)
 #define R_CONTROL_IRQ_ENABLE        (1 << 2)
-#define R_CONTROL_AUTO_INCREMENT    (1 << 2)
+#define R_CONTROL_AUTO_INCREMENT    (1 << 3)
 #define R_CONTROL_PRESCALER_SHIFT   8
 #define R_CONTROL_PRESCALER_LEN     8
 #define R_CONTROL_PRESCALER_MASK    (((1 << R_CONTROL_PRESCALER_LEN) - 1) << \
-- 
2.4.2


