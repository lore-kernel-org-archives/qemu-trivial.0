Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGtkb-0001PQ-Dj
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 12:19:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGtkU-0001H3-Sg
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 12:18:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGtkP-0007V0-TQ
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 12:18:54 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:48989
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGtkF-0007TE-Aq; Fri, 21 Feb 2014 12:18:39 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E4F7D17F70D; Fri, 21 Feb 2014 18:18:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 21 Feb 2014 18:18:34 +0100
Message-Id: <1393003115-9801-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Andrzej Zaborowski <balrogg@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tcg: Fix warning (1 bit signed bitfield
	entry) and replace int by bool
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
X-List-Received-Date: Fri, 21 Feb 2014 17:19:00 -0000

Static code analyzers complain about signed bitfields with only a single
bit. is_ld is used as a boolean value, so make it bool.

ppc64 already used bool for the 2nd argument is_ld of the local function
add_qemu_ldst_label. Modify all other TCG targets to do follow this
example.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/aarch64/tcg-target.c |    6 +++---
 tcg/arm/tcg-target.c     |    6 +++---
 tcg/i386/tcg-target.c    |    6 +++---
 tcg/ppc/tcg-target.c     |    6 +++---
 tcg/tcg-be-ldst.h        |    2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c b/tcg/aarch64/tcg-target.c
index 04d7ae3..2050c90 100644
--- a/tcg/aarch64/tcg-target.c
+++ b/tcg/aarch64/tcg-target.c
@@ -835,7 +835,7 @@ static void tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, (tcg_target_long)lb->raddr);
 }
 
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, int opc,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, int opc,
                                 TCGReg data_reg, TCGReg addr_reg,
                                 int mem_index,
                                 uint8_t *raddr, uint8_t *label_ptr)
@@ -1003,7 +1003,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, int opc)
     s_bits = opc & 3;
     tcg_out_tlb_read(s, addr_reg, s_bits, &label_ptr, mem_index, 1);
     tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, TCG_REG_X1);
-    add_qemu_ldst_label(s, 1, opc, data_reg, addr_reg,
+    add_qemu_ldst_label(s, true, opc, data_reg, addr_reg,
                         mem_index, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg,
@@ -1027,7 +1027,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, int opc)
 
     tcg_out_tlb_read(s, addr_reg, s_bits, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, TCG_REG_X1);
-    add_qemu_ldst_label(s, 0, opc, data_reg, addr_reg,
+    add_qemu_ldst_label(s, false, opc, data_reg, addr_reg,
                         mem_index, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg,
diff --git a/tcg/arm/tcg-target.c b/tcg/arm/tcg-target.c
index c8884b3..e2291bf 100644
--- a/tcg/arm/tcg-target.c
+++ b/tcg/arm/tcg-target.c
@@ -1246,7 +1246,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOp opc,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOp opc,
                                 TCGReg datalo, TCGReg datahi, TCGReg addrlo,
                                 TCGReg addrhi, int mem_index,
                                 uint8_t *raddr, uint8_t *label_ptr)
@@ -1508,7 +1508,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend);
 
-    add_qemu_ldst_label(s, 1, opc, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, opc, datalo, datahi, addrlo, addrhi,
                         mem_index, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (GUEST_BASE) {
@@ -1634,7 +1634,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     label_ptr = s->code_ptr;
     tcg_out_bl_noaddr(s, COND_NE);
 
-    add_qemu_ldst_label(s, 0, opc, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, opc, datalo, datahi, addrlo, addrhi,
                         mem_index, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (GUEST_BASE) {
diff --git a/tcg/i386/tcg-target.c b/tcg/i386/tcg-target.c
index f832282..0c2347c 100644
--- a/tcg/i386/tcg-target.c
+++ b/tcg/i386/tcg-target.c
@@ -1244,7 +1244,7 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOp opc,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOp opc,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 int mem_index, uint8_t *raddr,
@@ -1554,7 +1554,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, 0, 0, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, 1, opc, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, opc, datalo, datahi, addrlo, addrhi,
                         mem_index, s->code_ptr, label_ptr);
 #else
     {
@@ -1685,7 +1685,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, 0, opc, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, opc, datalo, datahi, addrlo, addrhi,
                         mem_index, s->code_ptr, label_ptr);
 #else
     {
diff --git a/tcg/ppc/tcg-target.c b/tcg/ppc/tcg-target.c
index dc2c2df..06bedd9 100644
--- a/tcg/ppc/tcg-target.c
+++ b/tcg/ppc/tcg-target.c
@@ -524,7 +524,7 @@ static void tcg_out_call (TCGContext *s, tcg_target_long arg, int const_arg,
 #if defined(CONFIG_SOFTMMU)
 
 static void add_qemu_ldst_label (TCGContext *s,
-                                 int is_ld,
+                                 bool is_ld,
                                  TCGMemOp opc,
                                  int data_reg,
                                  int data_reg2,
@@ -720,7 +720,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
         break;
     }
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, 1, opc, datalo, datahi, addrlo,
+    add_qemu_ldst_label(s, true, opc, datalo, datahi, addrlo,
                         addrhi, mem_index, s->code_ptr, label_ptr);
 #endif
 }
@@ -779,7 +779,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, 0, opc, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, opc, datalo, datahi, addrlo, addrhi,
                         mem_index, s->code_ptr, label_ptr);
 #endif
 }
diff --git a/tcg/tcg-be-ldst.h b/tcg/tcg-be-ldst.h
index 284db0c..ad94c0c 100644
--- a/tcg/tcg-be-ldst.h
+++ b/tcg/tcg-be-ldst.h
@@ -24,7 +24,7 @@
 #define TCG_MAX_QEMU_LDST       640
 
 typedef struct TCGLabelQemuLdst {
-    int is_ld:1;            /* qemu_ld: 1, qemu_st: 0 */
+    bool is_ld:1;           /* qemu_ld: true, qemu_st: false */
     TCGMemOp opc:4;
     TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
     TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-- 
1.7.10.4


