Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qaeyr-0005YD-VS
	for mharc-qemu-trivial@gnu.org; Sat, 25 Jun 2011 22:21:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1Qaeym-0005Wt-In
	for qemu-trivial@nongnu.org; Sat, 25 Jun 2011 22:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1Qaeyj-0000Rr-Pa
	for qemu-trivial@nongnu.org; Sat, 25 Jun 2011 22:21:44 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:47333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>)
	id 1Qaeye-0000RJ-52; Sat, 25 Jun 2011 22:21:36 -0400
Received: by qyk10 with SMTP id 10so1004432qyk.4
	for <multiple recipients>; Sat, 25 Jun 2011 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=TTKRpiVfvO/GwSRCefaCjcDeltk3/2FADjpRc5Yixqw=;
	b=Dr5rNMvbstipMfyvCuV5kbgfHgq2nwBXTd6WBvOYCQWuy4TWqhdGT25159mLpmySSR
	x/ey0KLoPSreBWT8U9vLBJbLUOY4jP2XyGE/ZixCiOAnLFs50rcD4sJXP3Z2hCRxbjzD
	HLeJSGHqUJPauxfIZBg6GhdYH1+LaHH89jwmo=
MIME-Version: 1.0
Received: by 10.224.218.7 with SMTP id ho7mr3596610qab.39.1309054895161; Sat,
	25 Jun 2011 19:21:35 -0700 (PDT)
Received: by 10.224.11.20 with HTTP; Sat, 25 Jun 2011 19:21:35 -0700 (PDT)
Date: Sun, 26 Jun 2011 12:21:35 +1000
Message-ID: <BANLkTinRT1a-r7uDJBxu9E7J1MZV7Rq4Lg@mail.gmail.com>
From: Matthew Fernandez <matthew.fernandez@gmail.com>
To: qemu-devel Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Correct spelling of licensed
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
X-List-Received-Date: Sun, 26 Jun 2011 02:21:47 -0000

Correct typos of "licenced" to "licensed".

Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
----
...
On 24 June 2011 00:42, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 23.06.2011 10:08, schrieb Matthew Fernandez:
>> would you mind sending a patch which fixes all other "licenced", too?
>> There are 65 files which contain this spelling :-)
>>
>> Cheers,
>> Stefan W.
>>
> No problem. Are there any objections to this being a single patch? Don't
> really fancy sending 40+ patches. Obviously it will touch a lot of files,
> but won't change any code.
>
> I think a single patch is ok for this special case.
> All "licenced" are part of (L)GPL license comments with a very low risk of
> merge conflicts,
> especially if the patch is accepted and applied soon.
>
> Stefan W.
Patch below, as requested.


diff --git a/hw/a9mpcore.c b/hw/a9mpcore.c
index b5e5328..6f108f4 100644
--- a/hw/a9mpcore.c
+++ b/hw/a9mpcore.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 /* 64 external IRQ lines.  */
diff --git a/hw/an5206.c b/hw/an5206.c
index 42a0163..04ca420 100644
--- a/hw/an5206.c
+++ b/hw/an5206.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */

 #include "hw.h"
diff --git a/hw/arm-misc.h b/hw/arm-misc.h
index 010acb4..57b8043 100644
--- a/hw/arm-misc.h
+++ b/hw/arm-misc.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  *
  */

diff --git a/hw/arm11mpcore.c b/hw/arm11mpcore.c
index 3bbd885..b47707f 100644
--- a/hw/arm11mpcore.c
+++ b/hw/arm11mpcore.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 /* ??? The MPCore TRM says the on-chip controller has 224 external IRQ lines
diff --git a/hw/arm_boot.c b/hw/arm_boot.c
index bfac982..94677dd 100644
--- a/hw/arm_boot.c
+++ b/hw/arm_boot.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index 0e934ec..fb07314 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 /* This file contains implementation code for the RealView EB interrupt
diff --git a/hw/arm_pic.c b/hw/arm_pic.c
index f44568c..985148a 100644
--- a/hw/arm_pic.c
+++ b/hw/arm_pic.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL
+ * This code is licensed under the LGPL
  */

 #include "hw.h"
diff --git a/hw/arm_sysctl.c b/hw/arm_sysctl.c
index 9225b58..fd0c8bc 100644
--- a/hw/arm_sysctl.c
+++ b/hw/arm_sysctl.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/arm_timer.c b/hw/arm_timer.c
index dac9e70..fd9448f 100644
--- a/hw/arm_timer.c
+++ b/hw/arm_timer.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2005-2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/armv7m.c b/hw/armv7m.c
index 72d010a..205d35b 100644
--- a/hw/armv7m.c
+++ b/hw/armv7m.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/armv7m_nvic.c b/hw/armv7m_nvic.c
index d06eec9..1df8d4d 100644
--- a/hw/armv7m_nvic.c
+++ b/hw/armv7m_nvic.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * The ARMv7M System controller is fairly tightly tied in with the
  * NVIC.  Much of that is also implemented here.
