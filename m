Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZeZx-000463-Dg
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 10:15:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1eZeZs-00043F-HR
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 10:15:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1eZeZp-0005kv-5A
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 10:15:36 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:38686)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <antonynpavlov@gmail.com>)
	id 1eZeZo-0005jX-PF
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 10:15:33 -0500
Received: by mail-lf0-x244.google.com with SMTP id d19so3186075lfj.5
	for <qemu-trivial@nongnu.org>; Thu, 11 Jan 2018 07:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M2N8rATsHOZCZGYeq48cQj9w7J8/7wYn0crFB5XT8qE=;
	b=e49l41pEYYbcJsb4q39UyeEpepoXjANKJ+RGpo3JkU5oRtelSoWsLkgq9O7cXsSMZK
	+SimGle6saQJ1imi7II2th8dU/BSH4HK8Rv6mmMxtcgQ2kbSUxWM2LHHqoLwCsdqX+U0
	DewHz0mNEXQS9nQy1vjOkeVq+x8cki9QfE3q7+k06g62qwdI7uJWoCN2zXQJ0gUrCV7q
	Gr4MJe/LOPQcQx1VnvPu7ur0lgdFXBV97bfnrcpbObptmXTbj2327y9xhZXyATwUiDeE
	MLwOMOFlMsYpo6e40DUdNLBAQ3l2xdy8f+ezmANxSAxMY/TAKOkIeHcFsdosLDoF3wgS
	V5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M2N8rATsHOZCZGYeq48cQj9w7J8/7wYn0crFB5XT8qE=;
	b=CqHOewjriWtNe6agpvTuWQfFfEJDX892G8mkhyC1nzK6k+N+qiCP8lRgp4AEmYs4bN
	v2yKMdlvlcp1Y4ckBkWevEYwVEIhKeF76rNooiJXjJmcLv2l7JLhAkruUoU79zHaFsEW
	+rbHDqlRuZ2Ont/pw0x/2sL/6Kpq97Nyo725a+acApmjgy+OgNpDxYDwENF/AxD+XA67
	3GjZOL9NqXd6pwho9zM0F4efIZLcvPKAlF/1n6JEoAVppKe8CSQOxNpVZQuz1n7vpZGU
	myftuLYOh4p8gjbguUzcV5EKIg455vD9AohiElbadqPFXIdMTwA57mHrOVcANdab8ix1
	lXRQ==
X-Gm-Message-State: AKwxytf5/mDwUanRNo0aPBm9+uDtOnZkZaG7og22N6FBamwz4XVhoJyw
	SJ5PUGZvbTaQKqKBDxhl0ZxiLA==
X-Google-Smtp-Source: ACJfBouXby/Bl8051Ox3jovf5bjOEpWoZiOl7BRQw8D+K188yEBW9lho1H5Ye92zH+Ct2DviW+HLhQ==
X-Received: by 10.25.56.69 with SMTP id d5mr354177lfj.17.1515683730956;
	Thu, 11 Jan 2018 07:15:30 -0800 (PST)
Received: from localhost.localdomain (t109.niisi.ras.ru. [193.232.173.109])
	by smtp.gmail.com with ESMTPSA id
	p83sm1750089lfg.41.2018.01.11.07.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 07:15:30 -0800 (PST)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Aleksey Kuleshov <rndfax@yandex.ru>
Date: Thu, 11 Jan 2018 18:15:20 +0300
Message-Id: <20180111151520.23981-1-antonynpavlov@gmail.com>
X-Mailer: git-send-email 2.15.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-trivial] [PATCH] hw/block/nand.c: replace tabs by 4 spaces
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
X-List-Received-Date: Thu, 11 Jan 2018 15:15:39 -0000

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Aleksey Kuleshov <rndfax@yandex.ru>
---
 hw/block/nand.c | 242 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 76dcd3f76e..1d9d4f0936 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -26,33 +26,33 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 
