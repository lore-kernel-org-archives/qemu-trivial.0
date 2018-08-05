Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmB-00069N-Cb
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNm8-00066k-IG
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNm7-0005NE-LP
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:08 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:34802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNly-0005EC-B7; Sun, 05 Aug 2018 14:28:58 -0400
Received: by mail-qt0-x234.google.com with SMTP id m13-v6so11539424qth.1;
	Sun, 05 Aug 2018 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HQUo0Faw7Q3bsQZsiynXcW2kg/l9XhvDpKAcE/uuUec=;
	b=Vro8eb2eZjvcTe3qEmFFXLtdmwD6IBD5lo0c+0AfBDOGA2sqR1G3gnNHNVBaPA0qZ/
	vn5iiG/sQ8BCby+PLlmO53LFkMOLO90t2igwOxpx/Lj8I4K7d4uTVuc3oFMmarXyM4lc
	hhMKqxiS63/FgMDz/mqgfXbC8bG3utslsZuaRfBN/+BJG7Uhwf47qomaWB27kWeYTTVK
	TMdcv+g7e31r971Zq13gECfLWBXWKD0rDeTYUj0cxweCsjeljGGdv5Ou6Psu1VxSj4zl
	wVuJ96UYFIxHLw53wgaFzJ/WrxTCsl3MNmXXysp71ykeNnlmiETOlSTqkZBe/F4CYf3S
	Hbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HQUo0Faw7Q3bsQZsiynXcW2kg/l9XhvDpKAcE/uuUec=;
	b=YdvDmEWUwfiiz6TyoNNcWCVzhiHudEIMTTApv59s1ziuTG7bPW2qJ0PgMA5bO5wMvq
	p7nw/1128/cyB3DFhhWAjYVFLHvCiarGcnSk5ZEyFYt8WIMiE5TT1A0aGsjiZ/KYqapb
	XgoeUvLcNZ7WUJ0/8MwnOE3bXtUTAPQZNn+nvde3+kpqMOy2duJKVfir2EGPdLypOulS
	XMgTjGKL66Ez3Dk6Tlc5wufSm56tXOWdz26vMMVhIM9lhfolPmErtlV9rx7lh7g8XZoc
	C3qUhw6Jp4+n4Da4Nenw5mQcBFfmVdkH1IJB5AW4Y89MUNq2wsZKhIoaW08HpGZGRxoM
	rOWw==
X-Gm-Message-State: AOUpUlHbKWT30WBwIOWIQBwHaZ2GumfYWMa4gLU6SAYrIxVlBCFwPtFn
	Q8W20L4roCf/E2Sq2CmhGSGVfUBrqOI=
X-Google-Smtp-Source: AAOMgpfRzZ80Zqm/WKMvQAGR2EvX9DgdrwWIwzcrjngyFdNvET8OZ+Xt9boopA1Pu6jEAK4Kdhq+bQ==
X-Received: by 2002:ac8:2775:: with SMTP id
	h50-v6mr12101360qth.67.1533493737665; 
	Sun, 05 Aug 2018 11:28:57 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.28.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:28:57 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:26 -0400
Message-Id: <20180805182832.3012-2-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-trivial] [PATCH 1/6] target/s390x: add BAL and BALR
 instructions
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:10 -0000

These instructions are provided for compatibility purposes and are
used only by old software, in the new code BAS and BASR are preferred.
The difference between the old and new instruction exists only in the
24-bit mode.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/insn-data.def |  3 +++
 target/s390x/translate.c   | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 5c6f33ed9c..9c7b434fca 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -102,6 +102,9 @@
     D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB)
     D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB)
 
+/* BRANCH AND LINK */
+    C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)
+    C(0x4500, BAL,     RX_a,  Z,   0, a2, r1, 0, bal, 0)
 /* BRANCH AND SAVE */
     C(0x0d00, BASR,    RR_a,  Z,   0, r2_nz, r1, 0, bas, 0)
     C(0x4d00, BAS,     RX_a,  Z,   0, a2, r1, 0, bas, 0)
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 57c03cbf58..efdc88e227 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -1463,6 +1463,38 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
     }
 }
 
+static void save_link_info(TCGv_i64 out, uint64_t pc, uint64_t ilc)
+{
+    TCGv_i64 t;
+
+    tcg_gen_andi_i64(out, out, 0xffffffff00000000);
+    tcg_gen_ori_i64(out, out, (ilc << 30) | pc);
+    t = tcg_temp_new_i64();
+    tcg_gen_shri_i64(t, psw_mask, 16);
+    tcg_gen_andi_i64(t, t, 0x0f000000);
+    tcg_gen_or_i64(out, out, t);
+    tcg_gen_extu_i32_i64(t, cc_op);
+    tcg_gen_shli_i64(t, t, 28);
+    tcg_gen_or_i64(out, out, t);
+    tcg_temp_free_i64(t);
+}
+
+static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
+{
+    if (s->base.tb->flags & FLAG_MASK_32) {
+        return op_bas(s, o);
+    }
+    gen_op_calc_cc(s);
+    save_link_info(o->out, s->pc_tmp, s->ilen / 2);
+    if (o->in2) {
+        tcg_gen_mov_i64(psw_addr, o->in2);
+        per_branch(s, false);
+        return DISAS_PC_UPDATED;
+    } else {
+        return DISAS_NEXT;
+    }
+}
+
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     tcg_gen_movi_i64(o->out, pc_to_link_info(s, s->pc_tmp));
-- 
2.16.2.windows.1