diff --git a/hw/bitbang_i2c.c b/hw/bitbang_i2c.c
index 2937b5c..53e9c5c 100644
--- a/hw/bitbang_i2c.c
+++ b/hw/bitbang_i2c.c
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2008 Jan Kiszka
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */
 #include "hw.h"
 #include "bitbang_i2c.h"
diff --git a/hw/ccid-card-emulated.c b/hw/ccid-card-emulated.c
index 0b07184..4762e85 100644
--- a/hw/ccid-card-emulated.c
+++ b/hw/ccid-card-emulated.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2011 Red Hat.
  * Written by Alon Levy.
  *
- * This code is licenced under the GNU LGPL, version 2 or later.
+ * This code is licensed under the GNU LGPL, version 2 or later.
  */

 /*
diff --git a/hw/ccid.h b/hw/ccid.h
index dbfc13c..210fe08 100644
--- a/hw/ccid.h
+++ b/hw/ccid.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2011 Red Hat.
  * Written by Alon Levy.
  *
- * This code is licenced under the GNU LGPL, version 2 or later.
+ * This code is licensed under the GNU LGPL, version 2 or later.
  */

 #ifndef CCID_H
diff --git a/hw/ds1338.c b/hw/ds1338.c
index 6f5ae5e..3522af5 100644
--- a/hw/ds1338.c
+++ b/hw/ds1338.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */

 #include "i2c.h"
diff --git a/hw/dummy_m68k.c b/hw/dummy_m68k.c
index cec1cc8..eed9e38 100644
--- a/hw/dummy_m68k.c
+++ b/hw/dummy_m68k.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */

 #include "hw.h"
diff --git a/hw/i2c.c b/hw/i2c.c
index f80d12d..49b9ecb 100644
--- a/hw/i2c.c
+++ b/hw/i2c.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 #include "i2c.h"
diff --git a/hw/integratorcp.c b/hw/integratorcp.c
index a6c27be..2814108 100644
--- a/hw/integratorcp.c
+++ b/hw/integratorcp.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2005-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */

 #include "sysbus.h"
diff --git a/hw/lan9118.c b/hw/lan9118.c
index 3f3c05d..73a8661 100644
--- a/hw/lan9118.c
+++ b/hw/lan9118.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2009 CodeSourcery, LLC.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU GPL v2
+ * This code is licensed under the GNU GPL v2
  */

 #include "sysbus.h"
diff --git a/hw/lsi53c895a.c b/hw/lsi53c895a.c
index 940b43a..55cf535 100644
--- a/hw/lsi53c895a.c
+++ b/hw/lsi53c895a.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 /* ??? Need to check if the {read,write}[wl] routines work properly on
diff --git a/hw/marvell_88w8618_audio.c b/hw/marvell_88w8618_audio.c
index 3eff925..f8c5242 100644
--- a/hw/marvell_88w8618_audio.c
+++ b/hw/marvell_88w8618_audio.c
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2008 Jan Kiszka
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */
 #include "sysbus.h"
 #include "hw.h"
diff --git a/hw/mcf5206.c b/hw/mcf5206.c
index 2a618d4..fce282d 100644
--- a/hw/mcf5206.c
+++ b/hw/mcf5206.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */
 #include "hw.h"
 #include "mcf.h"
diff --git a/hw/mcf5208.c b/hw/mcf5208.c
index 17a692d..78fbc5f 100644
--- a/hw/mcf5208.c
+++ b/hw/mcf5208.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */
 #include "hw.h"
 #include "mcf.h"
diff --git a/hw/mcf_fec.c b/hw/mcf_fec.c
index 21035da..3282c66 100644
--- a/hw/mcf_fec.c
+++ b/hw/mcf_fec.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */
 #include "hw.h"
 #include "net.h"
diff --git a/hw/mcf_intc.c b/hw/mcf_intc.c
index ac04295..6cb0a09 100644
--- a/hw/mcf_intc.c
+++ b/hw/mcf_intc.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */
 #include "hw.h"
 #include "mcf.h"
diff --git a/hw/mcf_uart.c b/hw/mcf_uart.c
index db57096..905e116 100644
--- a/hw/mcf_uart.c
+++ b/hw/mcf_uart.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */
 #include "hw.h"
 #include "mcf.h"
diff --git a/hw/mpcore.c b/hw/mpcore.c
index 379065a..d778507 100644
--- a/hw/mpcore.c
+++ b/hw/mpcore.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/musicpal.c b/hw/musicpal.c
index 52b2931..63dd391 100644
--- a/hw/musicpal.c
+++ b/hw/musicpal.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2008 Jan Kiszka
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */

 #include "sysbus.h"