-# define NAND_CMD_READ0		0x00
-# define NAND_CMD_READ1		0x01
-# define NAND_CMD_READ2		0x50
-# define NAND_CMD_LPREAD2	0x30
-# define NAND_CMD_NOSERIALREAD2	0x35
-# define NAND_CMD_RANDOMREAD1	0x05
-# define NAND_CMD_RANDOMREAD2	0xe0
-# define NAND_CMD_READID	0x90
-# define NAND_CMD_RESET		0xff
-# define NAND_CMD_PAGEPROGRAM1	0x80
-# define NAND_CMD_PAGEPROGRAM2	0x10
-# define NAND_CMD_CACHEPROGRAM2	0x15
-# define NAND_CMD_BLOCKERASE1	0x60
-# define NAND_CMD_BLOCKERASE2	0xd0
-# define NAND_CMD_READSTATUS	0x70
-# define NAND_CMD_COPYBACKPRG1	0x85
-
-# define NAND_IOSTATUS_ERROR	(1 << 0)
-# define NAND_IOSTATUS_PLANE0	(1 << 1)
-# define NAND_IOSTATUS_PLANE1	(1 << 2)
-# define NAND_IOSTATUS_PLANE2	(1 << 3)
-# define NAND_IOSTATUS_PLANE3	(1 << 4)
+# define NAND_CMD_READ0         0x00
+# define NAND_CMD_READ1         0x01
+# define NAND_CMD_READ2         0x50
+# define NAND_CMD_LPREAD2       0x30
+# define NAND_CMD_NOSERIALREAD2 0x35
+# define NAND_CMD_RANDOMREAD1   0x05
+# define NAND_CMD_RANDOMREAD2   0xe0
+# define NAND_CMD_READID        0x90
+# define NAND_CMD_RESET         0xff
+# define NAND_CMD_PAGEPROGRAM1  0x80
+# define NAND_CMD_PAGEPROGRAM2  0x10
+# define NAND_CMD_CACHEPROGRAM2 0x15
+# define NAND_CMD_BLOCKERASE1   0x60
+# define NAND_CMD_BLOCKERASE2   0xd0
+# define NAND_CMD_READSTATUS    0x70
+# define NAND_CMD_COPYBACKPRG1  0x85
+
+# define NAND_IOSTATUS_ERROR    (1 << 0)
+# define NAND_IOSTATUS_PLANE0   (1 << 1)
+# define NAND_IOSTATUS_PLANE1   (1 << 2)
+# define NAND_IOSTATUS_PLANE2   (1 << 3)
+# define NAND_IOSTATUS_PLANE3   (1 << 4)
 # define NAND_IOSTATUS_READY    (1 << 6)
-# define NAND_IOSTATUS_UNPROTCT	(1 << 7)
+# define NAND_IOSTATUS_UNPROTCT (1 << 7)
 
-# define MAX_PAGE		0x800
-# define MAX_OOB		0x40
+# define MAX_PAGE       0x800
+# define MAX_OOB        0x40
 
 typedef struct NANDFlashState NANDFlashState;
 struct NANDFlashState {
@@ -99,40 +99,40 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
     }
 }
 
-# define NAND_NO_AUTOINCR	0x00000001
-# define NAND_BUSWIDTH_16	0x00000002
-# define NAND_NO_PADDING	0x00000004
-# define NAND_CACHEPRG		0x00000008
-# define NAND_COPYBACK		0x00000010
-# define NAND_IS_AND		0x00000020
-# define NAND_4PAGE_ARRAY	0x00000040
-# define NAND_NO_READRDY	0x00000100
-# define NAND_SAMSUNG_LP	(NAND_NO_PADDING | NAND_COPYBACK)
+# define NAND_NO_AUTOINCR   0x00000001
+# define NAND_BUSWIDTH_16   0x00000002
+# define NAND_NO_PADDING    0x00000004
+# define NAND_CACHEPRG      0x00000008
+# define NAND_COPYBACK      0x00000010
+# define NAND_IS_AND        0x00000020
+# define NAND_4PAGE_ARRAY   0x00000040
+# define NAND_NO_READRDY    0x00000100
+# define NAND_SAMSUNG_LP    (NAND_NO_PADDING | NAND_COPYBACK)
 
 # define NAND_IO
 
