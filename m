Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktea-0004Fj-JR
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteY-0004CK-DR
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteS-0007mR-Dz
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteH-0007aE-HA; Fri, 16 Sep 2016 09:57:49 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E547764080;
	Fri, 16 Sep 2016 13:57:10 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkR024127; Fri, 16 Sep 2016 09:57:09 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:56:16 +0200
Message-Id: <1474034177-17663-26-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Sep 2016 13:57:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 25/26] hw: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:07 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/display/ssd0303.c  | 3 ++-
 hw/i2c/smbus.c        | 3 ++-
 hw/moxie/moxiesim.c   | 8 ++++----
 hw/nvram/eeprom93xx.c | 2 +-
 hw/nvram/fw_cfg.c     | 2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index d301756..bc01d0a 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -20,7 +20,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("ssd0303: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "ssd0303: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "ssd0303: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
diff --git a/hw/i2c/smbus.c b/hw/i2c/smbus.c
index 3979b3d..38928cf 100644
--- a/hw/i2c/smbus.c
+++ b/hw/i2c/smbus.c
@@ -20,7 +20,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("smbus(%02x): " fmt , dev->i2c.address, ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "smbus: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "smbus: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3069834..9adae85 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -63,7 +63,7 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *loader_params)
     if (kernel_size <= 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loader_params->kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* load initrd */
@@ -78,7 +78,7 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *loader_params)
                 fprintf(stderr,
                         "qemu: memory too small for initial ram disk '%s'\n",
                         loader_params->initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             initrd_size = load_image_targphys(loader_params->initrd_filename,
                                               initrd_offset,
@@ -87,7 +87,7 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *loader_params)
         if (initrd_size == (target_ulong)-1) {
             fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                     loader_params->initrd_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -121,7 +121,7 @@ static void moxiesim_init(MachineState *machine)
     cpu = cpu_moxie_init(cpu_model);
     if (!cpu) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index 2c16fc2..b0ddda6 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -105,7 +105,7 @@ static void put_unused(QEMUFile *f, void *pv, size_t size)
 {
     fprintf(stderr, "uint16_from_uint8 is used only for backwards compatibility.\n");
     fprintf(stderr, "Never should be used to write a new state.\n");
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 static const VMStateInfo vmstate_hack_uint16_from_uint8 = {
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 1776b1b..07bb06d 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -807,7 +807,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
             strcmp(s->files->f[index].name, s->files->f[i].name) == 0) {
             error_report("duplicate fw_cfg file name: %s",
                          s->files->f[index].name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
-- 
2.5.5


