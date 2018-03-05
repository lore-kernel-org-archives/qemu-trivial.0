Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHm-0003Zx-DB
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHj-0003Ve-2l
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHh-00070G-Hk
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:03 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:37937)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHh-0006zV-AW; Mon, 05 Mar 2018 06:28:01 -0500
Received: by mail-wr0-x241.google.com with SMTP id n7so16865385wrn.5;
	Mon, 05 Mar 2018 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=se0KOlZfVzJW70ugYHJWJu6vHwneo8YsF/YDa+Ai6bw=;
	b=UonL+50mlZbGHGdHHdve7RG1EuqbgjFxo8bcXXG/OBwiFPfo3AYYOPUf26gTqGHyWX
	OW3QcP7nBoQ8fvWwGhHaZH9rAd+W1Eyn+UHUOyIvvLLXv2+mA3zZh2iKx7PUTioraO8J
	o2mxKyYYGftHPyiOBERF4RghWOc/ey0G9phwybOscLArvlA23pb/6RuCB8sev5W7y8G6
	ASM75P6gJePjDm+y/7Z0TYJAAPlClSWO7rQvk9of2wE1yIsWS21gx/wUkxdARlQ2FCQo
	Bmt2L5or6Q4UukiKl16skCXeQ4bkgMVmYiywdw/r5mlsJVS8j8EynKMUfzXZOceNCPdX
	Dzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=se0KOlZfVzJW70ugYHJWJu6vHwneo8YsF/YDa+Ai6bw=;
	b=AcFplkb9su2aeBfCO0HRSwwtj2qKGOM/LzDjxF8SCDq5YAVtre8EqeGfQynW5YEIgf
	ITCZQw66Ex0hvom3QsLl7Qyc+C2W3CkH1TD7VIkhOsc6OAxqmuyp4ArRb8J0hcfk1uGf
	GisL2BelnCmBVbi38nuXQEWdv/7OAsESbM3TB0+atIOS2WZNHoJn1ppfaeX4DWtRrFkt
	hn7Xn2L5L1/LLuCDmOzaDzqJrvGl4s0rci9Yc7Pb2uUIxS2D7BMXFzq2hqENFkUZWW2/
	Wj09fGK2tXQ6SyeVEBF9wAl+VP+/A7kJfjQ60TuigrdN6E+/uVP70dCytyG/+IHoPZgW
	Cdkg==
X-Gm-Message-State: APf1xPBzNWYKEmprFYBzZRYsCmZxLX2Nv6IzJ9/8fuSDiTwE8zMyljNU
	mnoSPlqwvPn2//mhGg7/brTFIN5Y
X-Google-Smtp-Source: AG47ELtcSIAqq9RJKDF4zWVGsF0Ts7bgDfyD7H6bFjPzliB8tRsgijaJdruZQIKXSZ1+53BaBNf0Fw==
X-Received: by 10.223.208.141 with SMTP id y13mr12247506wrh.13.1520249280128; 
	Mon, 05 Mar 2018 03:28:00 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>
Date: Mon,  5 Mar 2018 08:27:17 -0300
Message-Id: <20180305112732.26471-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: [Qemu-trivial] [PATCH v2 15/30] hw/lm32: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:04 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/lm32_boards.c | 12 ++++++------
 hw/lm32/milkymist.c   |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 527bcc229c..15315101be 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -88,10 +88,10 @@ static void lm32_evr_init(MachineState *machine)
 
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
@@ -174,10 +174,10 @@ static void lm32_uclinux_init(MachineState *machine)
 
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
index c28379399f..b884b825bc 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -36,7 +36,7 @@
 
 #define BIOS_FILENAME    "mmone-bios.bin"
 #define BIOS_OFFSET      0x00860000
-#define BIOS_SIZE        (512*1024)
+#define BIOS_SIZE        (512 * K_BYTE)
 #define KERNEL_LOAD_ADDR 0x40000000
 
 typedef struct {
@@ -95,10 +95,10 @@ milkymist_init(MachineState *machine)
 
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
2.16.2


