Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJL-0004jZ-T7
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJJ-0004ge-7V
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJI-0000Tw-2r
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:53 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJH-0000Te-TF; Sun, 15 Apr 2018 19:43:52 -0400
Received: by mail-qt0-x241.google.com with SMTP id j26so13541368qtl.11;
	Sun, 15 Apr 2018 16:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qztg7l/Hs5qpnYQ/jpHSyFxJmpJAv6GCBe0SMlGi1jU=;
	b=lF7N9gIFnnJc/MIXnu6iNsygM0pQPBw3VB7PJE5TjdW8JzOrpTfDf9InZqjTFEa5MH
	TciJv5BNkXhcjo+oHkZcZEqoROunhUDhC7iyGFn6LlQ/RUvr9Qg382A4DJZ+Ss7rY+2D
	XU64Y9dmLQQYKdqi6xhDYxlk8rnb1L8E16fsyxF+42TWTH8VbY5CX3tWTzxE+cqpxMP5
	hfHdIedr4FXgpuJIQvH7y/KnxhfZIORx5OdQNPU5WQnMNa4VoXwXf3GTnnnYxVA/2P94
	d/XN0ygLd4eMksKn6+4ZU+6QS9Kz9FSD1iKaDa2jtzcC+Jjb+OBQdIMkuAZfsYYquniI
	ULCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qztg7l/Hs5qpnYQ/jpHSyFxJmpJAv6GCBe0SMlGi1jU=;
	b=rmLzSxGXVvlS5NnGhEtBjXcGTudLT0nhH9gLf8Upv0PUfoRTFmJUIJHAs2xcaCF68b
	rI70rmwgE5DZkYTKQP9+5oll3YVknGSgilWmjXiB1roZiLGmqgLT2wvXYEpFxSMzByzZ
	G/rJM2QPN9LFixSNLll7hgOhdXIhKHAY20XOTbqPAFqDpUm4eBme44jsIFv6GnmNE9O7
	zozA6JwBCVK9W5klk13hqgtumZAYmp098Wu5OgJ/MyJ1e8rkPaVitgi5utraikZzdMqG
	Se3Wc+ekV2c7f4fRIOL4xpy2VdXErBoT+3j/3rMJAgfOE5HM77jTY5qfExoCNhWVNZEG
	HPXg==
X-Gm-Message-State: ALQs6tA2BSgyFUieRXhPfLV7h46qcne18rp+DPS8/SGru44wStmprQDq
	2+q0AwAo7M6dMIkeAzHMhC6tAk14
X-Google-Smtp-Source: AIpwx49eZ5Lr8Rcg7e8MVqy83ugFVFe/UwKfhyK7q+tubrRT3thBTePWGaJsqL2WVv4w8vAXCZWlww==
X-Received: by 10.200.81.210 with SMTP id d18mr14195832qtn.183.1523835831045; 
	Sun, 15 Apr 2018 16:43:51 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86),
	qemu-block@nongnu.org (open list:Block layer core)
Date: Sun, 15 Apr 2018 20:42:37 -0300
Message-Id: <20180415234307.28132-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 11/41] hw/xen: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:54 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alan Robinson <Alan.Robinson@ts.fujitsu.com>
---
 hw/block/xen_disk.c        |  5 +++--
 hw/i386/xen/xen-mapcache.c |  3 ++-
 hw/xenpv/xen_domainbuild.c | 13 +++++++------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index f74fcd42d1..c342106fd5 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -20,6 +20,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <sys/ioctl.h>
 #include <sys/uio.h>
 
@@ -1153,9 +1154,9 @@ static int blk_connect(struct XenDevice *xendev)
     }
 
     xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename \"%s\","
-                  " size %" PRId64 " (%" PRId64 " MB)\n",
+                  " size %" PRId64 " (%llu MB)\n",
                   blkdev->type, blkdev->fileproto, blkdev->filename,
-                  blkdev->file_size, blkdev->file_size >> 20);
+                  blkdev->file_size, blkdev->file_size / M_BYTE);
 
     /* Fill in number of sector size and number of sectors */
     xenstore_write_be_int(&blkdev->xendev, "sector-size", blkdev->file_blk);
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index efa35dc6e0..068347495c 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 
 #include <sys/resource.h>
@@ -47,7 +48,7 @@
  * From empirical tests I observed that qemu use 75MB more than the
  * max_mcache_size.
  */
-#define NON_MCACHE_MEMORY_SIZE (80 * 1024 * 1024)
+#define NON_MCACHE_MEMORY_SIZE (80 * M_BYTE)
 
 typedef struct MapCacheEntry {
     hwaddr paddr_index;
diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c
index 027f76fad1..4c77bb70a7 100644
--- a/hw/xenpv/xen_domainbuild.c
+++ b/hw/xenpv/xen_domainbuild.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/xen/xen_backend.h"
 #include "xen_domainbuild.h"
 #include "qemu/timer.h"
@@ -75,9 +76,9 @@ int xenstore_domain_init1(const char *kernel, const char *ramdisk,
     xenstore_write_str(dom, "vm",     vm);
 
     /* memory */
-    xenstore_write_int(dom, "memory/target", ram_size >> 10);  // kB
-    xenstore_write_int(vm, "memory",         ram_size >> 20);  // MB
-    xenstore_write_int(vm, "maxmem",         ram_size >> 20);  // MB
+    xenstore_write_int(dom, "memory/target", ram_size / K_BYTE);
+    xenstore_write_int(vm, "memory",         ram_size / M_BYTE);
+    xenstore_write_int(vm, "maxmem",         ram_size / M_BYTE);
 
     /* cpus */
     for (i = 0; i < smp_cpus; i++) {
@@ -113,7 +114,7 @@ int xenstore_domain_init2(int xenstore_port, int xenstore_mfn,
 
     /* console */
     xenstore_write_str(dom, "console/type",     "ioemu");
-    xenstore_write_int(dom, "console/limit",    128 * 1024);
+    xenstore_write_int(dom, "console/limit",    128 * K_BYTE);
     xenstore_write_int(dom, "console/ring-ref", console_mfn);
     xenstore_write_int(dom, "console/port",     console_port);
     xen_config_dev_console(0);
@@ -260,7 +261,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     }
 #endif
 
-    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size >> 10);
+    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size / K_BYTE);
     if (rc < 0) {
         fprintf(stderr, "xen: xc_domain_setmaxmem() failed\n");
         goto err;
@@ -269,7 +270,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     xenstore_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
     console_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
 
-    rc = xc_linux_build(xen_xc, xen_domid, ram_size >> 20,
+    rc = xc_linux_build(xen_xc, xen_domid, ram_size / M_BYTE,
                         kernel, ramdisk, cmdline,
                         0, flags,
                         xenstore_port, &xenstore_mfn,
-- 
2.17.0