-# define PAGE(addr)		((addr) >> ADDR_SHIFT)
-# define PAGE_START(page)	(PAGE(page) * (PAGE_SIZE + OOB_SIZE))
-# define PAGE_MASK		((1 << ADDR_SHIFT) - 1)
-# define OOB_SHIFT		(PAGE_SHIFT - 5)
-# define OOB_SIZE		(1 << OOB_SHIFT)
-# define SECTOR(addr)		((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
-# define SECTOR_OFFSET(addr)	((addr) & ((511 >> PAGE_SHIFT) << 8))
-
-# define PAGE_SIZE		256
-# define PAGE_SHIFT		8
-# define PAGE_SECTORS		1
-# define ADDR_SHIFT		8
+# define PAGE(addr)             ((addr) >> ADDR_SHIFT)
+# define PAGE_START(page)       (PAGE(page) * (PAGE_SIZE + OOB_SIZE))
+# define PAGE_MASK              ((1 << ADDR_SHIFT) - 1)
+# define OOB_SHIFT              (PAGE_SHIFT - 5)
+# define OOB_SIZE               (1 << OOB_SHIFT)
+# define SECTOR(addr)           ((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
+# define SECTOR_OFFSET(addr)    ((addr) & ((511 >> PAGE_SHIFT) << 8))
+
+# define PAGE_SIZE      256
+# define PAGE_SHIFT     8
+# define PAGE_SECTORS   1
+# define ADDR_SHIFT     8
 # include "nand.c"
-# define PAGE_SIZE		512
-# define PAGE_SHIFT		9
-# define PAGE_SECTORS		1
-# define ADDR_SHIFT		8
+# define PAGE_SIZE      512
+# define PAGE_SHIFT     9
+# define PAGE_SECTORS   1
+# define ADDR_SHIFT     8
 # include "nand.c"
-# define PAGE_SIZE		2048
-# define PAGE_SHIFT		11
-# define PAGE_SECTORS		4
-# define ADDR_SHIFT		16
+# define PAGE_SIZE      2048
+# define PAGE_SHIFT     11
+# define PAGE_SECTORS   4
+# define ADDR_SHIFT     16
 # include "nand.c"
 
 /* Information based on Linux drivers/mtd/nand/nand_ids.c */
