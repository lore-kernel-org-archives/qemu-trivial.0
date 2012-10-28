Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgj-0003Zw-2G
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgd-0003L6-QM
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgb-00080I-JQ
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:47 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQgW-0007pH-OL; Sun, 28 Oct 2012 07:05:40 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2423304lbb.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v4PSHSaEIr/+YUckdaMrPHu/YdvC34a7oYaKwhRnQgg=;
	b=jsF4sbCiw0Onznd4X87hsOx0cOlc6E0AA4WnYOwZ6yguwD9X+3sz/k3mOknbM+IK/d
	rlm4S0XvnSBiWr6pniJGVaLHpa96J+NN9s52+QwlZxj57oYwTdrwlq7OP7cF0/leoJBR
	qbWlzQCgOHNqJH4HtGZzNG6Mjabf3pRigAfIYHlic/Qsz41eKYVIXgbtSgIr+BoO7o/z
	r61DQYVe2fgw2XHpGt8DBabnWI8IYjTYNjiI/ypHlQe9YARliWIZAvVXQ8FbeyTcedJ2
	D7B59WoITThtyJOJSLUrfZkfgWDfYTCXufcg6zUdNn/OZGTmeN9AS81LKdxwDgMO9Xh2
	Zuhg==
Received: by 10.112.99.74 with SMTP id eo10mr10778450lbb.64.1351422340043;
	Sun, 28 Oct 2012 04:05:40 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:39 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:50 +0000
Message-Id: <5d8cc784f28d55335457ca6dae1add0040bd4e17.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH v2 5/6] target-ppc: make some functions static
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:49 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 target-ppc/cpu.h        |    6 ------
 target-ppc/mmu_helper.c |   11 ++++++-----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index b34a1ff..a5e7c55 100644
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
 
@@ -1189,8 +1185,6 @@ void store_40x_dbcr0 (CPUPPCState *env, uint32_t val);
 void store_40x_sler (CPUPPCState *env, uint32_t val);
 void store_booke_tcr (CPUPPCState *env, target_ulong val);
 void store_booke_tsr (CPUPPCState *env, target_ulong val);
-void booke206_flush_tlb(CPUPPCState *env, int flags, const int check_iprot);
-hwaddr booke206_tlb_to_page_size(CPUPPCState *env, ppcmas_tlb_t *tlb);
 int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
                      hwaddr *raddrp, target_ulong address,
                      uint32_t pid);
diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
index 4a9bb5b..31aa5c9 100644
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
 
-hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
-                                             ppcmas_tlb_t *tlb)
+static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
+                                        ppcmas_tlb_t *tlb)
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


