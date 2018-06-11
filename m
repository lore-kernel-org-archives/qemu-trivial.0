Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRs-0005Yn-OO
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRl-0005Ud-5o
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRk-00036a-0y
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:37 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:43813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRh-00033r-Dt; Sun, 10 Jun 2018 21:16:33 -0400
Received: by mail-qt0-x236.google.com with SMTP id y89-v6so18853657qtd.10;
	Sun, 10 Jun 2018 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0zHXyro76d9KMOvtUt9hnZNZ0IsWeXrBXNwvo8qmJr8=;
	b=ZsrvMfmsFdmfel1IhKLLd6dbALGGdNH3GuVhFNtp/YOA138j3HeFYsnCicLs1YA9Y1
	27dket6Yz34RoIduqKfYMq93fwxWZsj7TDWKJKF4GxzbH7h/HenMOxDvATFecEzH6W6o
	SrehA51Xyz6WHUaHjxsC1V9K23R48sUUwDFJw5sTFiTJxN2OW6/4JtlygOA8s0OiwknA
	DQp8A53UmItS87n5Ucb9pZnbfUP62LlOycBx6Ic/BxR75RfE8Zri6ev+3vx1BY8l4lmD
	GzyiRwRp8PsqMo6/Z0p7vwrx6hyGx29Anm8ImX18VlrBl0r1Iyo7UVhUUmuKLH28wLvo
	fyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0zHXyro76d9KMOvtUt9hnZNZ0IsWeXrBXNwvo8qmJr8=;
	b=UEhcUg/4F9oblkTtS/Ko9cIGEMvz4p8gXfjDx4H61bUiueX2pOAzQAH2tn36RZ9iad
	ta7nkoR5RHX8HQsNptMHF5V8OHdPEFuJREjWCLkcgqUdRYhO0vL/ztlp8yAdQFSExVFI
	5i1GXJJAvvep12QxW1TiIjqI+THsI5IvlMCHF3j4jSrR32O8tyHtFUfRHKxvOuHNJoG9
	oSdfod+HKZFee045kusEjPGRJz+hrimcSCTqJvuopExeUfMT0CmDZaA7FNmD44639wbt
	VBzZ2a2v0YWwiEtTr0KWaHMvSVgHez5SGGeLmnDmi6JKM5SE1F/aAQC6Rz9eog+i31Pa
	iHeA==
X-Gm-Message-State: APt69E0juYXm43EjyBHSmvjA9CHAW8xIDZ1y9mQOQY9mvm/IkCV7vf8J
	cSu+veNZHlzx5QUSLOP1RdA=
X-Google-Smtp-Source: ADUXVKK+4QfBbvdArxixSxRXHXnofce/u8d8U0uW+vG+4a5C8s/SQNkwysKMq+KnJSi0MW0V46pF4w==
X-Received: by 2002:ac8:2393:: with SMTP id
	q19-v6mr14225505qtq.197.1528679792970; 
	Sun, 10 Jun 2018 18:16:32 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:32 -0700 (PDT)
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
Date: Sun, 10 Jun 2018 22:14:39 -0300
Message-Id: <20180611011501.10235-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v4 18/40] hw/sparc: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:42 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/leon3.c     | 9 +++++----
 hw/sparc/sun4m.c     | 9 ++++-----
 hw/sparc64/niagara.c | 3 ++-
 hw/sparc64/sun4u.c   | 4 ++--
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 98fa6adae0..60400923d5 100644
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
@@ -139,9 +140,9 @@ static void leon3_generic_hw_init(MachineState *machine)
     env->qemu_irq_ack = leon3_irq_manager;
 
     /* Allocate RAM */
-    if ((uint64_t)ram_size > (1UL << 30)) {
-        error_report("Too much memory for this machine: %d, maximum 1G",
-                     (unsigned int)(ram_size / (1024 * 1024)));
+    if (ram_size > 1 * GiB) {
+        error_report("Too much memory for this machine: %lluMB, maximum 1G",
+                     ram_size / MiB);
         exit(1);
     }
 
@@ -149,7 +150,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Allocate BIOS */
-    prom_size = 8 * 1024 * 1024; /* 8Mb */
+    prom_size = 8 * MiB;
     memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
     memory_region_set_readonly(prom, true);
     memory_region_add_subregion(address_space_mem, 0x00000000, prom);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 0ee779fafe..d29411f013 100644
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
@@ -741,9 +741,8 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
 
     /* allocate RAM */
     if ((uint64_t)RAM_size > max_mem) {
-        error_report("Too much memory for this machine: %d, maximum %d",
-                     (unsigned int)(RAM_size / (1024 * 1024)),
-                     (unsigned int)(max_mem / (1024 * 1024)));
+        error_report("Too much memory for this machine: %llu, maximum %llu",
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
index 1bede85370..fd07b36226 100644
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
2.17.1


