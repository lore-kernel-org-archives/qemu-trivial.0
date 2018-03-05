Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHf-0003SA-TS
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHb-0003M6-4r
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHa-0006uZ-51
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:55 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:50230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHZ-0006tp-Tq; Mon, 05 Mar 2018 06:27:54 -0500
Received: by mail-wm0-x242.google.com with SMTP id w128so15141176wmw.0;
	Mon, 05 Mar 2018 03:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0Lj2Rf5nVc6l0CdCrfLrlc7lUZaBlFucoPUC6EuwWXQ=;
	b=PY+NFG9gBoS9bWEjq2DInPqoues6kGmXx3t4/B8ntkyfzar0Kocqq+k3auRXqHqre0
	rGfCnp9MX0uQmhjTmVlBqVcn/+9+CeFVAQd2M+mmy6zPSBNrLK1jn6W0SR8RBYJYcJSY
	dOs+YXATeziGhUyOEBa+bwg7TtygRWOvYTl5F/0eZdUMt3wp5FQhxK+R/JyEEOlMf1gh
	pH8GN5jK1kHgV9t8IRKExO1NPAn8zN92X33/bKmMqiUrbAci6VyXazrNQhEYsaVzpHon
	CC5zvvOB8JAeUWNIyKLFBW8WvDdpnSxXgtz+k58HM4ts+VT2Tf1g2QQpvZxkc0j2O6bW
	i/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0Lj2Rf5nVc6l0CdCrfLrlc7lUZaBlFucoPUC6EuwWXQ=;
	b=DwRr83vNfNb+Theo1CefCsVnWLNg0GxU9tW0WTFnnbZ2KncLjYvWzkefqWSDaQqdKn
	KmzI3z1ka8pG7rLtvxo6T5EFSxg4vt9XC+asIetq0e8JEfP/5r9QrAA1aqF+N61eAONP
	N/mio6NZW4XhL2712NKYRjz6rHUfW+YQ4kNx1XsFwx/AK7rXkStNajzUdCX/2976VXKh
	hCB0EH4fkxAUm6LAYtDklwss+B8HSTd/jRRXaT7piFqGTU2bAVGJif6jBPa1f/h0lROe
	eInG5151B3th3FlE32yJfIupt7+vNToolYq7A7hqD/EJk1RBIk1oJWA9q9DtyJgYZgGu
	zR6A==
X-Gm-Message-State: AElRT7HhHHcqy/uNJiJYnc/hxK4/SiRwEb+TR+KWiCjjxbUBO71RihyI
	JOyQdIiIYqqoQIIRGgIdLdkXhL/4
X-Google-Smtp-Source: AG47ELst5B2xlqYXGUfrWG5kgL69k6wA+1augrd5m/iJn7N/FC3G96o7urtUBG6e2e0D/0LR2qH6ow==
X-Received: by 10.28.232.16 with SMTP id f16mr8601074wmh.92.1520249272681;
	Mon, 05 Mar 2018 03:27:52 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:52 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Fabien Chouteau <chouteau@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon,  5 Mar 2018 08:27:11 -0300
Message-Id: <20180305112732.26471-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 09/30] hw/sparc: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:56 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/leon3.c     | 8 ++++----
 hw/sparc/sun4m.c     | 7 +++----
 hw/sparc64/niagara.c | 2 +-
 hw/sparc64/sun4u.c   | 2 +-
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index bba3aa3dee..31be3f32b0 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -139,9 +139,9 @@ static void leon3_generic_hw_init(MachineState *machine)
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
 
@@ -149,7 +149,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Allocate BIOS */
-    prom_size = 8 * 1024 * 1024; /* 8Mb */
+    prom_size = 8 * M_BYTE;
     memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
     memory_region_set_readonly(prom, true);
     memory_region_add_subregion(address_space_mem, 0x00000000, prom);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9d82490794..01b4d0c36e 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -66,7 +66,7 @@
 #define KERNEL_LOAD_ADDR     0x00004000
 #define CMDLINE_ADDR         0x007ff000
 #define INITRD_LOAD_ADDR     0x00800000
-#define PROM_SIZE_MAX        (1024 * 1024)
+#define PROM_SIZE_MAX        (1 * M_BYTE)
 #define PROM_VADDR           0xffd00000
 #define PROM_FILENAME        "openbios-sparc32"
 #define CFG_ADDR             0xd00000510ULL
@@ -744,9 +744,8 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
 
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
index 1874477ef6..97a78ca9a2 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -84,7 +84,7 @@ typedef struct NiagaraBoardState {
 #define NIAGARA_PROM_BASE   0xfff0000000ULL
 #define NIAGARA_Q_OFFSET    0x10000ULL
 #define NIAGARA_OBP_OFFSET  0x80000ULL
-#define PROM_SIZE_MAX       (4 * 1024 * 1024)
+#define PROM_SIZE_MAX       (4 * M_BYTE)
 
 static void add_rom_or_fail(const char *file, const hwaddr addr)
 {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index b84589e0b6..7a39ec7859 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -53,7 +53,7 @@
 
 #define KERNEL_LOAD_ADDR     0x00404000
 #define CMDLINE_ADDR         0x003ff000
-#define PROM_SIZE_MAX        (4 * 1024 * 1024)
+#define PROM_SIZE_MAX        (4 * M_BYTE)
 #define PROM_VADDR           0x000ffd00000ULL
 #define PBM_SPECIAL_BASE     0x1fe00000000ULL
 #define PBM_MEM_BASE         0x1ff00000000ULL
-- 
2.16.2