@@ -145,89 +145,89 @@ static const struct {
 } nand_flash_ids[0x100] = {
     [0 ... 0xff] = { 0 },
 
-    [0x6e] = { 1,	8,	8, 4, 0 },
-    [0x64] = { 2,	8,	8, 4, 0 },
-    [0x6b] = { 4,	8,	9, 4, 0 },
-    [0xe8] = { 1,	8,	8, 4, 0 },
-    [0xec] = { 1,	8,	8, 4, 0 },
-    [0xea] = { 2,	8,	8, 4, 0 },
-    [0xd5] = { 4,	8,	9, 4, 0 },
-    [0xe3] = { 4,	8,	9, 4, 0 },
-    [0xe5] = { 4,	8,	9, 4, 0 },
-    [0xd6] = { 8,	8,	9, 4, 0 },
-
-    [0x39] = { 8,	8,	9, 4, 0 },
-    [0xe6] = { 8,	8,	9, 4, 0 },
-    [0x49] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
-    [0x59] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
-
-    [0x33] = { 16,	8,	9, 5, 0 },
-    [0x73] = { 16,	8,	9, 5, 0 },
-    [0x43] = { 16,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x53] = { 16,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x35] = { 32,	8,	9, 5, 0 },
-    [0x75] = { 32,	8,	9, 5, 0 },
-    [0x45] = { 32,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x55] = { 32,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x36] = { 64,	8,	9, 5, 0 },
-    [0x76] = { 64,	8,	9, 5, 0 },
-    [0x46] = { 64,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x56] = { 64,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x78] = { 128,	8,	9, 5, 0 },
-    [0x39] = { 128,	8,	9, 5, 0 },
-    [0x79] = { 128,	8,	9, 5, 0 },
-    [0x72] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x49] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x74] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x59] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x71] = { 256,	8,	9, 5, 0 },
+    [0x6e] = { 1,   8,  8, 4, 0 },
+    [0x64] = { 2,   8,  8, 4, 0 },
+    [0x6b] = { 4,   8,  9, 4, 0 },
+    [0xe8] = { 1,   8,  8, 4, 0 },
+    [0xec] = { 1,   8,  8, 4, 0 },
+    [0xea] = { 2,   8,  8, 4, 0 },
+    [0xd5] = { 4,   8,  9, 4, 0 },
+    [0xe3] = { 4,   8,  9, 4, 0 },
+    [0xe5] = { 4,   8,  9, 4, 0 },
+    [0xd6] = { 8,   8,  9, 4, 0 },
+
+    [0x39] = { 8,   8,  9, 4, 0 },
+    [0xe6] = { 8,   8,  9, 4, 0 },
+    [0x49] = { 8,   16, 9, 4, NAND_BUSWIDTH_16 },
+    [0x59] = { 8,   16, 9, 4, NAND_BUSWIDTH_16 },
+
+    [0x33] = { 16,  8,  9, 5, 0 },
+    [0x73] = { 16,  8,  9, 5, 0 },
+    [0x43] = { 16,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x53] = { 16,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x35] = { 32,  8,  9, 5, 0 },
+    [0x75] = { 32,  8,  9, 5, 0 },
+    [0x45] = { 32,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x55] = { 32,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x36] = { 64,  8,  9, 5, 0 },
+    [0x76] = { 64,  8,  9, 5, 0 },
+    [0x46] = { 64,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x56] = { 64,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x78] = { 128, 8,  9, 5, 0 },
+    [0x39] = { 128, 8,  9, 5, 0 },
+    [0x79] = { 128, 8,  9, 5, 0 },
+    [0x72] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x49] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x74] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x59] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x71] = { 256, 8,  9, 5, 0 },
 
     /*
      * These are the new chips with large page size. The pagesize and the
      * erasesize is determined from the extended id bytes
      */
-# define LP_OPTIONS	(NAND_SAMSUNG_LP | NAND_NO_READRDY | NAND_NO_AUTOINCR)
-# define LP_OPTIONS16	(LP_OPTIONS | NAND_BUSWIDTH_16)
+# define LP_OPTIONS    (NAND_SAMSUNG_LP | NAND_NO_READRDY | NAND_NO_AUTOINCR)
+# define LP_OPTIONS16    (LP_OPTIONS | NAND_BUSWIDTH_16)
 
     /* 512 Megabit */
-    [0xa2] = { 64,	8,	0, 0, LP_OPTIONS },
-    [0xf2] = { 64,	8,	0, 0, LP_OPTIONS },
-    [0xb2] = { 64,	16,	0, 0, LP_OPTIONS16 },
-    [0xc2] = { 64,	16,	0, 0, LP_OPTIONS16 },
+    [0xa2] = { 64,  8,  0, 0, LP_OPTIONS },
+    [0xf2] = { 64,  8,  0, 0, LP_OPTIONS },
+    [0xb2] = { 64,  16, 0, 0, LP_OPTIONS16 },
+    [0xc2] = { 64,  16, 0, 0, LP_OPTIONS16 },
 
     /* 1 Gigabit */
