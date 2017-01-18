Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTeqZ-0003tB-5J
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 20:15:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTeqX-0003rz-9Y
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTeqW-0001ni-Aj
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:15:29 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:33047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTeqP-0001kb-OA; Tue, 17 Jan 2017 20:15:21 -0500
Received: by mail-pg0-x243.google.com with SMTP id 194so9281626pgd.0;
	Tue, 17 Jan 2017 17:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L1CSX4XOmywbv54uAAixvvhihH6Wi4dlnrVfx1KHoOY=;
	b=IlOUuhRR6C5TlIIRKAIQu6FHuK77oamSpzA+WWO4VujrOem8dRk0G7PxUVeOlz1O6s
	x7Cq4r2ztaXawdRfp9Ei1ebaosMGkevOokkmFJPhFXt2+v/fjXSGv+gJ+zzAWHAEHPgu
	+ADk69RaBINqYa0WBMufD+su5x8XllIj1/s+zjbVhqktQkMSf3v6/XCILI9pPapc6Vn2
	DkbDDt6SyLS/Es3ZbwJoAz9uiXl/cJikgEpl0qQMntFlC4f/Npj2BCyoB41dr4GSrAAn
	bTXGvndJXmjFsABqPyBam7+UTwg3Z07M3wX/IaIss+rMAnZh6L/JdjWcOFzyGOl5nzYE
	aCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L1CSX4XOmywbv54uAAixvvhihH6Wi4dlnrVfx1KHoOY=;
	b=r01R6h9uJQk6U1GvstO8iaVPwWYgQ0L5QKXhm9MI7rrDy2UF9kSrkyJsLdveJZ5I0T
	Xr2VY+pON3TtV0j6+9PuukfKB/B3QdqK8fMwcSSkKQauhruSV1SPmEIVPrHhkXfAVMO/
	vjPC8zNLkWjlaiA7NtuyyicIVMiA/MKl8+09rzmtPaK99HZasfJcjwBzy4qvZgBeImbr
	BuTWw1m1cMTrfYFOVP1ytHWKrueDqg/X4f32qRSVKOjCUxDRSeVvl+UfAXJQphKCZ0LL
	fg8Zp0KblPW6Le1jTixEfZ8ca4q9Gt08CqODmypK0gYNa1/30hWtIR2BCX6YIPLAcyk5
	kI7g==
X-Gm-Message-State: AIkVDXJsyHBnU5kYBm+TfY5ExyLWMBTufcEEv1QZsAWB5aEpKRdPESpuN9xZl02vDxnWjw==
X-Received: by 10.98.133.202 with SMTP id m71mr753528pfk.102.1484702120694;
	Tue, 17 Jan 2017 17:15:20 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189]) by smtp.gmail.com with ESMTPSA id
	18sm58905134pgf.28.2017.01.17.17.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 17:15:20 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Ziyue Yang <yzylivezh@hotmail.com>,
	Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 09:14:12 +0800
Message-Id: <1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-trivial] [PATCH v2] gdbstub.c: fix GDB connection segfault
 caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 01:15:30 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

This patch is to fix the segmentation fault caused by attaching
GDB to a QEMU instance initialized with "-M none" option.

The bug can be reproduced by

> ./qemu-system-x86_64 -M none -nographic -S -s

and attach a GDB to it by

> gdb -ex 'target remote :1234

The segmentation fault was originally caused by trying to read
the information about CPU when communicating with GDB. However,
it's impossible for any control flow to exist on an empty machine,
nor can CPU's be hot plugged to an empty machine later by QOM
commands. So I think simply disabling GDB connections on empty
machines makes sense.

Also some updates from fprintf(stderr, ...) to error_report.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 gdbstub.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index de62d26..3a22ce3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "cpu.h"
 #ifdef CONFIG_USER_ONLY
@@ -636,8 +637,8 @@ void gdb_register_coprocessor(CPUState *cpu,
     *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
-            fprintf(stderr, "Error: Bad gdb register numbering for '%s'\n"
-                    "Expected %d got %d\n", xml, g_pos, s->base_reg);
+            error_report("Error: Bad gdb register numbering for '%s'\n"
+                         "Expected %d got %d\n", xml, g_pos, s->base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
@@ -889,7 +890,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
     case 'k':
         /* Kill the target */
-        fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
+        error_report("\nQEMU: Terminated via GDBstub\n");
         exit(0);
     case 'D':
         /* Detach packet */
@@ -1357,8 +1358,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
                 break;
             default:
             bad_format:
-                fprintf(stderr, "gdbstub: Bad syscall format string '%s'\n",
-                        fmt - 1);
+                error_report("gdbstub: Bad syscall format string '%s'\n",
+                             fmt - 1);
                 break;
             }
         } else {
@@ -1731,6 +1732,12 @@ int gdbserver_start(const char *device)
     CharDriverState *mon_chr;
     ChardevCommon common = { 0 };

+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.\n");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
--
2.7.4


