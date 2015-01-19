Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDELN-0002Hg-VG
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jan 2015 10:34:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1YDELI-00026w-Ex
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 10:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1YDELD-0003AQ-KI
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 10:34:16 -0500
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:36929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1YDEL6-00039N-KU; Mon, 19 Jan 2015 10:34:04 -0500
Received: by mail-oi0-f43.google.com with SMTP id i138so27255949oig.2;
	Mon, 19 Jan 2015 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=JtCV7NwpWvM9d2qnO4f+DfyWQlfn8n6ONScRTAHmcag=;
	b=WURIfPZARo9P9RFWDrbSBOIbc+GNolYu0WhAkEu5dGjGeE+WnryfLcTREc1RPsUGm6
	XBvJ94GDb6g5+RLkySKO38xj2vWhsjkkE2Sfy33dXtGd1wTZAUWhVY/ONy1UwttbX/SQ
	iRFywfL3MGhYnI01+qUmzaufW9adfXPYcjqQIV3P281yJLkCIdAai3y3A97sMURQ+woQ
	PWSc0Xipv/AMyY9gF2fNc4Cc7GQrGEIjPjwEtoa7Jj9GIrdMpVrtkvtUvHmf8OHbPIwR
	D6SBL7u3dKg36DGnMLy0VLpnAG9kKVe0bw4wvlggAacixreCnBPv/Vc7sOCfzrA8rzLq
	7o4A==
X-Received: by 10.202.177.137 with SMTP id a131mr6894651oif.67.1421681643443; 
	Mon, 19 Jan 2015 07:34:03 -0800 (PST)
Received: from [192.168.1.104] ([223.72.65.27])
	by mx.google.com with ESMTPSA id pn1sm5457311obc.25.2015.01.19.07.34.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 19 Jan 2015 07:34:02 -0800 (PST)
Message-ID: <54BD23F7.7010700@gmail.com>
Date: Mon, 19 Jan 2015 23:34:15 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "rth@twiddle.net" <rth@twiddle.net>, Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] tcg: Use macro instead of hard code number
 0xffffffff for tcg_target_ulong using
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
X-List-Received-Date: Mon, 19 Jan 2015 15:34:20 -0000

For tcg_target_ulong (include TCGArg), it often uses lower 32-bit mask
and higher 32-bit mask, so define the related macro for it, so can let
code simpler, and avoid various coding styles for them.

 - For lower, some append 'u', some append 'U', and some no 'u' or 'U'.

 - For higher, some append 'ull', some use type cast.

 - For lower but may be used higher bits, append 'ull'.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 tcg/optimize.c        | 16 ++++++++--------
 tcg/s390/tcg-target.c | 24 ++++++++++++------------
 tcg/tcg.h             |  3 +++
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 34ae3c2..dc29223 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -174,7 +174,7 @@ static void tcg_opt_gen_mov(TCGContext *s, int op_index, TCGArg *gen_args,
     mask = temps[src].mask;
     if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_mov_i32) {
         /* High bits of the destination are now garbage.  */
-        mask |= ~0xffffffffull;
+        mask |= TCG_TARGET_ULONG_M32H;
     }
     temps[dst].mask = mask;
 
@@ -211,7 +211,7 @@ static void tcg_opt_gen_movi(TCGContext *s, int op_index, TCGArg *gen_args,
     mask = val;
     if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_mov_i32) {
         /* High bits of the destination are now garbage.  */
-        mask |= ~0xffffffffull;
+        mask |= TCG_TARGET_ULONG_M32H;
     }
     temps[dst].mask = mask;
 
@@ -354,7 +354,7 @@ static TCGArg do_constant_folding(TCGOpcode op, TCGArg x, TCGArg y)
 {
     TCGArg res = do_constant_folding_2(op, x, y);
     if (op_bits(op) == 32) {
-        res &= 0xffffffff;
+        res &= TCG_TARGET_ULONG_M32L;
     }
     return res;
 }
@@ -804,7 +804,7 @@ static TCGArg *tcg_constant_folding(TCGContext *s, uint16_t *tcg_opc_ptr,
                 break;
             }
         case INDEX_op_ext32u_i64:
-            mask = 0xffffffffU;
+            mask = TCG_TARGET_ULONG_M32L;
             goto and_const;
 
         CASE_OP_32_64(and):
