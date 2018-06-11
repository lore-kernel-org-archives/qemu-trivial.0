Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRO-0005Dg-LJ
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRK-0005A1-Ib
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRJ-0002pD-Ch
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:10 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRG-0002nL-GI; Sun, 10 Jun 2018 21:16:06 -0400
Received: by mail-qk0-x243.google.com with SMTP id j12-v6so12069338qkk.4;
	Sun, 10 Jun 2018 18:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LIe0lg/MU8ruSyzR1OPbweY9ibc4mJZnd7V5QjuxhiY=;
	b=cOqiHu4guBipWqyO21pqV4K06K+xXL1Zg48Qvsuen62wLh2gEQvoZhFEKNdxlv6Fbf
	2+LBgPMm9i9fMuWS5YZwXuHWRTWARFr8WtuBeYD+FLXwXX6eDvYJzpQiuOhRsxhLZTEL
	tw48zyiuAftmWwb6edQpRdRIMc+XCHPQZc1BwNh48JxpcTUOwDQiJUKXNw26SV9QUPTy
	268D0G+8TOPaf/1daRWF2jM/Ppc6q5Ne/qxTaG2Io8Fq9Ek/XDJPMKBjNftAnp2Fg0qQ
	V7fDVmsGLdmwJYquIfskna74H+rhdk/z6G1uMVKGeyYH+hgjlJzcPf+zxLY6TCswiX7J
	2bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LIe0lg/MU8ruSyzR1OPbweY9ibc4mJZnd7V5QjuxhiY=;
	b=YmF0fcf2bLd1vMxVGOcjCml6xIa4jCGeOGCo91JR5mzKwCeYU3Xv7bAYwawrsq7VlG
	aQFgyFs1B7hXv3/rji/Aeu1HbKAws14h61NFU1vigUxH4GwV6+ytF1XA3GneoH1gYd1y
	vzQEOeFB23mXbbH5CMCykzCvEssqZccut6o4xPjkD8hSPFfRVfJAULcR5JRAMkHtLR24
	vn3YS6p7p2L51S7rXBZm9BOX914PS3h7d3oKKby3us+Gn1lfoy4LKDnbXu/k5/cVf9Yb
	KqihTboNllPf6NXNPYJ2yb+P4AK/TLov8vdwLqkJdMddYbziGWVTzwa0LKSO1TsVmGky
	RZuA==
X-Gm-Message-State: APt69E1JH7nc0HrbCRwGXwlFg2DqRZSyWIxBMOsGRlOIKbJUSkHxZu1I
	FWruFQEuVakpPvMOX4pA+tc=
X-Google-Smtp-Source: ADUXVKKcxi1X5b/T9Fcm1FzQsWCybT4oZeZmeuXqmo+rih2Q1CFn4GqnzbzN1x/mP5YQwNA9wUMvrg==
X-Received: by 2002:a37:7e04:: with SMTP id
	z4-v6mr12563977qkc.298.1528679766012; 
	Sun, 10 Jun 2018 18:16:06 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86),
	qemu-block@nongnu.org (open list:Block layer core)
Date: Sun, 10 Jun 2018 22:14:32 -0300
Message-Id: <20180611011501.10235-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 11/40] hw/xen: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:13 -0000

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
index 9fbc0cdb87..5e7f17ffa4 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -20,6 +20,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <sys/ioctl.h>
 #include <sys/uio.h>
 
@@ -812,9 +813,9 @@ static int blk_connect(struct XenDevice *xendev)
     }
 
     xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename \"%s\","
-                  " size %" PRId64 " (%" PRId64 " MB)\n",
+                  " size %" PRId64 " (%llu MB)\n",
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
2.17.1


