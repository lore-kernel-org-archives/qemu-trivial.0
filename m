Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUN1e-0000rt-ID
	for mharc-qemu-trivial@gnu.org; Sat, 07 Mar 2015 17:16:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUN1b-0000m4-Df
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 17:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUN1a-0002Oy-IS
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 17:16:47 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:44685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUN1W-0002NX-8H; Sat, 07 Mar 2015 17:16:42 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 2FAE017F989; Sat,  7 Mar 2015 23:16:40 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  7 Mar 2015 23:16:38 +0100
Message-Id: <1425766598-18297-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] target-ppc: Fix warnings from Sparse
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
X-List-Received-Date: Sat, 07 Mar 2015 22:16:48 -0000

Sparse report:

target-ppc/mmu-hash64.c:353:9: warning: returning void-valued expression
target-ppc/mmu-hash64.c:620:9: warning: returning void-valued expression

Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Should we fix this kind of warnings? QEMU includes more than
60 lines of code which return a void expression.

Stefan

 target-ppc/mmu-hash64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target-ppc/mmu-hash64.c b/target-ppc/mmu-hash64.c
index b0278c9..a9e1b4c 100644
--- a/target-ppc/mmu-hash64.c
+++ b/target-ppc/mmu-hash64.c
@@ -350,7 +350,7 @@ uint64_t ppc_hash64_start_access(PowerPCCPU *cpu, target_ulong pte_index)
 void ppc_hash64_stop_access(uint64_t token)
 {
     if (kvmppc_kern_htab) {
-        return kvmppc_hash64_free_pteg(token);
+        kvmppc_hash64_free_pteg(token);
     }
 }
 
@@ -617,7 +617,8 @@ void ppc_hash64_store_hpte(CPUPPCState *env,
     CPUState *cs = CPU(ppc_env_get_cpu(env));
 
     if (kvmppc_kern_htab) {
-        return kvmppc_hash64_write_pte(env, pte_index, pte0, pte1);
+        kvmppc_hash64_write_pte(env, pte_index, pte0, pte1);
+        return;
     }
 
     pte_index *= HASH_PTE_SIZE_64;
-- 
2.1.4


