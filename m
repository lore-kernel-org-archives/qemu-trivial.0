Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT0RM-0005Es-Qr
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 19:11:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RT0RK-0005Ej-59
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 19:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RT0RI-0002IU-H8
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 19:11:50 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:52070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RT0RI-0002IL-CX
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 19:11:48 -0500
Received: by faas14 with SMTP id s14so1176701faa.4
	for <qemu-trivial@nongnu.org>; Tue, 22 Nov 2011 16:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4bhsv5G5WI2qPtdJgSeAoP5rMg+4Ml0kbnGetI4+tv0=;
	b=ewnIp6r0++0mg7+gNREmUl4bW1eNBL8FI/yyaUXu9u2YMlveAGvT9JMyW2kD9gRbBp
	PWMR/fnl/hUROroM7sFVQ1Q7UvOauEbQ9G+GEVZ7lCHIkd4JkSIrefpyfQoQGC4VqhGi
	0xWJ6taJJ9ViPAXkqfqAZ7xRg3JU921AhTXMQ=
Received: by 10.180.73.130 with SMTP id l2mr21134343wiv.21.1322007104808;
	Tue, 22 Nov 2011 16:11:44 -0800 (PST)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id 6sm5590573wby.22.2011.11.22.16.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 16:11:43 -0800 (PST)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 23 Nov 2011 01:03:15 +0000
Message-Id: <77eaa9e77eb6236511d0fe4f209664c8855f8062.1321302712.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [Qemu-trivial] [PATCH v2] rtl8139: Fix invalid IO access alignment
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
X-List-Received-Date: Wed, 23 Nov 2011 00:11:51 -0000

This patch makes iPXE work with the rtl8139 emulation. The rtl8139
driver in iPXE issues a 16bit access on the ChipCmd register
(offset 0x37) to check the status of the rx buffer. The offset of the
ioport access was getting fixed up to 0x36 in qemu, causing the value
read in iPXE to be invalid.

This fixes an issue with iPXE reporting timeouts during TFTP transfers.

Reposting this here because it is trivial enough and the original post
on qemu-devel didn't attract much attention.

Also, the inw() which was causing the issue has been replaced with an
inb() in upstream iPXE:
https://git.ipxe.org/ipxe.git/commit/91dd64ad25baa27954a7518e73df4fca8a2d0c93

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 hw/rtl8139.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/hw/rtl8139.c b/hw/rtl8139.c
index 4c37993..aa8ed0a 100644
--- a/hw/rtl8139.c
+++ b/hw/rtl8139.c
@@ -1971,7 +1971,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
     cplus_tx_ring_desc += 16 * descriptor;
 
     DPRINTF("+++ C+ mode reading TX descriptor %d from host memory at "
-        "%08x0x%08x = 0x"DMA_ADDR_FMT"\n", descriptor, s->TxAddr[1],
+        "%08x %08x = 0x"DMA_ADDR_FMT"\n", descriptor, s->TxAddr[1],
         s->TxAddr[0], cplus_tx_ring_desc);
 
     uint32_t val, txdw0,txdw1,txbufLO,txbufHI;
@@ -2713,8 +2713,6 @@ static void rtl8139_io_writeb(void *opaque, uint8_t addr, uint32_t val)
 {
     RTL8139State *s = opaque;
 
-    addr &= 0xff;
-
     switch (addr)
     {
         case MAC0 ... MAC0+5:
@@ -2800,8 +2798,6 @@ static void rtl8139_io_writew(void *opaque, uint8_t addr, uint32_t val)
 {
     RTL8139State *s = opaque;
 
-    addr &= 0xfe;
-
     switch (addr)
     {
         case IntrMask:
@@ -2900,8 +2896,6 @@ static void rtl8139_io_writel(void *opaque, uint8_t addr, uint32_t val)
 {
     RTL8139State *s = opaque;
 
-    addr &= 0xfc;
-
     switch (addr)
     {
         case RxMissed:
@@ -2969,8 +2963,6 @@ static uint32_t rtl8139_io_readb(void *opaque, uint8_t addr)
     RTL8139State *s = opaque;
     int ret;
 
-    addr &= 0xff;
-
     switch (addr)
     {
         case MAC0 ... MAC0+5:
@@ -3043,8 +3035,6 @@ static uint32_t rtl8139_io_readw(void *opaque, uint8_t addr)
     RTL8139State *s = opaque;
     uint32_t ret;
 
-    addr &= 0xfe; /* mask lower bit */
-
     switch (addr)
     {
         case IntrMask:
@@ -3120,8 +3110,6 @@ static uint32_t rtl8139_io_readl(void *opaque, uint8_t addr)
     RTL8139State *s = opaque;
     uint32_t ret;
 
-    addr &= 0xfc; /* also mask low 2 bits */
-
     switch (addr)
     {
         case RxMissed:
-- 
Julian Pidancet


