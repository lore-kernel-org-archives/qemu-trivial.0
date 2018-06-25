Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqq-0001pB-Iu
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqk-0001kj-0H
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqi-0007u5-L4
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:06 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqe-0007qP-TS; Mon, 25 Jun 2018 08:44:00 -0400
Received: by mail-qt0-x243.google.com with SMTP id b20-v6so2516267qtp.1;
	Mon, 25 Jun 2018 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iz3ZQ0yZHAFsCyyHxKIGPQYYa7aYo+6g0CaIB6xqMS4=;
	b=ZU3K/EqiZ55S6uzRjh1MRh1esoOyNM5JEM9x6YH90UxseUc7NdqoRgUszOiiZPpeBs
	w09VD3rIdL5RZS6rTI09oF8ERO2zl1F8YTwEcrJ2ETvRBVcgw6O1T/didf2ZrZ8Yp3yk
	GKHeKU3uH2CPbsy/nYw/dOhXkk+uPKyjH7CHrtZvgpmu8ps4jW7lcME8WyADN6qSG3oQ
	dmC+n/YV2X3a+qE42Jv6x5anbXNSDZ0qfgCk62ZCGbI0BQyQ47gqK/8bH4l4lLF2+BoH
	0TZuBaCSFfzV4s7ONqhL6NM2SQ9dW8CAdNJ6taY2xqlQMK+piZ1b55akJKDgDS0l80G8
	dXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iz3ZQ0yZHAFsCyyHxKIGPQYYa7aYo+6g0CaIB6xqMS4=;
	b=EiGWf+66LBRhEomsNjxF0XE6cylqULSuHetrvxwq4rSMxf65aop94deTiX8udsuVQv
	oGlCtP8aAs7E+qZ6ySg6nSbuCyMY2ACUTfafN1j6Dtm/wVhbIOT/nxIs3vbsBI2Yoywc
	aBN3W4PEWWDBhxsvpaPUI5/9C8aAT+YCjMkOy7Oe6p+orG0SHUKsPTElEmbQqwDVpXGE
	VXgDnl4oskZOoz9F53p70p5ykHBNplT0rXslBDGbDR28Ffb4XRk+8iQV8F8fdKsLSIwS
	1c505NdyXBqoJ6Ja3Y6Zc4kkBSxfVsaGGdDygmqJ8dozuH/+HOa1w++6tXcrseeSrI1d
	OE6A==
X-Gm-Message-State: APt69E17M2HMy4gcc4wVHn9/ryICSMhO3fYmbMZDbNGcsUzMITqOeCMT
	cFfHcajVTe98a2xwc+c17sYappkH7CQ=
X-Google-Smtp-Source: ADUXVKJFj7ay4MCnBdT4Fg/ymkUhVNWukuRlKkpZ1TyjKN3iPNzQmmPpAhPSGb4bkPMV6mlVoM7Rdw==
X-Received: by 2002:ac8:4703:: with SMTP id
	f3-v6mr7484839qtp.176.1529930640385; 
	Mon, 25 Jun 2018 05:44:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon, 25 Jun 2018 09:42:10 -0300
Message-Id: <20180625124238.25339-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v5 18/46] hw/sparc: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:11 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/leon3.c     | 10 ++++++----
 hw/sparc/sun4m.c     | 10 +++++-----
 hw/sparc64/niagara.c |  3 ++-
 hw/sparc64/sun4u.c   |  4 ++--
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 98fa6adae0..fa98ab8177 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -139,9 +140,10 @@ static void leon3_generic_hw_init(MachineState *machine)
     env->qemu_irq_ack = leon3_irq_manager;
 
     /* Allocate RAM */
-    if ((uint64_t)ram_size > (1UL << 30)) {
-        error_report("Too much memory for this machine: %d, maximum 1G",
-                     (unsigned int)(ram_size / (1024 * 1024)));
+    if (ram_size > 1 * GiB) {
+        error_report("Too much memory for this machine: %" PRId64 "MB,"
+                     " maximum 1G",
+                     ram_size / MiB);
         exit(1);
     }
 
@@ -149,7 +151,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Allocate BIOS */
-    prom_size = 8 * 1024 * 1024; /* 8Mb */
+    prom_size = 8 * MiB;
     memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
     memory_region_set_readonly(prom, true);
     memory_region_add_subregion(address_space_mem, 0x00000000, prom);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index b984d2da0e..a9d477572e 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -45,7 +46,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "trace.h"
-#include "qemu/cutils.h"
 
 /*
  * Sun4m architecture was used in the following machines:
@@ -66,7 +66,7 @@
 #define KERNEL_LOAD_ADDR     0x00004000
 #define CMDLINE_ADDR         0x007ff000
 #define INITRD_LOAD_ADDR     0x00800000
-#define PROM_SIZE_MAX        (1024 * 1024)
+#define PROM_SIZE_MAX        (1 * MiB)
 #define PROM_VADDR           0xffd00000
 #define PROM_FILENAME        "openbios-sparc32"
 #define CFG_ADDR             0xd00000510ULL
@@ -774,9 +774,9 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
 
     /* allocate RAM */
     if ((uint64_t)RAM_size > max_mem) {
-        error_report("Too much memory for this machine: %d, maximum %d",
-                     (unsigned int)(RAM_size / (1024 * 1024)),
-                     (unsigned int)(max_mem / (1024 * 1024)));
+        error_report("Too much memory for this machine: %" PRId64 ","
+                     " maximum %" PRId64,
+                     RAM_size / MiB, max_mem / MiB);
         exit(1);
     }
     dev = qdev_create(NULL, "memory");
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 22c4655fde..4fa8cb2904 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -84,7 +85,7 @@ typedef struct NiagaraBoardState {
 #define NIAGARA_PROM_BASE   0xfff0000000ULL
 #define NIAGARA_Q_OFFSET    0x10000ULL
 #define NIAGARA_OBP_OFFSET  0x80000ULL
-#define PROM_SIZE_MAX       (4 * 1024 * 1024)
+#define PROM_SIZE_MAX       (4 * MiB)
 
 static void add_rom_or_fail(const char *file, const hwaddr addr)
 {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 3975a7b65a..97d1269346 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -52,11 +53,10 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "trace.h"
-#include "qemu/cutils.h"
 
 #define KERNEL_LOAD_ADDR     0x00404000
 #define CMDLINE_ADDR         0x003ff000
-#define PROM_SIZE_MAX        (4 * 1024 * 1024)
+#define PROM_SIZE_MAX        (4 * MiB)
 #define PROM_VADDR           0x000ffd00000ULL
 #define PBM_SPECIAL_BASE     0x1fe00000000ULL
 #define PBM_MEM_BASE         0x1ff00000000ULL
-- 
2.18.0


