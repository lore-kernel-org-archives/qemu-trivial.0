Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteB-0003uD-8q
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:57:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkte3-0003pX-Fe
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktdw-0007Lb-Qa
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdY-0006wY-Ea; Fri, 16 Sep 2016 09:57:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA69C3B71E;
	Fri, 16 Sep 2016 13:56:58 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkL024127; Fri, 16 Sep 2016 09:56:57 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 16 Sep 2016 15:56:10 +0200
Message-Id: <1474034177-17663-20-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 16 Sep 2016 13:56:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 19/26] alpha: use exit(EXIT_SUCCESS) and
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
CC: Richard Henderson <rth@twiddle.net>
---
 hw/alpha/dp264.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f1267b5..d533d2f 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -110,14 +110,14 @@ static void clipper_init(MachineState *machine)
                                 bios_name ? bios_name : "palcode-clipper");
     if (palcode_filename == NULL) {
         error_report("no palcode provided");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     size = load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
                     NULL, &palcode_entry, &palcode_low, &palcode_high,
                     0, EM_ALPHA, 0, 0);
     if (size < 0) {
         error_report("could not load palcode '%s'", palcode_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     g_free(palcode_filename);
 
@@ -137,7 +137,7 @@ static void clipper_init(MachineState *machine)
                         0, EM_ALPHA, 0, 0);
         if (size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         cpus[0]->env.trap_arg1 = kernel_entry;
@@ -155,7 +155,7 @@ static void clipper_init(MachineState *machine)
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
                              initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             /* Put the initrd image as high in memory as possible.  */
-- 
2.5.5