diff --git a/hw/pl011.c b/hw/pl011.c
index 3b94b14..997ce84 100644
--- a/hw/pl011.c
+++ b/hw/pl011.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pl022.c b/hw/pl022.c
index 00e494a..9a1cb71 100644
--- a/hw/pl022.c
+++ b/hw/pl022.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pl050.c b/hw/pl050.c
index b155cc0..f7fa2e2 100644
--- a/hw/pl050.c
+++ b/hw/pl050.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pl061.c b/hw/pl061.c
index 372dfc2..79e5c53 100644
--- a/hw/pl061.c
+++ b/hw/pl061.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pl080.c b/hw/pl080.c
index 901f04a..e124d5f 100644
--- a/hw/pl080.c
+++ b/hw/pl080.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pl110.c b/hw/pl110.c
index 06d2dfa..62aba17 100644
--- a/hw/pl110.c
+++ b/hw/pl110.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2005-2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU LGPL
+ * This code is licensed under the GNU LGPL
  */

 #include "sysbus.h"
diff --git a/hw/pl110_template.h b/hw/pl110_template.h
index b3c9077..d303336 100644
--- a/hw/pl110_template.h
+++ b/hw/pl110_template.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2005 CodeSourcery, LLC.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU LGPL
+ * This code is licensed under the GNU LGPL
  *
  * Framebuffer format conversion routines.
  */
diff --git a/hw/pl181.c b/hw/pl181.c
index 6bc79f5..0943c09 100644
--- a/hw/pl181.c
+++ b/hw/pl181.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "blockdev.h"
diff --git a/hw/pl190.c b/hw/pl190.c
index 75f2ba1..8dc7e42 100644
--- a/hw/pl190.c
+++ b/hw/pl190.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/ptimer.c b/hw/ptimer.c
index 47964a6..6f13ce9 100644
--- a/hw/ptimer.c
+++ b/hw/ptimer.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GNU LGPL.
+ * This code is licensed under the GNU LGPL.
  */
 #include "hw.h"
 #include "qemu-timer.h"
diff --git a/hw/pxa.h b/hw/pxa.h
index d982f00..859fc67 100644
--- a/hw/pxa.h
+++ b/hw/pxa.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 Openedhand Ltd.
  * Written by Andrzej Zaborowski <balrog@zabor.org>
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */
 #ifndef PXA_H
 # define PXA_H			"pxa.h"
diff --git a/hw/pxa2xx.c b/hw/pxa2xx.c
index ac5d95d..cf93110 100644
--- a/hw/pxa2xx.c
+++ b/hw/pxa2xx.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 Openedhand Ltd.
  * Written by Andrzej Zaborowski <balrog@zabor.org>
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/pxa2xx_dma.c b/hw/pxa2xx_dma.c
index a67498b..599581e 100644
--- a/hw/pxa2xx_dma.c
+++ b/hw/pxa2xx_dma.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2006 Thorsten Zitterell
  * Written by Andrzej Zaborowski <balrog@zabor.org>
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/pxa2xx_pic.c b/hw/pxa2xx_pic.c
index e9a5361..bdd82e6 100644
--- a/hw/pxa2xx_pic.c
+++ b/hw/pxa2xx_pic.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2006 Thorsten Zitterell
  * Written by Andrzej Zaborowski <balrog@zabor.org>
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/pxa2xx_timer.c b/hw/pxa2xx_timer.c
index f777a21..4235e42 100644
--- a/hw/pxa2xx_timer.c
+++ b/hw/pxa2xx_timer.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 Openedhand Ltd.
  * Copyright (c) 2006 Thorsten Zitterell
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/realview.c b/hw/realview.c
index 82f3d82..94ab900 100644
--- a/hw/realview.c
+++ b/hw/realview.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/realview_gic.c b/hw/realview_gic.c
index db908b6..43a2a0d 100644
--- a/hw/realview_gic.c
+++ b/hw/realview_gic.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index a8c7372..4c04618 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -12,7 +12,7 @@
  *  2009-Oct-13 Artyom Tarasenko : implemented the block descriptor in the
  *                                 MODE SENSE response.
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  *
  * Note that this file only handles the SCSI architecture model and device
  * commands.  Emulation of interface/link layer protocols is handled by
diff --git a/hw/scsi-generic.c b/hw/scsi-generic.c
index 8e59c7e..9d35f39 100644
--- a/hw/scsi-generic.c
+++ b/hw/scsi-generic.c
@@ -7,7 +7,7 @@
  *
  * Written by Laurent Vivier <Laurent.Vivier@bull.net>
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  *
  */

