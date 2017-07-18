Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVKn-0000eN-7l
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:26:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKj-0000af-CD
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKi-000141-Gv
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dXVKg-0000zb-4f; Tue, 18 Jul 2017 12:26:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dXVKW-00054O-FU; Tue, 18 Jul 2017 17:26:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 18 Jul 2017 17:26:32 +0100
Message-Id: <1500395194-21455-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH for-2.10 2/4] bsd-user/elfload.c: Fix
 set-but-not-used warnings
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
X-List-Received-Date: Tue, 18 Jul 2017 16:26:50 -0000

Fix various warnings about set-but-not-used variables on OpenBSD:

bsd-user/elfload.c:1158:15: warning: variable 'mapped_addr' set but not used [-Wunused-but-set-variable]
bsd-user/elfload.c:1165:9: warning: variable 'status' set but not used [-Wunused-but-set-variable]
bsd-user/elfload.c:1168:15: warning: variable 'elf_stack' set but not used [-Wunused-but-set-variable]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/elfload.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 41a1309..7cccf3e 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1155,21 +1155,20 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     unsigned int interpreter_type = INTERPRETER_NONE;
     unsigned char ibcs2_interpreter;
     int i;
-    abi_ulong mapped_addr;
     struct elf_phdr * elf_ppnt;
     struct elf_phdr *elf_phdata;
     abi_ulong elf_bss, k, elf_brk;
     int retval;
     char * elf_interpreter;
     abi_ulong elf_entry, interp_load_addr = 0;
-    int status;
     abi_ulong start_code, end_code, start_data, end_data;
     abi_ulong reloc_func_desc = 0;
-    abi_ulong elf_stack;
+#ifdef LOW_ELF_STACK
+    abi_ulong elf_stack = ~((abi_ulong)0UL);
+#endif
     char passed_fileno[6];
 
     ibcs2_interpreter = 0;
-    status = 0;
     load_addr = 0;
     load_bias = 0;
     elf_ex = *((struct elfhdr *) bprm->buf);          /* exec-header */
@@ -1221,7 +1220,6 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     elf_brk = 0;
 
 
-    elf_stack = ~((abi_ulong)0UL);
     elf_interpreter = NULL;
     start_code = ~((abi_ulong)0UL);
     end_code = 0;
@@ -1546,7 +1544,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
                and some applications "depend" upon this behavior.
                Since we do not have the power to recompile these, we
                emulate the SVr4 behavior.  Sigh.  */
-            mapped_addr = target_mmap(0, qemu_host_page_size, PROT_READ | PROT_EXEC,
+            target_mmap(0, qemu_host_page_size, PROT_READ | PROT_EXEC,
                                       MAP_FIXED | MAP_PRIVATE, -1, 0);
     }
 
-- 
2.7.4


