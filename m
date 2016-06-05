Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9T0J-0001tI-R3
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:01:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0H-0001qE-9N
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0C-00084q-Ty
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9T02-00081e-Jp; Sun, 05 Jun 2016 04:01:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D1BC40915;
	Sun,  5 Jun 2016 11:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B6F91B3E;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1164 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:13 +0300
Message-Id: <d714e71359e2b1744567c4ad12e1d10e63098b4f.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 36/52] thunk: Rename args and fields in
 host-target bitmask conversion code
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
X-List-Received-Date: Sun, 05 Jun 2016 08:01:50 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The target_to_host_bitmask() and host_to_target_bitmask() functions
and the associated struct bitmask_transtbl are completely generic,
but for historical reasons the target related fields and parameters
are named 'x86' and the host related fields are named 'alpha'.
Rename them to 'target' and 'host'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
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
2.1.4


