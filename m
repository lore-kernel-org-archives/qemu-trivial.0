Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNtLT-0005Rv-QI
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2013 19:13:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brendandg@gatech.edu>) id 1UNtLQ-0005Mo-Kj
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2013 19:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brendandg@gatech.edu>) id 1UNtLP-0006HL-3C
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2013 19:13:24 -0400
Received: from deliverator6.gatech.edu ([130.207.160.71]:53251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brendandg@gatech.edu>)
	id 1UNtLI-0006G1-Cl; Thu, 04 Apr 2013 19:13:16 -0400
Received: from deliverator6.gatech.edu (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 82F99BDD4FF;
	Thu,  4 Apr 2013 19:13:14 -0400 (EDT)
Received: from mail9.gatech.edu (mail9.gatech.edu [130.207.185.169])
	by deliverator6.gatech.edu (Postfix) with ESMTP id A461FBDD501;
	Thu,  4 Apr 2013 19:13:11 -0400 (EDT)
Received: from laredo3.mit.edu (unknown [18.26.6.153])
	(Authenticated sender: bfdg3)
	by mail9.gatech.edu (Postfix) with ESMTPSA id 712372226B3;
	Thu,  4 Apr 2013 19:13:11 -0400 (EDT)
From: Brendan Dolan-Gavitt <brendandg@gatech.edu>
To: qemu-devel@nongnu.org
Date: Thu,  4 Apr 2013 19:13:03 -0400
Message-Id: <1365117183-23730-1-git-send-email-brendandg@gatech.edu>
X-Mailer: git-send-email 1.7.10.4
X-GT-AVAS-Version: 5.6.1.2065439, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2013.4.4.230315
X-GT-Spam-Details: Internal Mail
X-GT-Spam-Rating: (0%)
X-GT-True-Rating: (8%)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 130.207.160.71
Cc: qemu-trivial@nongnu.org, Brendan Dolan-Gavitt <brendandg@gatech.edu>
Subject: [Qemu-trivial] [PATCH] target-i386: fix order of checks in
	cpu_get_phys_page_debug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 23:13:26 -0000

In target-i386 cpu_get_phys_page_debug, the CR4_PAE bit is checked
before CR0_PG. This means that if paging is disabled but the PAE bit has
been set in CR4, cpu_get_phys_page_debug will return the wrong result
(it will try to translate the address as virtual rather than using it as
a physical address). This patch fixes that by moving the CR0_PG check to
the beginning of the function.

This shows up when booting the Linux kernel on amd64 with "-d in_asm".
The kernel turns on the PAE bit in CR4 before turning on paging, and so
QEMU's disassembler will fail because it will try to walk the page
tables to fetch code even though paging is disabled. The symptom is
incorrect disassembly and some "Disassembler disagrees with translator
over instruction decoding" messages.

This was also reported as bug #1163065.

Signed-off-by: Brendan Dolan-Gavitt <brendandg@gatech.edu>
---
 target-i386/helper.c |  121 ++++++++++++++++++++++++++------------------------
 1 file changed, 64 insertions(+), 57 deletions(-)

diff --git a/target-i386/helper.c b/target-i386/helper.c
index 282494f..0707a44 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -891,70 +891,77 @@ hwaddr cpu_get_phys_page_debug(CPUX86State *env, target_ulong addr)
     uint32_t page_offset;
     int page_size;
 
-    if (env->cr[4] & CR4_PAE_MASK) {
-        target_ulong pdpe_addr;
-        uint64_t pde, pdpe;
-
-#ifdef TARGET_X86_64
-        if (env->hflags & HF_LMA_MASK) {
-            uint64_t pml4e_addr, pml4e;
-            int32_t sext;
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        pte = addr;
+        page_size = 4096;
+        pte = pte & env->a20_mask;
+    } else {
+        if (env->cr[4] & CR4_PAE_MASK) {
+            target_ulong pdpe_addr;
+            uint64_t pde, pdpe;
+
+    #ifdef TARGET_X86_64
+            if (env->hflags & HF_LMA_MASK) {
+                uint64_t pml4e_addr, pml4e;
+                int32_t sext;
+
+                /* test virtual address sign extension */
+                sext = (int64_t)addr >> 47;
+                if (sext != 0 && sext != -1) {
+                    return -1;
+                }
 
-            /* test virtual address sign extension */
-            sext = (int64_t)addr >> 47;
-            if (sext != 0 && sext != -1)
-                return -1;
+                pml4e_addr = ((env->cr[3] & ~0xfff) + (((addr >> 39) & 0x1ff) << 3)) &
+                    env->a20_mask;
+                pml4e = ldq_phys(pml4e_addr);
+                if (!(pml4e & PG_PRESENT_MASK)) {
+                    return -1;
+                }
 
-            pml4e_addr = ((env->cr[3] & ~0xfff) + (((addr >> 39) & 0x1ff) << 3)) &
-                env->a20_mask;
-            pml4e = ldq_phys(pml4e_addr);
-            if (!(pml4e & PG_PRESENT_MASK))
-                return -1;
+                pdpe_addr = ((pml4e & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
+                             (((addr >> 30) & 0x1ff) << 3)) & env->a20_mask;
+                pdpe = ldq_phys(pdpe_addr);
+                if (!(pdpe & PG_PRESENT_MASK)) {
+                    return -1;
+                }
+            } else
+    #endif
+            {
+                pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
+                    env->a20_mask;
+                pdpe = ldq_phys(pdpe_addr);
+                if (!(pdpe & PG_PRESENT_MASK)) {
+                    return -1;
+                }
+            }
 
-            pdpe_addr = ((pml4e & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
-                         (((addr >> 30) & 0x1ff) << 3)) & env->a20_mask;
-            pdpe = ldq_phys(pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK))
+            pde_addr = ((pdpe & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
+                        (((addr >> 21) & 0x1ff) << 3)) & env->a20_mask;
+            pde = ldq_phys(pde_addr);
+            if (!(pde & PG_PRESENT_MASK)) {
                 return -1;
-        } else
-#endif
-        {
-            pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
-                env->a20_mask;
-            pdpe = ldq_phys(pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK))
+            }
+            if (pde & PG_PSE_MASK) {
+                /* 2 MB page */
+                page_size = 2048 * 1024;
+                /* align to page_size */
+                pte = pde & ~((page_size - 1) & ~0xfff);
+            } else {
+                /* 4 KB page */
+                pte_addr = ((pde & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
+                            (((addr >> 12) & 0x1ff) << 3)) & env->a20_mask;
+                page_size = 4096;
+                pte = ldq_phys(pte_addr);
+            }
+            pte &= ~(PG_NX_MASK | PG_HI_USER_MASK);
+            if (!(pte & PG_PRESENT_MASK))
                 return -1;
-        }
-
-        pde_addr = ((pdpe & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
-                    (((addr >> 21) & 0x1ff) << 3)) & env->a20_mask;
-        pde = ldq_phys(pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
-            return -1;
-        }
-        if (pde & PG_PSE_MASK) {
-            /* 2 MB page */
-            page_size = 2048 * 1024;
-            pte = pde & ~( (page_size - 1) & ~0xfff); /* align to page_size */
         } else {
-            /* 4 KB page */
-            pte_addr = ((pde & ~0xfff & ~(PG_NX_MASK | PG_HI_USER_MASK)) +
-                        (((addr >> 12) & 0x1ff) << 3)) & env->a20_mask;
-            page_size = 4096;
-            pte = ldq_phys(pte_addr);
-        }
-        pte &= ~(PG_NX_MASK | PG_HI_USER_MASK);
-        if (!(pte & PG_PRESENT_MASK))
-            return -1;
-    } else {
-        uint32_t pde;
+            uint32_t pde;
 
-        if (!(env->cr[0] & CR0_PG_MASK)) {
-            pte = addr;
-            page_size = 4096;
-        } else {
             /* page directory entry */
-            pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc)) & env->a20_mask;
+            pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc))
+                        & env->a20_mask;
             pde = ldl_phys(pde_addr);
             if (!(pde & PG_PRESENT_MASK))
                 return -1;
@@ -969,8 +976,8 @@ hwaddr cpu_get_phys_page_debug(CPUX86State *env, target_ulong addr)
                     return -1;
                 page_size = 4096;
             }
+            pte = pte & env->a20_mask;
         }
-        pte = pte & env->a20_mask;
     }
 
     page_offset = (addr & TARGET_PAGE_MASK) & (page_size - 1);
-- 
1.7.10.4