-    [0xa1] = { 128,	8,	0, 0, LP_OPTIONS },
-    [0xf1] = { 128,	8,	0, 0, LP_OPTIONS },
-    [0xb1] = { 128,	16,	0, 0, LP_OPTIONS16 },
-    [0xc1] = { 128,	16,	0, 0, LP_OPTIONS16 },
+    [0xa1] = { 128, 8,  0, 0, LP_OPTIONS },
+    [0xf1] = { 128, 8,  0, 0, LP_OPTIONS },
+    [0xb1] = { 128, 16, 0, 0, LP_OPTIONS16 },
+    [0xc1] = { 128, 16, 0, 0, LP_OPTIONS16 },
 
     /* 2 Gigabit */
-    [0xaa] = { 256,	8,	0, 0, LP_OPTIONS },
-    [0xda] = { 256,	8,	0, 0, LP_OPTIONS },
-    [0xba] = { 256,	16,	0, 0, LP_OPTIONS16 },
-    [0xca] = { 256,	16,	0, 0, LP_OPTIONS16 },
+    [0xaa] = { 256, 8,  0, 0, LP_OPTIONS },
+    [0xda] = { 256, 8,  0, 0, LP_OPTIONS },
+    [0xba] = { 256, 16, 0, 0, LP_OPTIONS16 },
+    [0xca] = { 256, 16, 0, 0, LP_OPTIONS16 },
 
     /* 4 Gigabit */
-    [0xac] = { 512,	8,	0, 0, LP_OPTIONS },
-    [0xdc] = { 512,	8,	0, 0, LP_OPTIONS },
-    [0xbc] = { 512,	16,	0, 0, LP_OPTIONS16 },
-    [0xcc] = { 512,	16,	0, 0, LP_OPTIONS16 },
+    [0xac] = { 512, 8,  0, 0, LP_OPTIONS },
+    [0xdc] = { 512, 8,  0, 0, LP_OPTIONS },
+    [0xbc] = { 512, 16, 0, 0, LP_OPTIONS16 },
+    [0xcc] = { 512, 16, 0, 0, LP_OPTIONS16 },
 
     /* 8 Gigabit */
-    [0xa3] = { 1024,	8,	0, 0, LP_OPTIONS },
-    [0xd3] = { 1024,	8,	0, 0, LP_OPTIONS },
-    [0xb3] = { 1024,	16,	0, 0, LP_OPTIONS16 },
-    [0xc3] = { 1024,	16,	0, 0, LP_OPTIONS16 },
+    [0xa3] = { 1024, 8,  0, 0, LP_OPTIONS },
+    [0xd3] = { 1024, 8,  0, 0, LP_OPTIONS },
+    [0xb3] = { 1024, 16, 0, 0, LP_OPTIONS16 },
+    [0xc3] = { 1024, 16, 0, 0, LP_OPTIONS16 },
 
     /* 16 Gigabit */
-    [0xa5] = { 2048,	8,	0, 0, LP_OPTIONS },
-    [0xd5] = { 2048,	8,	0, 0, LP_OPTIONS },
-    [0xb5] = { 2048,	16,	0, 0, LP_OPTIONS16 },
-    [0xc5] = { 2048,	16,	0, 0, LP_OPTIONS16 },
+    [0xa5] = { 2048, 8,  0, 0, LP_OPTIONS },
+    [0xd5] = { 2048, 8,  0, 0, LP_OPTIONS },
+    [0xb5] = { 2048, 16, 0, 0, LP_OPTIONS16 },
+    [0xc5] = { 2048, 16, 0, 0, LP_OPTIONS16 },
 };
 
 static void nand_reset(DeviceState *dev)
@@ -817,4 +817,4 @@ static void glue(nand_init_, PAGE_SIZE)(NANDFlashState *s)
 # undef PAGE_SHIFT
 # undef PAGE_SECTORS
 # undef ADDR_SHIFT
-#endif	/* NAND_IO */
+#endif  /* NAND_IO */
-- 
2.15.1


