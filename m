Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKA-0005cs-Gw
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK8-0005aL-9e
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK7-000184-Dp
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:44 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:45043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK7-00017b-9A; Sun, 15 Apr 2018 19:44:43 -0400
Received: by mail-qk0-x244.google.com with SMTP id n139so14807225qke.11;
	Sun, 15 Apr 2018 16:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rm8uCbkt1FliNsXrPMp8YsDleAzMga33Rrvo5+eHS2k=;
	b=SywEtQ4QOqIXzvRdPOx7AnKOqtzRunt/K077c18PVrFHvilpIUbuu95d90vYV4nFVF
	p7jeBD2vfaTdU3NndMPi21xyfK6QeSA3VGCDscOl3ve1Ipuur+j0EJlD++PsJ2r6SXu0
	VyOYzZct7MiKLg3aIHLTXCVpFAa/2XSYnOpwALJGDkUKMY8Je9se00w3TExMIF6GMNtH
	5/fyyupQXygTaDD/x0WdcNq/sUcgisgulQj8SbOqycFr8fng0Ix2J3/3smzTMZbGyBww
	zLFIUKJGYiwoZmTVzZuwBFwf2FHLvAR23izQ8kTWgICPziqGepp5nMpR061ks0P98x0K
	xxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rm8uCbkt1FliNsXrPMp8YsDleAzMga33Rrvo5+eHS2k=;
	b=ivjsuyb0qHXK+YcLdgMN/3D4rzq1w/yWOOKyxIFi6Bb8b8UmBMsn6vTg4YY42HgU7R
	bJiq+MJh/qiCYzSkrnT+kllUfop/Sh+8bvFkbQtiWFEcnsryGFJ31FzvvmKU1RdTzSkT
	FzXwll/DZm1rmzdexHP+kLg5MUWE7YfOFLbQpiiGX7L4VU5RrYD1TOfGT+7VXd90aKAd
	FMl6K7hR1dpZmmyIxFap2Cesh70NdDOVxxpuNE5/CN5gyyOqDdSsOmUweChPJ4o/xYkv
	jxUfzsGc9IX8MB7TfWlOem3SFTMs9Avpq7TAH9Nso6CNvfGIxKeICspjQzSCwecaHRPx
	gJbA==
X-Gm-Message-State: ALQs6tCVYaBGMW3aI8z3Iz33d4MAnQqhGXP/Lxp8WcAqXwo8nBm6DgB8
	fILfua6uaQu0Ay+Ehnp5ToPuw/Wh
X-Google-Smtp-Source: AIpwx488Z3Cy2l9ymEk4P1kAG+JMD7LCuorHfpL8v5e9X1J37JiOK3eYJMT8ZvnwTZa3U145XXCElw==
X-Received: by 10.55.49.8 with SMTP id x8mr14400080qkx.66.1523835882618;
	Sun, 15 Apr 2018 16:44:42 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>
Date: Sun, 15 Apr 2018 20:42:53 -0300
Message-Id: <20180415234307.28132-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 27/41] hw/lm32: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:45 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/lm32_boards.c | 13 +++++++------
 hw/lm32/milkymist.c   | 10 +++++-----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 527bcc229c..ef229dd315 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -88,10 +89,10 @@ static void lm32_evr_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base  = 0x04000000;
-    size_t flash_sector_size       = 256 * 1024;
-    size_t flash_size              = 32 * 1024 * 1024;
+    size_t flash_sector_size       = 256 * K_BYTE;
+    size_t flash_size              = 32 * M_BYTE;
     hwaddr ram_base    = 0x08000000;
-    size_t ram_size                = 64 * 1024 * 1024;
+    size_t ram_size                = 64 * M_BYTE;
     hwaddr timer0_base = 0x80002000;
     hwaddr uart0_base  = 0x80006000;
     hwaddr timer1_base = 0x8000a000;
@@ -174,10 +175,10 @@ static void lm32_uclinux_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base   = 0x04000000;
-    size_t flash_sector_size        = 256 * 1024;
-    size_t flash_size               = 32 * 1024 * 1024;
+    size_t flash_sector_size        = 256 * K_BYTE;
+    size_t flash_size               = 32 * M_BYTE;
     hwaddr ram_base     = 0x08000000;
-    size_t ram_size                 = 64 * 1024 * 1024;
+    size_t ram_size                 = 64 * M_BYTE;
     hwaddr uart0_base   = 0x80000000;
     hwaddr timer0_base  = 0x80002000;
     hwaddr timer1_base  = 0x80010000;
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 85d64fe58d..f530997abb 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -34,11 +35,10 @@
 #include "milkymist-hw.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 
 #define BIOS_FILENAME    "mmone-bios.bin"
 #define BIOS_OFFSET      0x00860000
-#define BIOS_SIZE        (512*1024)
+#define BIOS_SIZE        (512 * K_BYTE)
 #define KERNEL_LOAD_ADDR 0x40000000
 
 typedef struct {
@@ -97,10 +97,10 @@ milkymist_init(MachineState *machine)
 
     /* memory map */
     hwaddr flash_base   = 0x00000000;
-    size_t flash_sector_size        = 128 * 1024;
-    size_t flash_size               = 32 * 1024 * 1024;
+    size_t flash_sector_size        = 128 * K_BYTE;
+    size_t flash_size               = 32 * M_BYTE;
     hwaddr sdram_base   = 0x40000000;
-    size_t sdram_size               = 128 * 1024 * 1024;
+    size_t sdram_size               = 128 * M_BYTE;
 
     hwaddr initrd_base  = sdram_base + 0x1002000;
     hwaddr cmdline_base = sdram_base + 0x1000000;
-- 
2.17.0


