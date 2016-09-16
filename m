Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteL-000433-TL
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:57:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteF-0003wO-RS
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkte8-0007Tg-5g
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdG-0006h8-3z; Fri, 16 Sep 2016 09:57:24 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 407357F77D;
	Fri, 16 Sep 2016 13:56:40 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkC024127; Fri, 16 Sep 2016 09:56:38 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:56:01 +0200
Message-Id: <1474034177-17663-11-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Sep 2016 13:56:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 10/26] m68k: use exit(EXIT_SUCCESS) and
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
X-List-Received-Date: Fri, 16 Sep 2016 13:57:53 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/m68k/an5206.c     | 6 +++---
 hw/m68k/dummy_m68k.c | 4 ++--
 hw/m68k/mcf5208.c    | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index 142bab9..9c2cb1e 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -45,7 +45,7 @@ static void an5206_init(MachineState *machine)
     cpu = cpu_m68k_init(cpu_model);
     if (!cpu) {
         error_report("Unable to find m68k CPU definition");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -72,7 +72,7 @@ static void an5206_init(MachineState *machine)
             return;
         }
         fprintf(stderr, "Kernel image must be specified\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
@@ -89,7 +89,7 @@ static void an5206_init(MachineState *machine)
     }
     if (kernel_size < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     env->pc = entry;
diff --git a/hw/m68k/dummy_m68k.c b/hw/m68k/dummy_m68k.c
index 0b11d20..09981a0 100644
--- a/hw/m68k/dummy_m68k.c
+++ b/hw/m68k/dummy_m68k.c
@@ -37,7 +37,7 @@ static void dummy_m68k_init(MachineState *machine)
     cpu = cpu_m68k_init(cpu_model);
     if (!cpu) {
         fprintf(stderr, "Unable to find m68k CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -67,7 +67,7 @@ static void dummy_m68k_init(MachineState *machine)
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         entry = 0;
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 2415557..3c833ba 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -213,7 +213,7 @@ static void mcf5208evb_init(MachineState *machine)
     cpu = cpu_m68k_init(cpu_model);
     if (!cpu) {
         fprintf(stderr, "Unable to find m68k CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -241,7 +241,7 @@ static void mcf5208evb_init(MachineState *machine)
 
     if (nb_nics > 1) {
         fprintf(stderr, "Too many NICs\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (nd_table[0].used)
         mcf_fec_init(address_space_mem, &nd_table[0],
@@ -275,7 +275,7 @@ static void mcf5208evb_init(MachineState *machine)
             return;
         }
         fprintf(stderr, "Kernel image must be specified\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
@@ -292,7 +292,7 @@ static void mcf5208evb_init(MachineState *machine)
     }
     if (kernel_size < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     env->pc = entry;
-- 
2.5.5


