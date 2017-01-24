Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cW7Qo-0005PP-GV
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 15:11:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caliborn@SDF.ORG>) id 1cW6f6-0005Ff-0I
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 14:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caliborn@SDF.ORG>) id 1cW6f3-0002EL-SU
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 14:21:47 -0500
Received: from mx.sdf.org ([205.166.94.20]:59470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <caliborn@SDF.ORG>)
	id 1cW6ev-00028g-IV; Tue, 24 Jan 2017 14:21:37 -0500
Received: from sdf.lonestar.org (IDENT:caliborn@sdf.lonestar.org
	[205.166.94.15])
	by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id v0OIuWOs010631
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256 bits) verified NO);
	Tue, 24 Jan 2017 18:56:33 GMT
Date: Tue, 24 Jan 2017 18:56:32 +0000 (UTC)
From: Valentin Plotkin <caliborn@SDF.ORG>
X-X-Sender: caliborn@sdf.lonestar.org
To: qemu-trivial@nongnu.org
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <Pine.NEB.4.64.1701241855380.2138@sdf.lonestar.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 205.166.94.20
X-Mailman-Approved-At: Tue, 24 Jan 2017 15:11:05 -0500
Subject: [Qemu-trivial] [PATCH] PPC: MMU compatibility check.
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
X-List-Received-Date: Tue, 24 Jan 2017 19:21:51 -0000



Hi everyone,

I looked at the "qemu-system-ppc -nographic -cpu G2leGP3 -M ppce500" on 
the BiteSizedTasks page. The segfault was caused by machine initialization 
code which expected a certain MMU model, checked, so unused SPR were read, 
returning zeros. bamboo and virtex machines are affected as well, but it 
doesn't always cause segfault, usually running into unmapped memory and 
failing somewhat more nicely.

I added the checks. It would be possible to add support for other MMU 
models, but I'm not sure if there is any point (would any guest OS support 
mutually exclusive CPU and machine)?

---
  hw/ppc/e500.c          | 5 +++++
  hw/ppc/ppc440_bamboo.c | 5 +++++
  hw/ppc/virtex_ml507.c  | 5 +++++
  3 files changed, 15 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index cf8b122..cd352f6 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -631,6 +631,11 @@ static uint64_t mmubooke_initial_mapsize(CPUPPCState 
*env)

  static void mmubooke_create_initial_mapping(CPUPPCState *env)
  {
+    if(env->mmu_model!=POWERPC_MMU_BOOKE206){
+        fprintf(stderr,"MMU model %i not supported by this machine.\n", 
env->mmu_model);
+        exit(-1);
+    }
+
      ppcmas_tlb_t *tlb = booke206_get_tlbm(env, 1, 0, 0);
      hwaddr size;
      int ps;
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 5c535b1..61e7028 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -124,6 +124,11 @@ static void 
mmubooke_create_initial_mapping(CPUPPCState *env,
                                       target_ulong va,
                                       hwaddr pa)
  {
+    if(env->mmu_model!=POWERPC_MMU_BOOKE){
+        fprintf(stderr,"MMU model %i not supported by this machine.\n", 
env->mmu_model);
+        exit(-1);
+    }
+
      ppcemb_tlb_t *tlb = &env->tlb.tlbe[0];

      tlb->attr = 0;
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index b97d966..4041ff3 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -69,6 +69,11 @@ static void mmubooke_create_initial_mapping(CPUPPCState 
*env,
                                       target_ulong va,
                                       hwaddr pa)
  {
+    if(env->mmu_model!=POWERPC_MMU_BOOKE){
+        fprintf(stderr,"MMU model %i not supported by this machine.\n", 
env->mmu_model);
+        exit(-1);
+    }
+
      ppcemb_tlb_t *tlb = &env->tlb.tlbe[0];

      tlb->attr = 0;
-- 
2.5.5

Valentin Plotkin
caliborn@sdf.org
SDF Public Access UNIX System - http://sdf.org

