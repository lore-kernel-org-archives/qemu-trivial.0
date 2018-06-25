Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrB-000280-2f
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr7-00024R-S3
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr7-00085D-1J
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:29 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr2-00083d-VO; Mon, 25 Jun 2018 08:44:25 -0400
Received: by mail-qt0-x244.google.com with SMTP id c23-v6so2827965qtn.6;
	Mon, 25 Jun 2018 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t2iQqIMi1+J2VItu51DRtsuf+lb7WIl0xZZ6TqVdeJY=;
	b=BEOmRjDX9ZcSVzYfPbchPn7srIWFYtydRy1d8OvpEqGLZmQKw3v2ZaCwuImZgXGUeY
	2iwhc70RFMVXknOFBfpniiEhP3jikx+ybT5/U5SrlcTP2SSCTxg8BmDBAHv1OncXJkQV
	rAYnj9tgJTh4ajciyrb61eHpWXMvzE5MLeaDKCVe//HgTePgnELVpdaRuHxFg4Qu7eOb
	0FmzKXWyLSpNGpw5t6BTAe/dJI0o9tvTMmyAt56Oympe+vy7AQVBhKL/7dnA/jUVVu+n
	QULGwI5ASXcm4BZLZC4RKafWk9LyL4jJjbr3elMDtEEyseID2CHSvCiDyF5SkdHjGoq8
	3lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=t2iQqIMi1+J2VItu51DRtsuf+lb7WIl0xZZ6TqVdeJY=;
	b=sANgNMGbIqBmCcObg4DjSx/kf399UCp9wIwBQP3q8yUVUSL0p4nSLrc9//1amSu6NH
	y3BckQzueA1CAgBKBX4qk/JaCh4pHyAr8GBuum3ByyP1tn9wP4E2lE0L8B1doEHHOJTe
	tS8FO5I/KqYeHYBM4GGNHf5pMDaokEfweTlRQkIpHV8HE1+d0pdibNEnCPTZ00OwJGX/
	uYUZID3EOHYVo90jlzT3pJtoMAf3S57DvIxfRegmf3Gc0ql2mk9NPU+aZeSqWKi7qM6a
	TF/3PtygBIUvTj6yu0ygF8pd9OFgFECh74zDOzlZcmkPoxK09FwTik9sXD3C0BmtuwYK
	EcYA==
X-Gm-Message-State: APt69E3Hk+8eXWY3XQ95ANDQtYDacvJwxsTw+PEz6sSDRVPcJ6sK2HKO
	kJDYk0HbDDs9AOH7C1qcHBo=
X-Google-Smtp-Source: AAOMgpc5IIM4wraxUf+ek84IXurhqWiQpyhr3Oqp8zYz0UmYh1xC0qD1rORJ8oMC/ARYE2GHZF1h9w==
X-Received: by 2002:a0c:a063:: with SMTP id
	b90-v6mr10713335qva.115.1529930664450; 
	Mon, 25 Jun 2018 05:44:24 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>
Date: Mon, 25 Jun 2018 09:42:19 -0300
Message-Id: <20180625124238.25339-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v5 27/46] hw/lm32: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:31 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
---
 hw/lm32/lm32_boards.c | 13 +++++++------
 hw/lm32/milkymist.c   | 10 +++++-----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 167058348e..fd8eccca14 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -87,10 +88,10 @@ static void lm32_evr_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base  = 0x04000000;
-    size_t flash_sector_size       = 256 * 1024;
-    size_t flash_size              = 32 * 1024 * 1024;
+    size_t flash_sector_size       = 256 * KiB;
+    size_t flash_size              = 32 * MiB;
     hwaddr ram_base    = 0x08000000;
-    size_t ram_size                = 64 * 1024 * 1024;
+    size_t ram_size                = 64 * MiB;
     hwaddr timer0_base = 0x80002000;
     hwaddr uart0_base  = 0x80006000;
     hwaddr timer1_base = 0x8000a000;
@@ -173,10 +174,10 @@ static void lm32_uclinux_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base   = 0x04000000;
-    size_t flash_sector_size        = 256 * 1024;
-    size_t flash_size               = 32 * 1024 * 1024;
+    size_t flash_sector_size        = 256 * KiB;
+    size_t flash_size               = 32 * MiB;
     hwaddr ram_base     = 0x08000000;
-    size_t ram_size                 = 64 * 1024 * 1024;
+    size_t ram_size                 = 64 * MiB;
     hwaddr uart0_base   = 0x80000000;
     hwaddr timer0_base  = 0x80002000;
     hwaddr timer1_base  = 0x80010000;
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index c36bbc4ae2..321f184595 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -33,11 +34,10 @@
 #include "milkymist-hw.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 
 #define BIOS_FILENAME    "mmone-bios.bin"
 #define BIOS_OFFSET      0x00860000
-#define BIOS_SIZE        (512*1024)
+#define BIOS_SIZE        (512 * KiB)
 #define KERNEL_LOAD_ADDR 0x40000000
 
 typedef struct {
@@ -96,10 +96,10 @@ milkymist_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base   = 0x00000000;
-    size_t flash_sector_size        = 128 * 1024;
-    size_t flash_size               = 32 * 1024 * 1024;
+    size_t flash_sector_size        = 128 * KiB;
+    size_t flash_size               = 32 * MiB;
     hwaddr sdram_base   = 0x40000000;
-    size_t sdram_size               = 128 * 1024 * 1024;
+    size_t sdram_size               = 128 * MiB;
 
     hwaddr initrd_base  = sdram_base + 0x1002000;
     hwaddr cmdline_base = sdram_base + 0x1000000;
-- 
2.18.0


