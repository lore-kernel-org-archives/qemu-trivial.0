Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJswn-00067l-NL
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2012 17:27:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJsMf-0005QN-F6
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 16:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJsMe-0004gA-K4
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 16:49:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TJsMc-0004eu-BZ; Thu, 04 Oct 2012 16:49:46 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	930547280032; Thu,  4 Oct 2012 22:49:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hdJxFflpDgIH; Thu,  4 Oct 2012 22:49:44 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 40F7D728003B; Thu,  4 Oct 2012 22:49:44 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Thu,  4 Oct 2012 22:49:43 +0200
Message-Id: <1349383783-21392-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paul Brook <paul@codesourcery.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] versatilepb: Use symbolic indices for ARM PIC
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
X-List-Received-Date: Thu, 04 Oct 2012 21:27:09 -0000

It is more readable, and all other code does it like that, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/versatilepb.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/versatilepb.c b/hw/versatilepb.c
index 7a92034..b3f8077 100644
--- a/hw/versatilepb.c
+++ b/hw/versatilepb.c
@@ -211,7 +211,8 @@ static void versatile_init(ram_addr_t ram_size,
 
     cpu_pic = arm_pic_init_cpu(cpu);
     dev = sysbus_create_varargs("pl190", 0x10140000,
-                                cpu_pic[0], cpu_pic[1], NULL);
+                                cpu_pic[ARM_PIC_CPU_IRQ],
+                                cpu_pic[ARM_PIC_CPU_FIQ], NULL);
     for (n = 0; n < 32; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
-- 
1.7.10