diff --git a/hw/sh_intc.c b/hw/sh_intc.c
index 0734da9..c43b99f 100644
--- a/hw/sh_intc.c
+++ b/hw/sh_intc.c
@@ -5,7 +5,7 @@
  * Based on sh_timer.c and arm_timer.c by Paul Brook
  * Copyright (c) 2005-2006 CodeSourcery.
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sh_intc.h"
diff --git a/hw/sh_timer.c b/hw/sh_timer.c
index 5eec6b7..5df7fb6 100644
--- a/hw/sh_timer.c
+++ b/hw/sh_timer.c
@@ -5,7 +5,7 @@
  * Based on arm_timer.c by Paul Brook
  * Copyright (c) 2005-2006 CodeSourcery.
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "hw.h"
diff --git a/hw/smbus.c b/hw/smbus.c
index e464539..ff027c8 100644
--- a/hw/smbus.c
+++ b/hw/smbus.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 /* TODO: Implement PEC.  */
diff --git a/hw/smc91c111.c b/hw/smc91c111.c
index 701baaf..3a8a85c 100644
--- a/hw/smc91c111.c
+++ b/hw/smc91c111.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2005 CodeSourcery, LLC.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */

 #include "sysbus.h"
diff --git a/hw/ssd0303.c b/hw/ssd0303.c
index b39e259..401fdf5 100644
--- a/hw/ssd0303.c
+++ b/hw/ssd0303.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 /* The controller can support a variety of different displays, but we only
diff --git a/hw/ssd0323.c b/hw/ssd0323.c
index 8643961..1eb3823 100644
--- a/hw/ssd0323.c
+++ b/hw/ssd0323.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 /* The controller can support a variety of different displays, but we only
diff --git a/hw/ssi-sd.c b/hw/ssi-sd.c
index fb4b649..18dabd6 100644
--- a/hw/ssi-sd.c
+++ b/hw/ssi-sd.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007-2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */

 #include "blockdev.h"
diff --git a/hw/ssi.c b/hw/ssi.c
index cfe7c07..3f4c5f9 100644
--- a/hw/ssi.c
+++ b/hw/ssi.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */

 #include "ssi.h"
diff --git a/hw/stellaris.c b/hw/stellaris.c
index ac9fcc1..075c6ca 100644
--- a/hw/stellaris.c
+++ b/hw/stellaris.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/hw/stellaris_enet.c b/hw/stellaris_enet.c
index 6a0583a..1291931 100644
--- a/hw/stellaris_enet.c
+++ b/hw/stellaris_enet.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */
 #include "sysbus.h"
 #include "net.h"
diff --git a/hw/stellaris_input.c b/hw/stellaris_input.c
index 06c5f9d..95604ec 100644
--- a/hw/stellaris_input.c
+++ b/hw/stellaris_input.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */
 #include "hw.h"
 #include "devices.h"
diff --git a/hw/usb-msd.c b/hw/usb-msd.c
index c59797b..2c5a79c 100644
--- a/hw/usb-msd.c
+++ b/hw/usb-msd.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 #include "qemu-common.h"
diff --git a/hw/usb-serial.c b/hw/usb-serial.c
index 59cb0fb..c69c437 100644
--- a/hw/usb-serial.c
+++ b/hw/usb-serial.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2008 Samuel Thibault <samuel.thibault@ens-lyon.org>
  * Written by Paul Brook, reused for FTDI by Samuel Thibault
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 #include "qemu-common.h"
diff --git a/hw/versatile_pci.c b/hw/versatile_pci.c
index 8e75ffc..290a900 100644
--- a/hw/versatile_pci.c
+++ b/hw/versatile_pci.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2009 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the LGPL.
+ * This code is licensed under the LGPL.
  */

 #include "sysbus.h"
diff --git a/hw/versatilepb.c b/hw/versatilepb.c
index 46b6a3f..147fe29 100644
--- a/hw/versatilepb.c
+++ b/hw/versatilepb.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2005-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
diff --git a/softmmu-semi.h b/softmmu-semi.h
index 79278cc..86a9f8a 100644
--- a/softmmu-semi.h
+++ b/softmmu-semi.h
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2007 CodeSourcery.
  *
- * This code is licenced under the GPL
+ * This code is licensed under the GPL
  */

 static inline uint32_t softmmu_tget32(CPUState *env, uint32_t addr)
diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
index 9165519..8ef5e54 100644
--- a/target-arm/neon_helper.c
+++ b/target-arm/neon_helper.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2007, 2008 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GNU GPL v2.
+ * This code is licensed under the GNU GPL v2.
  */
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/target-arm/op_addsub.h b/target-arm/op_addsub.h
index c02c92a..ca4a189 100644
--- a/target-arm/op_addsub.h
+++ b/target-arm/op_addsub.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #ifdef ARITH_GE

