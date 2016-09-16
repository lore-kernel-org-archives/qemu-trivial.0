Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteA-0003tm-Rt
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:57:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkte2-0003pV-HK
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktdw-0007LP-OO
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktde-00075v-NV; Fri, 16 Sep 2016 09:57:11 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CD4F1555C;
	Fri, 16 Sep 2016 13:56:46 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkF024127; Fri, 16 Sep 2016 09:56:44 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Date: Fri, 16 Sep 2016 15:56:04 +0200
Message-Id: <1474034177-17663-14-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 16 Sep 2016 13:56:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 13/26] sh4: use exit(EXIT_SUCCESS) and
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
X-List-Received-Date: Fri, 16 Sep 2016 13:57:41 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Aurelien Jarno <aurelien@aurel32.net>
---
 hw/sh4/r2d.c  | 6 +++---
 hw/sh4/shix.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index db373c7..537ef52 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -249,7 +249,7 @@ static void r2d_init(MachineState *machine)
     cpu = cpu_sh4_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -318,7 +318,7 @@ static void r2d_init(MachineState *machine)
                                           INITRD_LOAD_OFFSET - LINUX_LOAD_OFFSET);
         if (kernel_size < 0) {
           fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
-          exit(1);
+          exit(EXIT_FAILURE);
         }
 
         /* initialization which should be done by firmware */
@@ -338,7 +338,7 @@ static void r2d_init(MachineState *machine)
 
         if (initrd_size < 0) {
           fprintf(stderr, "qemu: could not load initrd '%s'\n", initrd_filename);
-          exit(1);
+          exit(EXIT_FAILURE);
         }
 
         /* initialization which should be done by firmware */
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index 14d4007..977b8e4 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -59,7 +59,7 @@ static void shix_init(MachineState *machine)
     cpu = cpu_sh4_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Allocate memory space */
@@ -82,7 +82,7 @@ static void shix_init(MachineState *machine)
     ret = load_image_targphys(bios_name, 0, 0x4000);
     if (ret < 0 && !qtest_enabled()) {
         error_report("Could not load SHIX bios '%s'", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Register peripherals */
-- 
2.5.5


