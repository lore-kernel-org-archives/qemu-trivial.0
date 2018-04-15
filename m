Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJk-00059Z-Gm
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJh-00055z-6z
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJf-0000j4-Rc
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:17 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJf-0000il-Np; Sun, 15 Apr 2018 19:44:15 -0400
Received: by mail-qk0-x244.google.com with SMTP id l16so13888377qke.13;
	Sun, 15 Apr 2018 16:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gTVL82UkbYbEWWn0JSjI3uvUGGJderjGTccnC7ex5pY=;
	b=W5atonmxfdEWRih9PfiH1cBUJ1Lgv0pOe3lBTSetDcSeGj3/VAtpPNVpJ89Lx9NwG7
	etlfLKXLH/ZzQRtx3HXTOE2Df9rqJsD1203ISU6DiIknPIl9teSwuDM4kX04rIjPPKy3
	J9kUO49En+hPSsGP8HJopucZKDxy+RtNbb2YdYTHk41PxGud1ON7pvqqiN72HmCknvN4
	CqcTBUFseXKf/Cj3aB4DMVp5nhW5jtnHNXdH5GyBuo7vx7ISSkKsYr/LkCbM+o1Jbmnp
	hfXbSqENLeopaBA5+vXcHZsQhKJ3RsxC+yx2dQXJ2HJS59srAj96veTDsg1hyu2Za9gM
	YwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gTVL82UkbYbEWWn0JSjI3uvUGGJderjGTccnC7ex5pY=;
	b=FXncrMRbg0yyi1/PawtSmeYVAf+brF+ymY1YS/0YE7rhtqpVP5Y1nkNQhBJQmstqtu
	mNfjLQte4KOLBC1t1OZnOmYE9idWw+pzkgRi959Y9qL9xUB/RmyZ0iDQVl9gRQX4NsRk
	ShHiX+GUA8ypf0rB6wrZo/WK18in1S07WWQd8NOiZoMrFMQXWSiyRnHBnTUEZCKMq3/4
	qeS3ZIQMNIquBzsPah3D88fBz5xIdx4YKMs1zU8wvjzt28edatwq81YRb65nSOOItBJH
	eMowG5ofsdw/Gnm11qqa5vhbnr5QcV8kmZjL42ab72FGAnQSfdtRRmrJ1Dbs3B8y3Zg5
	4d4Q==
X-Gm-Message-State: ALQs6tAPi6dARhBjyKMZ1quq32HQ9E5XMIo776ubDXWEHP05MZ5wx6ws
	nrGOkiY0/LKir3/6HT60/tJlhhT6
X-Google-Smtp-Source: AIpwx4/QYi9CPxJFH34LeBi2yLNfkm+KKDRyZkXQqdEdM0D6hc8H132ivfssn3uw2U9oR28T7v7VZw==
X-Received: by 10.55.150.67 with SMTP id y64mr14795393qkd.318.1523835855000;
	Sun, 15 Apr 2018 16:44:15 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Fabien Chouteau <chouteau@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Date: Sun, 15 Apr 2018 20:42:44 -0300
Message-Id: <20180415234307.28132-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 18/41] hw/sparc: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:18 -0000

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
index bba3aa3dee..97e13fab6d 100644
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
+    if (ram_size > 1 * G_BYTE) {
+        error_report("Too much memory for this machine: %lluMB, maximum 1G",
+                     ram_size / M_BYTE);
         exit(1);
     }
 
@@ -149,7 +150,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Allocate BIOS */
-    prom_size = 8 * 1024 * 1024; /* 8Mb */
+    prom_size = 8 * M_BYTE;
     memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
     memory_region_set_readonly(prom, true);
     memory_region_add_subregion(address_space_mem, 0x00000000, prom);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 6471aca25d..320122f1b5 100644
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
+#define PROM_SIZE_MAX        (1 * M_BYTE)
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
+                     RAM_size / M_BYTE, max_mem / M_BYTE);
         exit(1);
     }
     dev = qdev_create(NULL, "memory");
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 1874477ef6..957d98ef83 100644
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
+#define PROM_SIZE_MAX       (4 * M_BYTE)
 
 static void add_rom_or_fail(const char *file, const hwaddr addr)
 {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 2044a52ded..f424f362ac 100644
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
+#define PROM_SIZE_MAX        (4 * M_BYTE)
 #define PROM_VADDR           0x000ffd00000ULL
 #define PBM_SPECIAL_BASE     0x1fe00000000ULL
 #define PBM_MEM_BASE         0x1ff00000000ULL
-- 
2.17.0


