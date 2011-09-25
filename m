Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7uuE-0005kB-Kn
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 16:02:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7uuB-0005ZS-JE
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7uuA-0005fp-L3
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:02:27 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:61297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R7uu8-0005er-4w; Sun, 25 Sep 2011 16:02:24 -0400
Received: by fxh13 with SMTP id 13so5526425fxh.4
	for <multiple recipients>; Sun, 25 Sep 2011 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4u37FzCXG2oWxaZOuZPFhRkyq7AEgY0zTNvkm/DpJi8=;
	b=TsxsqIPiJyMCQP/UoZvY3lUoarda4Ezm4jyPX7humS1f08lcBGgKjIsCwTmv8VeHLx
	Q/u64+1jM1jJJQ2DdfYmSLI9Gz289lo+MtDr6miJ1EzmA4bDr+7GEtsoQzCUCJK5dQ4p
	3gByDFw1yZUZYUf1k5S0BngY4IpwGON1z8cX0=
Received: by 10.223.76.24 with SMTP id a24mr9210236fak.109.1316980942393;
	Sun, 25 Sep 2011 13:02:22 -0700 (PDT)
Received: from localhost.localdomain (ppp95-165-19-215.pppoe.spdop.ru.
	[95.165.19.215])
	by mx.google.com with ESMTPS id g19sm3900547fai.8.2011.09.25.13.02.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 13:02:21 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Sep 2011 00:02:16 +0400
Message-Id: <1316980937-18588-1-git-send-email-antonynpavlov@gmail.com>
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
X-List-Received-Date: Sun, 25 Sep 2011 20:02:29 -0000

The commit fc2bf44972349b078d8310466c3866615500e67f
changed the type of val argument of the function gt64120_writel()
from uint32_t to uint64_t, so we need to change the corresponding
length modifier from '%x' to '%llx'.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/gt64xxx.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gt64xxx.c b/hw/gt64xxx.c
index c7df8c4..1defb6d 100644
--- a/hw/gt64xxx.c
+++ b/hw/gt64xxx.c
@@ -543,19 +543,19 @@ static void gt64120_writel (void *opaque, target_phys_addr_t addr,
         /* not really implemented */
         s->regs[saddr] = ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
         s->regs[saddr] |= !!(s->regs[saddr] & 0xfffffffe);
-        DPRINTF("INTRCAUSE %x\n", val);
+        DPRINTF("INTRCAUSE %" PRIx64 "\n", val);
         break;
     case GT_INTRMASK:
         s->regs[saddr] = val & 0x3c3ffffe;
-        DPRINTF("INTRMASK %x\n", val);
+        DPRINTF("INTRMASK %" PRIx64 "\n", val);
         break;
     case GT_PCI0_ICMASK:
         s->regs[saddr] = val & 0x03fffffe;
-        DPRINTF("ICMASK %x\n", val);
+        DPRINTF("ICMASK %" PRIx64 "\n", val);
         break;
     case GT_PCI0_SERR0MASK:
         s->regs[saddr] = val & 0x0000003f;
-        DPRINTF("SERR0MASK %x\n", val);
+        DPRINTF("SERR0MASK %" PRIx64 "\n", val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
-- 
1.7.5.4


