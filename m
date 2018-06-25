Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqu-0001tL-Fe
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqr-0001qo-Sk
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqq-0007ya-V0
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:13 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:45218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqo-0007wY-0e; Mon, 25 Jun 2018 08:44:10 -0400
Received: by mail-qk0-x235.google.com with SMTP id c198-v6so7349440qkg.12;
	Mon, 25 Jun 2018 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J3ru3PJeV88R2BDv/Grb7IZ4WRCbtW2k8onhNGPjswY=;
	b=fiSV0yG4J4BxZcuioxayQznbP7VlY+Nn/pLiExc9KXJf1cvJTYHrQ6xX2GixEIq3Y/
	ry5H9HFpbJL1seovmlixUw5txmbnYT6Z+9bAmiMIESTWhcYU2ppth27ayynNa1TBU32c
	wbdI8BJk8ML5xOXy9rxIVIBO9wKaxNw19+qcUvQH3iS7ZOl774htiexAAXLrWAf8ZlW6
	I28O7FjavNw8ytKS4qWhO2y5g16Z+0ZjkP51F5L3TRHmL9wx+3Ju8SqnajebVURQUKen
	UyBybFD2S/nIPHkWjnlsj9StlYunkHXu/GByiyNfe0BqIWmqOlfJn8RdnSyIXXe9FXmN
	TbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J3ru3PJeV88R2BDv/Grb7IZ4WRCbtW2k8onhNGPjswY=;
	b=Oj+NCWOQv+IDqPTZs2nDz+gz+yAeipUlqCwP9WKc0wsfTRyvoiyISZ96E93lQ9Z78e
	fS2HO/Htk/PkpSdxvfE2BthKRSyrCOtcQczyYcI2kS181zrOGwVjfUySMEe6w0SExcpl
	3wnCMnvljY15dOr+u7DN7es/g2MEaDHhKnrW01UIzqVi4B/pRfiIAXQAV3wjLSnmC7ih
	C4Bjdu9tjXqxcVJOZ2SsjIoM5oT+SlhOzpu8LNHY15NU/9b6frwi2mBVqN37ULea/17j
	V2DbD5vVgE24DU41mbstFRPIbwPaNLNKKk31XQCZz8Je9XsiDSVsomdHUSXP9DJ8u16r
	5bsA==
X-Gm-Message-State: APt69E3Se9R50EXhv24L5tauvfcdtOxBQCxPY/ssovGGfzhITCByDi0q
	HggWQVzwloe6BAwxPdb3DEI=
X-Google-Smtp-Source: AAOMgpf0wV6UaZTa7GLR0B2p92tZTL/5alc9pNR4S3Gk4+mWWGxq6Dc8wf+qLSm3K0VVzqdvuPoq1Q==
X-Received: by 2002:a37:19e3:: with SMTP id
	96-v6mr10462327qkz.242.1529930649420; 
	Mon, 25 Jun 2018 05:44:09 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 25 Jun 2018 09:42:13 -0300
Message-Id: <20180625124238.25339-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v5 21/46] hw/xtensa: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:15 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/xtensa/xtfpga.c     | 9 +++++----
 target/xtensa/helper.c | 5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 5dc13034f9..b3161de320 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -152,7 +153,7 @@ static void xtfpga_net_init(MemoryRegion *address_space,
             sysbus_mmio_get_region(s, 1));
 
     ram = g_malloc(sizeof(*ram));
-    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16384,
+    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16 * KiB,
                            &error_fatal);
     vmstate_register_ram_global(ram);
     memory_region_add_subregion(address_space, buffers, ram);
@@ -229,7 +230,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
     const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
     const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    const unsigned system_io_size = 224 * 1024 * 1024;
+    const unsigned system_io_size = 224 * MiB;
     int n;
 
     for (n = 0; n < smp_cpus; n++) {
@@ -342,7 +343,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cpu_physical_memory_write(cur_lowmem, fdt, fdt_size);
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
-            cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4096);
+            cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
         }
 #else
         if (dtb_filename) {
@@ -370,7 +371,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             initrd_location.end = tswap32(cur_lowmem + initrd_size);
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_INITRD,
                                  sizeof(initrd_location), &initrd_location);
-            cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + initrd_size, 4096);
+            cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + initrd_size, 4 * KiB);
         }
         cur_tagptr = put_tag(cur_tagptr, BP_TAG_LAST, 0, NULL);
         env->regs[2] = tagptr;
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 34844eead3..c9a6132700 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
@@ -726,10 +727,10 @@ static void dump_tlb(FILE *f, fprintf_function cpu_fprintf,
         bool print_header = true;
 
         if (sz >= 0x100000) {
-            sz >>= 20;
+            sz /= MiB;
             sz_text = "MB";
         } else {
-            sz >>= 10;
+            sz /= KiB;
             sz_text = "KB";
         }
 
-- 
2.18.0


