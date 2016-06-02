Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8VCZ-0005rW-Ue
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2016 12:10:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8VCX-0005ob-7Q
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 12:10:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8VCV-0008J3-Td
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 12:10:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8VCS-0008Hn-1m; Thu, 02 Jun 2016 12:10:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8VCP-0008Kj-GA; Thu, 02 Jun 2016 17:10:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Thu,  2 Jun 2016 17:10:20 +0100
Message-Id: <1464883820-10907-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] thunk: Rename args and fields in host-target
 bitmask conversion code
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
X-List-Received-Date: Thu, 02 Jun 2016 16:10:30 -0000

The target_to_host_bitmask() and host_to_target_bitmask() functions
and the associated struct bitmask_transtbl are completely generic,
but for historical reasons the target related fields and parameters
are named 'x86' and the host related fields are named 'alpha'.
Rename them to 'target' and 'host'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This probably has a minor textual-conflict dependency on the
other patch I sent earlier.

 include/exec/user/thunk.h | 12 ++++++------
 thunk.c                   | 30 +++++++++++++++---------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
index 57eb358..f19ef4b 100644
--- a/include/exec/user/thunk.h
+++ b/include/exec/user/thunk.h
@@ -60,10 +60,10 @@ typedef struct {
 
 /* Translation table for bitmasks... */
 typedef struct bitmask_transtbl {
-	unsigned int	x86_mask;
-	unsigned int	x86_bits;
-	unsigned int	alpha_mask;
-	unsigned int	alpha_bits;
+    unsigned int target_mask;
+    unsigned int target_bits;
+    unsigned int host_mask;
+    unsigned int host_bits;
 } bitmask_transtbl;
 
 void thunk_register_struct(int id, const char *name, const argtype *types);
@@ -177,9 +177,9 @@ static inline int thunk_type_align(const argtype *type_ptr, int is_host)
     }
 }
 
-unsigned int target_to_host_bitmask(unsigned int x86_mask,
+unsigned int target_to_host_bitmask(unsigned int target_mask,
                                     const bitmask_transtbl * trans_tbl);
-unsigned int host_to_target_bitmask(unsigned int alpha_mask,
+unsigned int host_to_target_bitmask(unsigned int host_mask,
                                     const bitmask_transtbl * trans_tbl);
 
 void thunk_init(unsigned int max_structs);
diff --git a/thunk.c b/thunk.c
index 8aee299..2dac366 100644
--- a/thunk.c
+++ b/thunk.c
@@ -273,34 +273,34 @@ const argtype *thunk_convert(void *dst, const void *src,
 /* from em86 */
 
 /* Utility function: Table-driven functions to translate bitmasks
- * between X86 and Alpha formats...
+ * between host and target formats
  */
-unsigned int target_to_host_bitmask(unsigned int x86_mask,
+unsigned int target_to_host_bitmask(unsigned int target_mask,
                                     const bitmask_transtbl * trans_tbl)
 {
     const bitmask_transtbl *btp;
-    unsigned int	alpha_mask = 0;
+    unsigned int host_mask = 0;
 
-    for(btp = trans_tbl; btp->x86_mask && btp->alpha_mask; btp++) {
-	if((x86_mask & btp->x86_mask) == btp->x86_bits) {
-	    alpha_mask |= btp->alpha_bits;
-	}
+    for (btp = trans_tbl; btp->target_mask && btp->host_mask; btp++) {
+        if ((target_mask & btp->target_mask) == btp->target_bits) {
+            host_mask |= btp->host_bits;
+        }
     }
-    return(alpha_mask);
+    return host_mask;
 }
 
-unsigned int host_to_target_bitmask(unsigned int alpha_mask,
+unsigned int host_to_target_bitmask(unsigned int host_mask,
                                     const bitmask_transtbl * trans_tbl)
 {
     const bitmask_transtbl *btp;
-    unsigned int	x86_mask = 0;
+    unsigned int target_mask = 0;
 
-    for(btp = trans_tbl; btp->x86_mask && btp->alpha_mask; btp++) {
-	if((alpha_mask & btp->alpha_mask) == btp->alpha_bits) {
-	    x86_mask |= btp->x86_bits;
-	}
+    for (btp = trans_tbl; btp->target_mask && btp->host_mask; btp++) {
+        if ((host_mask & btp->host_mask) == btp->host_bits) {
+            target_mask |= btp->target_bits;
+        }
     }
-    return(x86_mask);
+    return target_mask;
 }
 
 int thunk_type_size_array(const argtype *type_ptr, int is_host)
-- 
1.9.1


