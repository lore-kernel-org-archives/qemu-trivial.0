Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7tE9-00076i-Bj
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 14:14:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7tE5-0006tO-Ez
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 14:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7tE4-0005OH-Br
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 14:14:53 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R7tE2-0005Nj-8S; Sun, 25 Sep 2011 14:14:50 -0400
Received: by fxh13 with SMTP id 13so5474248fxh.4
	for <multiple recipients>; Sun, 25 Sep 2011 11:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/CoW9ZLgXXssJmsG9q1ClsVwcdu0onzxE8rKVimD0pU=;
	b=pltuW0Bcs6e70KEvTSCPEsJnygYbQ5hnLX6kNSfmEQU9MLIKjIlcCOzyRr6qGNKwLw
	5iLMC51PDLatd3mZn92Iu1VPtgms0PJpzr24I0p8yCmFH4wJ7YqN2I3DOQzAT+07ZtR/
	fPK2csiGp8jBctdcyrTMmmrZzuNkj3Lv4NjZ4=
Received: by 10.223.97.220 with SMTP id m28mr9190809fan.20.1316974488553;
	Sun, 25 Sep 2011 11:14:48 -0700 (PDT)
Received: from localhost.localdomain (ppp95-165-19-215.pppoe.spdop.ru.
	[95.165.19.215])
	by mx.google.com with ESMTPS id j5sm15530351fac.25.2011.09.25.11.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 11:14:47 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Sep 2011 22:14:42 +0400
Message-Id: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [Qemu-trivial] [PATCH 1/2] gt64xxx.c: fix length modifier in
	DPRINTF format string
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
X-List-Received-Date: Sun, 25 Sep 2011 18:14:54 -0000

The commit fc2bf44972349b078d8310466c3866615500e67f
changed the type of val argument of the function gt64120_writel()
from uint32_t to uint64_t, so we need to change the corresponding
length modifier from '%x' to '%llx'.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/gt64xxx.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gt64xxx.c b/hw/gt64xxx.c
index c7df8c4..0baa320 100644
--- a/hw/gt64xxx.c
+++ b/hw/gt64xxx.c
@@ -543,19 +543,19 @@ static void gt64120_writel (void *opaque, target_phys_addr_t addr,
         /* not really implemented */
         s->regs[saddr] = ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
         s->regs[saddr] |= !!(s->regs[saddr] & 0xfffffffe);
-        DPRINTF("INTRCAUSE %x\n", val);
+        DPRINTF("INTRCAUSE %llx\n", val);
         break;
     case GT_INTRMASK:
         s->regs[saddr] = val & 0x3c3ffffe;
-        DPRINTF("INTRMASK %x\n", val);
+        DPRINTF("INTRMASK %llx\n", val);
         break;
     case GT_PCI0_ICMASK:
         s->regs[saddr] = val & 0x03fffffe;
-        DPRINTF("ICMASK %x\n", val);
+        DPRINTF("ICMASK %llx\n", val);
         break;
     case GT_PCI0_SERR0MASK:
         s->regs[saddr] = val & 0x0000003f;
-        DPRINTF("SERR0MASK %x\n", val);
+        DPRINTF("SERR0MASK %llx\n", val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
-- 
1.7.5.4


