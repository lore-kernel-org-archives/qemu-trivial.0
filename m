Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnG8-0004uw-Im
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:07:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnFz-0004kF-Bv
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnFy-0005z6-5H
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:15 -0500
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:59159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnFx-0005yu-3h
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:14 -0500
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:06 +0530
Received: from d28relay03.in.ibm.com ([9.184.220.60])
	by e28smtp03.in.ibm.com ([192.168.1.133]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:36:59 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA6viZ4780044; Tue, 22 Nov 2011 15:36:58 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA6vAG026457; Tue, 22 Nov 2011 21:06:57 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0J026400; Tue, 22 Nov 2011 21:06:56 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:16 +0800
Message-Id: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 11112210-3864-0000-0000-00000031855B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 01/11] fix spelling in darwin-user sub
	directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:07:23 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 darwin-user/machload.c |    6 +++---
 darwin-user/main.c     |    2 +-
 darwin-user/syscall.c  |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/darwin-user/machload.c b/darwin-user/machload.c
index 0aa8282..26dd293 100644
--- a/darwin-user/machload.c
+++ b/darwin-user/machload.c
@@ -460,7 +460,7 @@ int load_object(const char *filename, struct target_pt_regs * regs, void ** mh)
     int mach_hdr_pos = 0;
     struct mach_header mach_hdr;
 
-    /* for symbol lookup whith -d flag. */
+    /* for symbol lookup with -d flag. */
     struct symtab_command *    symtabcmd = 0;
     struct nlist_extended *symtab, *sym;
     struct nlist     *symtab_std, *syment;
@@ -645,7 +645,7 @@ int load_object(const char *filename, struct target_pt_regs * regs, void ** mh)
             case LC_PREBIND_CKSUM:
             case LC_SUB_LIBRARY:
                 break;
-            default: fprintf(stderr, "warning: unkown command 0x%x in '%s'\n", lc->cmd, filename);
+            default: fprintf(stderr, "warning: unknown command 0x%x in '%s'\n", lc->cmd, filename);
         }
         lc = (struct load_command*)((int)(lc)+(lc->cmdsize));
     }
@@ -809,7 +809,7 @@ unsigned long setup_arg_pages(void * mh, char ** argv, char ** env)
         page_set_flags((int)env[i], (int)(env[i]+strlen(env[i])), PROT_READ | PAGE_VALID);
     }
 
-    /* Add on the stack the interp_prefix choosen if so */
+    /* Add on the stack the interp_prefix chosen if so */
     if(interp_prefix[0])
     {
         char *dyld_root;
diff --git a/darwin-user/main.c b/darwin-user/main.c
index c0f14f8..9b57c20 100644
--- a/darwin-user/main.c
+++ b/darwin-user/main.c
@@ -394,7 +394,7 @@ void cpu_loop(CPUPPCState *env)
             queue_signal(info.si_signo, &info);
             break;
         case POWERPC_EXCP_PIT:      /* Programmable interval timer IRQ       */
-            cpu_abort(env, "Programable interval timer interrupt "
+            cpu_abort(env, "Programmable interval timer interrupt "
                       "while in user mode. Aborting\n");
             break;
         case POWERPC_EXCP_IO:       /* IO error exception                    */
diff --git a/darwin-user/syscall.c b/darwin-user/syscall.c
index f3cc1f8..8a16883 100644
--- a/darwin-user/syscall.c
+++ b/darwin-user/syscall.c
@@ -755,7 +755,7 @@ struct attrbuf_header {
 
 static inline void byteswap_attrbuf(struct attrbuf_header *attrbuf, struct attrlist *attrlist)
 {
-    DPRINTF("attrBuf.lenght %lx\n", attrbuf->length);
+    DPRINTF("attrBuf.length %lx\n", attrbuf->length);
 }
 
 static inline void byteswap_statfs(struct statfs *s)
-- 
1.7.5.4


