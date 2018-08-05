Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmL-0006Jw-CZ
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmH-0006Fo-Nb
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmG-0005Z3-Fv
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:17 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNmB-0005Qi-RR; Sun, 05 Aug 2018 14:29:11 -0400
Received: by mail-qt0-x244.google.com with SMTP id d4-v6so11463926qtn.13;
	Sun, 05 Aug 2018 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+yLklP5iOABIJxXt7F80B3I0wj9JAaqmteTKzymM0lo=;
	b=mIDw57VTJ6spCi0SeIPW2gao7aqfl1H0Zv8gdIxGCXPpKPMnzs/nXrjQc48TKoP6Fx
	50cbmcqIsjz2v3i48slB7DM9Om4Pw7g5qKDcj23Tz1EEudMP2TTCwYTj7vwmIBI5cQm7
	LKEwa3vr+Y9LSBF0AsoIOUQciXQUK3tENJhL26tggE+6sWAUQBtDnjuUUGEj1pc/6X+F
	nSV6hhblO5RgrTgym5XQWbdLkNE69g1Zrrr0WLhhOWPokZPNOL7Zm/OoFdcNZqnJ2zSl
	huz5S51xI06ZvMCSZjvRjZFJhOEKd78gIdORBlK6cf1XETFlAespXRqSubJJ9S+JVLbZ
	pRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+yLklP5iOABIJxXt7F80B3I0wj9JAaqmteTKzymM0lo=;
	b=VrmAKdg2USvrFfk5h6cQhHkSLvQngC2nQjXL08uCBOb9pybjL13PpefZoyVlckdXr0
	0ijmH6VdF23sD/HW98D4fh1oS8Rpmf3lJLGMHqvlIR6YQZBaDy52AXoJUqciw2TJHlSe
	9Oox11Fo1Dn8EwM6+/+OZBCjv6CfgCGvxOg0jxieqGJyC2rByDu+euT2b7SnnaZ3rTJA
	aZnDJ00UZMAcptP8eC8/tMQkLGFYdl6vlPN5EIy9KK6PzGmGYNmG1AujzeyW3rdPoSFM
	2IUS7vB2jaa6iLy1ItetJOM9cRHvmQeMGvK95dUQVsqMDeMF5EsoGmOTgkv8VqcqZBHu
	vXhw==
X-Gm-Message-State: AOUpUlGplslDBI3sJ3/U06mfTzmTmljrd1rMq4A1So1FMpw9PvSNq6vj
	lz6E65iSyDvxWKvrTc4P4PE3o225E4Y=
X-Google-Smtp-Source: AAOMgpfnPhijPTRSevDp0UEf3EwPf9knb/z7t+OYfS4XqWoV7+Fe6nr1vxoebKHREArWIUxN1Ksslg==
X-Received: by 2002:a0c:d44a:: with SMTP id
	r10-v6mr10396032qvh.248.1533493751191; 
	Sun, 05 Aug 2018 11:29:11 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.29.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:29:10 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:31 -0400
Message-Id: <20180805182832.3012-7-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 6/6] target/s390x: implement CVB,
 CVBY and CVBG
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:19 -0000

Convert to Binary - counterparts of the already implemented Convert
to Decimal (CVD*) instructions.
Example from the Principles of Operation: 25594C becomes 63FA.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/helper.h      |  2 ++
 target/s390x/insn-data.def |  4 ++++
 target/s390x/int_helper.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 target/s390x/translate.c   | 12 ++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 97c60ca7bc..20e0c424f9 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -88,6 +88,8 @@ DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_2(cvb, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(cvbg, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_1(cvd, TCG_CALL_NO_RWG_SE, i64, s32)
 DEF_HELPER_FLAGS_4(pack, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(pka, TCG_CALL_NO_WG, void, env, i64, i64, i32)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 9c7b434fca..f0b1cbc4b2 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -284,6 +284,10 @@
     D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
     D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
 
+/* CONVERT TO BINARY */
+    C(0x4f00, CVB,     RX_a,  Z,   0, a2, new, r1_32, cvb, 0)
+    C(0xe306, CVBY,    RXY_a, LD,  0, a2, new, r1_32, cvb, 0)
+    C(0xe30e, CVBG,    RXY_a, Z,   0, a2, r1, 0, cvbg, 0)
 /* CONVERT TO DECIMAL */
     C(0x4e00, CVD,     RX_a,  Z,   r1_o, a2, 0, 0, cvd, 0)
     C(0xe326, CVDY,    RXY_a, LD,  r1_o, a2, 0, 0, cvd, 0)
diff --git a/target/s390x/int_helper.c b/target/s390x/int_helper.c
index abf77a94e6..2d67347d08 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/int_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
 
 /* #define DEBUG_HELPER */
 #ifdef DEBUG_HELPER
@@ -118,6 +119,63 @@ uint64_t HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al,
     return ret;
 }
 
+static void general_operand_exception(CPUS390XState *env, uintptr_t ra)
+{
+    LowCore *lowcore;
+
+    lowcore = cpu_map_lowcore(env);
+    lowcore->data_exc_code = 0;
+    cpu_unmap_lowcore(lowcore);
+    s390_program_interrupt(env, PGM_DATA, ILEN_AUTO, ra);
+}
+
+static int64_t do_cvb(CPUS390XState *env, uint64_t src, int n)
+{
+    int i, j;
+    uintptr_t ra = GETPC();
+    int64_t dec, sign, digit, val, pow10;
+
+    for (i = 0; i < n; i++) {
+        dec = cpu_ldq_data_ra(env, src + (n - i - 1) * 8, ra);
+        for (j = 0; j < 16; j++, dec >>= 4) {
+            if (i == 0 && j == 0) {
+                sign = dec & 0xf;
+                if (sign < 0xa) {
+                    general_operand_exception(env, ra);
+                }
+                continue;
+            }
+            digit = dec & 0xf;
+            if (digit > 0x9) {
+                general_operand_exception(env, ra);
+            }
+            if (i == 0 && j == 1) {
+                if (sign == 0xb || sign == 0xd) {
+                    val = -digit;
+                    pow10 = -10;
+                } else {
+                    val = digit;
+                    pow10 = 10;
+                }
+            } else {
+                val += digit * pow10;
+                pow10 *= 10;
+            }
+        }
+    }
+    return val;
+}
+
+uint64_t HELPER(cvb)(CPUS390XState *env, uint64_t src)
+{
+    return do_cvb(env, src, 1);
+}
+
+uint64_t HELPER(cvbg)(CPUS390XState *env, uint64_t src)
+{
+    return do_cvb(env, src, 2);
+}
+
 uint64_t HELPER(cvd)(int32_t reg)
 {
     /* positive 0 */
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 05442dff36..83d71815d4 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -2106,6 +2106,18 @@ static DisasJumpType op_csp(DisasContext *s, DisasOps *o)
 }
 #endif
 
+static DisasJumpType op_cvb(DisasContext *s, DisasOps *o)
+{
+    gen_helper_cvb(o->out, cpu_env, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_cvbg(DisasContext *s, DisasOps *o)
+{
+    gen_helper_cvbg(o->out, cpu_env, o->in2);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_cvd(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 t1 = tcg_temp_new_i64();
-- 
2.16.2.windows.1


