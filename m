Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSD-0005rB-F9
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSB-0005og-34
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSA-0003Mp-0M
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:03 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:40521)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS7-0003Kw-DF; Sun, 10 Jun 2018 21:16:59 -0400
Received: by mail-qk0-x235.google.com with SMTP id r66-v6so12067176qkr.7;
	Sun, 10 Jun 2018 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e4rAQDgc4IrFnB8r9yX3M8IOSgASkZXZB3UA0UkXeoM=;
	b=Nx09TW7/xPEsIGvA+hfOdUOqjEwZPWr2YCFTstT1zU8yaWRLK1YxBFaYLcZ5GElnII
	/aLpXz6jOjr5353NZoVk/m8fMKm9WMLnrPGbOq/SIBf3uN9SBwo7MXhlRyDT3zHBy5sQ
	6nVR0QUXo5uSDmS06uY2tJ+yC+LHJm50cznXbf2HCi8rRgVzTGhsigibAH4+7ln39JYb
	UaPpvLcM8pdy0K53JMBknCEFP7LUKuaC9uNO2ObLvEU+2h4t/bM/XqKQ69+LantGVPD3
	q4SytN9kO9IIIO188uFZwD6Ih6AQsqTB3CghtJDE+DpUAmrj/Xa3ihnw0gzAvXA/XHy6
	6e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=e4rAQDgc4IrFnB8r9yX3M8IOSgASkZXZB3UA0UkXeoM=;
	b=J2daXDRxAEc6I1KqNAxtzaCtEp2y8eguSlsu0NCwxS0J+WapUfT6A0LUXYYgeH8t4j
	OjfYCb9EOsIMwZ/38zIuxRGVXetiDAWRsPHslm/xWwDu3ikZRRL08GSJfwNw/qG0Qq/c
	j4CEd6jNI3br43GdSuNXt0Te0Lc8oEIRufYGzg8+NZ2yznmU1lRSz9zOCqLWZqhIlcoy
	3t/S/hlndyacgrlUyat9SvmAkJ9nlts1jV7ftAcDgXuOOqaxCTO9mHVbvEF5B2AJ2aGm
	mlW4MVLZYIHXkx/OwW1rZpi7Np19FeDw0RRzI175Kj3rRCD3mUN6WGtA7bff+iPjggBs
	1Hzg==
X-Gm-Message-State: APt69E3TZXwATJJOjIG31K3idSmNO3htqHQfhWQMfDXTa2MhtN2ATrdn
	FAqR+IHVncpG/3pKsxH+bIs=
X-Google-Smtp-Source: ADUXVKJHEkPzw2nzclCbeB51FTPct9G92B2Hs6nwh+ECup4DiUa0dgrLzajPtFI88iZYkWJC6lYhOQ==
X-Received: by 2002:a37:8f45:: with SMTP id
	r66-v6mr5356792qkd.47.1528679818932; 
	Sun, 10 Jun 2018 18:16:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>
Date: Sun, 10 Jun 2018 22:14:48 -0300
Message-Id: <20180611011501.10235-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v4 27/40] hw/lm32: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:04 -0000

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
2.17.1


