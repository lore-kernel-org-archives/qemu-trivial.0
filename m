Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUMn-0002tM-SV
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMi-0002hk-Jw
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMh-0003Go-GB
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:48 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMe-0002B9-37; Sun, 14 Oct 2012 16:00:44 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=U3AUBMswGGE+wFf4F2xpF0LgdP2ltLAMf7eHSENnGio=;
	b=at63PZ5qEZpQJjDSErKcveA4N50g5irC7aAkjGug0gUBVaiISQXqccpj6F71lN6OrS
	1pwjKeVGKFx7iFUxoJqPBhsgT1sgvXlzGHRveB+oOB4knZBBkvkEdrHboeDCCBiqM6SG
	qfVJrovZjV2181iIyUzDvDLGK9SothxTKpgWOjwmR/MR572SRft/XTlIRNooE0HF04Hp
	KfKKYOv9qcTv+5ekBvUoda6Zd5C1JEsF1dZc1xdG9hRnNj9aysUlZ/+TJHS8fGuC3bTY
	rsRivtUPQY/uBjo1au8zQTYcq7wUSs9zC97WrWCTcqlg6iznspYUO/MMTW9ZCzTGg9Qn
	1M2Q==
Received: by 10.152.48.102 with SMTP id k6mr8201788lan.12.1350244843318;
	Sun, 14 Oct 2012 13:00:43 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:42 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:57 +0000
Message-Id: <9b8f8031dd00c60002925effaa7ebb5f9bfa029e.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 09/11] target-ppc: make some functions static
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:50 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 target-ppc/cpu.h        |    6 ------
 target-ppc/mmu_helper.c |   11 ++++++-----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index d3ada54..ab88b33 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -1141,10 +1141,6 @@ int cpu_ppc_signal_handler (int host_signum, void *pinfo,
 int cpu_ppc_handle_mmu_fault (CPUPPCState *env, target_ulong address, int rw,
                               int mmu_idx);
 #define cpu_handle_mmu_fault cpu_ppc_handle_mmu_fault
-#if !defined(CONFIG_USER_ONLY)
-int get_physical_address (CPUPPCState *env, mmu_ctx_t *ctx, target_ulong vaddr,
-                          int rw, int access_type);
-#endif
 void do_interrupt (CPUPPCState *env);
 void ppc_hw_interrupt (CPUPPCState *env);
 
@@ -1187,8 +1183,6 @@ void store_40x_dbcr0 (CPUPPCState *env, uint32_t val);
 void store_40x_sler (CPUPPCState *env, uint32_t val);
 void store_booke_tcr (CPUPPCState *env, target_ulong val);
 void store_booke_tsr (CPUPPCState *env, target_ulong val);
-void booke206_flush_tlb(CPUPPCState *env, int flags, const int check_iprot);
-target_phys_addr_t booke206_tlb_to_page_size(CPUPPCState *env, ppcmas_tlb_t *tlb);
 int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
                      target_phys_addr_t *raddrp, target_ulong address,
                      uint32_t pid);
diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
index 532b114..d4a8dcf 100644
--- a/target-ppc/mmu_helper.c
+++ b/target-ppc/mmu_helper.c
@@ -1276,7 +1276,8 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
-void booke206_flush_tlb(CPUPPCState *env, int flags, const int check_iprot)
+static void booke206_flush_tlb(CPUPPCState *env, int flags,
+                               const int check_iprot)
 {
     int tlb_size;
     int i, j;
@@ -1297,8 +1298,8 @@ void booke206_flush_tlb(CPUPPCState *env, int flags, const int check_iprot)
     tlb_flush(env, 1);
 }
 
-target_phys_addr_t booke206_tlb_to_page_size(CPUPPCState *env,
-                                             ppcmas_tlb_t *tlb)
+static target_phys_addr_t booke206_tlb_to_page_size(CPUPPCState *env,
+                                                    ppcmas_tlb_t *tlb)
 {
     int tlbm_size;
 
@@ -1708,8 +1709,8 @@ static inline int check_physical(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
-int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
-                         int rw, int access_type)
+static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                target_ulong eaddr, int rw, int access_type)
 {
     int ret;
 
-- 
1.7.2.5


