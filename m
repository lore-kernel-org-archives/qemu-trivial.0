Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTf3V-0007aZ-UP
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 20:28:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTf3T-0007ZG-R0
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTf3S-0008OQ-UF
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:28:51 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:32873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTf3N-0008Kq-Lw; Tue, 17 Jan 2017 20:28:45 -0500
Received: by mail-pf0-x241.google.com with SMTP id e4so6950527pfg.0;
	Tue, 17 Jan 2017 17:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YMlKY8pmASgTyxvIRP8no7TBUHXD69rjQQljuv5SCw0=;
	b=GH4kFtLe+33yhjqyUNU//oBGhaf7uY8dZZkpmsY/4ttacYLodstHbAeQkHMMcXgNNc
	7zjv+DY9wjq6DXGfMCFPBw0dBNXqnZ2XJd4xPLow4oUVMH1kwbG743pvhvQukapIRS9a
	5R8xdX/Gl4ZBByPLWyZYPu+wjLo0EPeWKVmEf5eKjffDiV8AxZzYjdIFpRqcI0/87ZxM
	/713gKljQuJ+LJKL2sCnlS5FfktRIcThnD4TDSQHEuzbteHI6jzKje0j90YgwcH55YLu
	NyEOHgRZAaMRy3KG5GmCr0dp9BVldHG+yPAgIuV2WJDxkTPfZgfyNsGATOpbiT6mKYIZ
	zVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YMlKY8pmASgTyxvIRP8no7TBUHXD69rjQQljuv5SCw0=;
	b=BNQVrIK/iiv05us/osP+J09qxFMU5bpBqXvXOe5sDz6NJWudqmPzSUMqIsASyG6Rh5
	DtVt8CbwD7wX47SnsM2+yOREDGtQtjTVELVl+TTs2UOjCBS5Ym6XDkJpnx7BBXinivXd
	+oJpX+UPn2MjdK/sAcSNbOs4uqtwfvGVfbS7/BlxQw4ZVfS8eR/6Y2ChaeJR0CRHKLi9
	X39yaULQvmeF8RujsVyDOU2YdzxB33JOeF/AHPZ3x9C9AIqeE2EwekwGlid36cC5QRj2
	Dd6E5kyE6GnggA1NQkjFmBar4e7wBWtKY/cFeqara4ee3TAN5NfkQiO4o3WUNA0eP1+h
	uivg==
X-Gm-Message-State: AIkVDXIaEh5JEy7xm2Ru3Nc3wf++Z4eZmpqrIzyp8ukP0wRBE80n4oRLLpv/NmSU0CxQvA==
X-Received: by 10.84.208.102 with SMTP id f35mr1012600plh.137.1484702924724;
	Tue, 17 Jan 2017 17:28:44 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189]) by smtp.gmail.com with ESMTPSA id
	a68sm58894047pgc.31.2017.01.17.17.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 17:28:44 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Ziyue Yang <yzylivezh@hotmail.com>,
	Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 09:28:05 +0800
Message-Id: <1484702885-11437-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial] [PATCH v3] gdbstub.c: fix GDB connection segfault
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
X-List-Received-Date: Wed, 18 Jan 2017 01:28:53 -0000

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
index de62d26..fe1d0f8 100644
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
+            error_report("Error: Bad gdb register numbering for '%s', "
+                         "Expected %d got %d", xml, g_pos, s->base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
@@ -889,7 +890,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
     case 'k':
         /* Kill the target */
-        fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
+        error_report("QEMU: Terminated via GDBstub");
         exit(0);
     case 'D':
         /* Detach packet */
@@ -1357,8 +1358,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
                 break;
             default:
             bad_format:
-                fprintf(stderr, "gdbstub: Bad syscall format string '%s'\n",
-                        fmt - 1);
+                error_report("gdbstub: Bad syscall format string '%s'",
+                             fmt - 1);
                 break;
             }
         } else {
@@ -1731,6 +1732,12 @@ int gdbserver_start(const char *device)
     CharDriverState *mon_chr;
     ChardevCommon common = { 0 };

+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
--
2.7.4