@@ -895,7 +895,7 @@ static TCGArg *tcg_constant_folding(TCGContext *s, uint16_t *tcg_opc_ptr,
             mask = 0xffff;
             break;
         case INDEX_op_ld32u_i64:
-            mask = 0xffffffffu;
+            mask = TCG_TARGET_ULONG_M32L;
             break;
 
         CASE_OP_32_64(qemu_ld):
@@ -916,9 +916,9 @@ static TCGArg *tcg_constant_folding(TCGContext *s, uint16_t *tcg_opc_ptr,
            need to record that the high bits contain garbage.  */
         partmask = mask;
         if (!(def->flags & TCG_OPF_64BIT)) {
-            mask |= ~(tcg_target_ulong)0xffffffffu;
-            partmask &= 0xffffffffu;
-            affected &= 0xffffffffu;
+            mask |= TCG_TARGET_ULONG_M32H;
+            partmask &= TCG_TARGET_ULONG_M32L;
+            affected &= TCG_TARGET_ULONG_M32L;
         }
 
         if (partmask == 0) {
diff --git a/tcg/s390/tcg-target.c b/tcg/s390/tcg-target.c
index 63e9c82..394fefc 100644
--- a/tcg/s390/tcg-target.c
+++ b/tcg/s390/tcg-target.c
@@ -677,11 +677,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
             tcg_out_insn(s, RIL, LGFI, ret, sval);
             return;
         }
-        if (uval <= 0xffffffff) {
+        if (uval <= TCG_TARGET_ULONG_M32L) {
             tcg_out_insn(s, RIL, LLILF, ret, uval);
             return;
         }
-        if ((uval & 0xffffffff) == 0) {
+        if ((uval & TCG_TARGET_ULONG_M32L) == 0) {
             tcg_out_insn(s, RIL, LLIHF, ret, uval >> 31 >> 1);
             return;
         }
@@ -702,7 +702,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         /* A 32-bit unsigned value can be loaded in 2 insns.  And given
            that the lli_insns loop above did not succeed, we know that
            both insns are required.  */
-        if (uval <= 0xffffffff) {
+        if (uval <= TCG_TARGET_ULONG_M32L) {
             tcg_out_insn(s, RI, LLILL, ret, uval);
             tcg_out_insn(s, RI, IILH, ret, uval >> 16);
             return;
@@ -727,7 +727,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     /* If we get here, both the high and low parts have non-zero bits.  */
 
     /* Recurse to load the lower 32-bits.  */
-    tcg_out_movi(s, TCG_TYPE_I64, ret, uval & 0xffffffff);
+    tcg_out_movi(s, TCG_TYPE_I64, ret, uval & TCG_TARGET_ULONG_M32L);
 
     /* Insert data into the high 32-bits.  */
     uval = uval >> 31 >> 1;
@@ -1006,7 +1006,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (facilities & FACILITY_EXT_IMM) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i*32);
+            tcg_target_ulong mask = ~(TCG_TARGET_ULONG_M32L << i*32);
             if (((val | ~valid) & mask) == mask) {
                 tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
                 return;
@@ -1055,7 +1055,7 @@ static void tgen64_ori(TCGContext *s, TCGReg dest, tcg_target_ulong val)
 
         /* Try all 48-bit insns that can perform it in one go.  */
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i*32);
+            tcg_target_ulong mask = (TCG_TARGET_ULONG_M32L << i*32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
                 tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
                 return;
@@ -1065,8 +1065,8 @@ static void tgen64_ori(TCGContext *s, TCGReg dest, tcg_target_ulong val)
         /* Perform the OR via sequential modifications to the high and
            low parts.  Do this via recursion to handle 16-bit vs 32-bit
            masks in each half.  */
-        tgen64_ori(s, dest, val & 0x00000000ffffffffull);
-        tgen64_ori(s, dest, val & 0xffffffff00000000ull);
+        tgen64_ori(s, dest, val & TCG_TARGET_ULONG_M32L);
+        tgen64_ori(s, dest, val & TCG_TARGET_ULONG_M32H);
     } else {
         /* With no extended-immediate facility, we don't need to be so
            clever.  Just iterate over the insns and mask in the constant.  */
@@ -1082,10 +1082,10 @@ static void tgen64_ori(TCGContext *s, TCGReg dest, tcg_target_ulong val)
 static void tgen64_xori(TCGContext *s, TCGReg dest, tcg_target_ulong val)
 {
     /* Perform the xor by parts.  */
-    if (val & 0xffffffff) {
+    if (val & TCG_TARGET_ULONG_M32L) {
         tcg_out_insn(s, RIL, XILF, dest, val);
     }
-    if (val > 0xffffffff) {
+    if (val > TCG_TARGET_ULONG_M32L) {
         tcg_out_insn(s, RIL, XIHF, dest, val >> 31 >> 1);
     }
 }
@@ -1793,14 +1793,14 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_or_i32:
         if (const_args[2]) {
-            tgen64_ori(s, args[0], args[2] & 0xffffffff);
+            tgen64_ori(s, args[0], args[2] & TCG_TARGET_ULONG_M32L);
         } else {
             tcg_out_insn(s, RR, OR, args[0], args[2]);
         }
         break;
     case INDEX_op_xor_i32:
         if (const_args[2]) {
-            tgen64_xori(s, args[0], args[2] & 0xffffffff);
+            tgen64_xori(s, args[0], args[2] & TCG_TARGET_ULONG_M32L);
         } else {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         }
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 944b877..4f113ed 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -54,6 +54,9 @@ typedef uint64_t tcg_target_ulong;
 #error unsupported
 #endif
 
+#define TCG_TARGET_ULONG_M32L ((tcg_target_ulong)0xffffffffu)
+#define TCG_TARGET_ULONG_M32H (~(tcg_target_ulong)0xffffffffu)
+
 #if TCG_TARGET_NB_REGS <= 32
 typedef uint32_t TCGRegSet;
 #elif TCG_TARGET_NB_REGS <= 64
-- 
1.9.3

