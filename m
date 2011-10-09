Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RD2lu-0006lu-0Y
	for mharc-qemu-trivial@gnu.org; Sun, 09 Oct 2011 19:27:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RD2lr-0006dT-NR
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2011 19:27:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RD2lq-0003Rj-Ul
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2011 19:27:03 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:41623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1RD2lo-0003RR-Cl; Sun, 09 Oct 2011 19:27:00 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate02.web.de (Postfix) with ESMTP id 5A6201B04B659;
	Mon, 10 Oct 2011 01:26:59 +0200 (CEST)
Received: from [84.148.48.231] (helo=af.site)
	by smtp04.web.de with asmtp (WEB.DE 4.110 #2)
	id 1RD2lm-00057A-00; Mon, 10 Oct 2011 01:26:59 +0200
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Mon, 10 Oct 2011 01:27:01 +0200
Message-Id: <1318202821-19193-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX190mKbu5lZCrnJOgHM16fKsT/u1GM7ELHQ62uXH
	mICftUtKYSyKs7tDg4fRN0yrq02UVzswWbc0JNfefc3I05pTMl
	rTeHjjun1PqIWVkEIIVg==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Paul Brook <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] arm_pic: Fix typo
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
X-List-Received-Date: Sun, 09 Oct 2011 23:27:04 -0000

interrput -> interrupt

Cc: Paul Brook <paul@codesourcery.com>
Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
---
 hw/arm_pic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/arm_pic.c b/hw/arm_pic.c
index 985148a..41f8d3e 100644
--- a/hw/arm_pic.c
+++ b/hw/arm_pic.c
@@ -39,7 +39,7 @@ static void arm_pic_cpu_handler(void *opaque, int irq, =
int level)
             cpu_reset_interrupt(env, CPU_INTERRUPT_FIQ);
         break;
     default:
-        hw_error("arm_pic_cpu_handler: Bad interrput line %d\n", irq);
+        hw_error("arm_pic_cpu_handler: Bad interrupt line %d\n", irq);
     }
 }
=20
--=20
1.7.3.4


