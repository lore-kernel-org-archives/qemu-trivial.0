Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqS-0001Pr-W0
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqQ-0001MR-9L
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqP-0007io-0L
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:46 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqJ-0007eb-25; Mon, 25 Jun 2018 08:43:39 -0400
Received: by mail-qk0-x244.google.com with SMTP id u21-v6so1772449qku.2;
	Mon, 25 Jun 2018 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zh1e1cXNw3DKZtCDbdrfbkiCXZMg8qqGWos+WoeWfTo=;
	b=d6oc+CaW+PISqGSmMTdr9xF3OEPGtPlARTil1vu3sIM+TlTJMxhtXVxsHQbFbb5Kx4
	zl6qmbBIQBTu5cD9acetJ/EMy92NJVbQo9cRltGxrTRJ0kz5sN0UjiPlOSmNW+ML6uWV
	LPRMf4zg84LRGsOTgrcVs57WP9IfAZ8BaYiAbKfJRZYHVn3PJwWxnFhWQ2xyogOWjKm9
	lVRTrwKL7Ws3FAUJZUouh3xMYS/kpMbFFI7DRkFLx1VKF9xrsiOop8RnvUd4kL5pUlln
	8HKniTosWZkZ2DRW6om+eyX4nMEjwEmjpgJoj3B++BlpMeyNopk/gHaufc0w0vu/5IrM
	Bc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Zh1e1cXNw3DKZtCDbdrfbkiCXZMg8qqGWos+WoeWfTo=;
	b=dkvGjaZIJgTpgwo4DzJEHaRBptqZspDm8uqsYFcL+WHQs2E5s5xOgm8IrP7qASSLeF
	5BynITLAKVc7wTadAw0qPloCb7aUnpcqW+4ROtze+CM6SDT24lWwpdB45kL+fmpIzlAF
	dlBkPPlD82tIAcgFgCwt/Sp6AJx04WUHXbQqbyOgBxhGxK8xh3XmmmuxPFooCgO0zPPE
	nD6G0lPzPo3Y3jnmVm3UmZc+8Ih8JD+BGg0o21MqiJtkkBB7bb7QnyeowpY62Ifhg5Yq
	zpGZ3A6KixX7vM2QR75XjW2RvpJ6P1miy1QKRegE1JL7FIRp+6RsK4wAh9S6V5NuukD0
	D/8A==
X-Gm-Message-State: APt69E2LtDDkXm3GupgwoEXawPSM6QTKKTg7joZfRVfYZ3HCUUcvGfY6
	Tb/lCilM2A2hlQvpS5GdZq9AZ/dRnmo=
X-Google-Smtp-Source: ADUXVKKuUEc6bAea6WerfkU7xGNLUpDg7KygIoJez6lbcHMQPOH2qJ7XZSukk+XRHaT1V9ojTjp70w==
X-Received: by 2002:ae9:e113:: with SMTP id
	g19-v6mr10681764qkm.9.1529930618498; 
	Mon, 25 Jun 2018 05:43:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86),
	qemu-block@nongnu.org (open list:Block layer core)
Date: Mon, 25 Jun 2018 09:42:03 -0300
Message-Id: <20180625124238.25339-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v5 11/46] hw/xen: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:47 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alan Robinson <Alan.Robinson@ts.fujitsu.com>
---
 hw/block/xen_disk.c        |  3 ++-
 hw/i386/xen/xen-mapcache.c |  3 ++-
 hw/xenpv/xen_domainbuild.c | 13 +++++++------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index 9fbc0cdb87..36eff94f84 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -20,6 +20,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <sys/ioctl.h>
 #include <sys/uio.h>
 
@@ -814,7 +815,7 @@ static int blk_connect(struct XenDevice *xendev)
     xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename \"%s\","
                   " size %" PRId64 " (%" PRId64 " MB)\n",
                   blkdev->type, blkdev->fileproto, blkdev->filename,
-                  blkdev->file_size, blkdev->file_size >> 20);
+                  blkdev->file_size, blkdev->file_size / MiB);
 
     /* Fill in number of sector size and number of sectors */
     xenstore_write_be_int(xendev, "sector-size", blkdev->file_blk);
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 628b813a11..4e4f069a24 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 
 #include <sys/resource.h>
@@ -46,7 +47,7 @@
  * From empirical tests I observed that qemu use 75MB more than the
  * max_mcache_size.
  */
-#define NON_MCACHE_MEMORY_SIZE (80 * 1024 * 1024)
+#define NON_MCACHE_MEMORY_SIZE (80 * MiB)
 
 typedef struct MapCacheEntry {
     hwaddr paddr_index;
diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c
index 027f76fad1..188acaca16 100644
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
+    xenstore_write_int(dom, "memory/target", ram_size / KiB);
+    xenstore_write_int(vm, "memory",         ram_size / MiB);
+    xenstore_write_int(vm, "maxmem",         ram_size / MiB);
 
     /* cpus */
     for (i = 0; i < smp_cpus; i++) {
@@ -113,7 +114,7 @@ int xenstore_domain_init2(int xenstore_port, int xenstore_mfn,
 
     /* console */
     xenstore_write_str(dom, "console/type",     "ioemu");
-    xenstore_write_int(dom, "console/limit",    128 * 1024);
+    xenstore_write_int(dom, "console/limit",    128 * KiB);
     xenstore_write_int(dom, "console/ring-ref", console_mfn);
     xenstore_write_int(dom, "console/port",     console_port);
     xen_config_dev_console(0);
@@ -260,7 +261,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     }
 #endif
 
-    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size >> 10);
+    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size / KiB);
     if (rc < 0) {
         fprintf(stderr, "xen: xc_domain_setmaxmem() failed\n");
         goto err;
@@ -269,7 +270,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     xenstore_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
     console_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
 
-    rc = xc_linux_build(xen_xc, xen_domid, ram_size >> 20,
+    rc = xc_linux_build(xen_xc, xen_domid, ram_size / MiB,
                         kernel, ramdisk, cmdline,
                         0, flags,
                         xenstore_port, &xenstore_mfn,
-- 
2.18.0


