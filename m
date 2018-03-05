Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esyMV-00020G-Jo
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 17:13:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1esyMT-0001xn-2r
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 17:13:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1esyMS-0002Oz-7E
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 17:13:37 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55583)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1esyMN-0002Nk-HE; Mon, 05 Mar 2018 17:13:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A91A0210AF;
	Mon,  5 Mar 2018 17:13:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Mon, 05 Mar 2018 17:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=CnaBeYQndsRsWb+gRfqZCcikJWp2DZ9ZYQAUpd
	4MvXY=; b=obhz2TBnObiD0X2uV5lALU/2mQ7+Ui7DIjqvQpk9WhFWlc4iBauY3I
	II/rwKM8GgxE1OWVCNAobZErWOwH//owSbClpco81zKdCnYikCFum9tcgCf8R5da
	nEOcejtolh3Wpe8CwopDZolJYMvDHqVONF36irxIjhT+ZViMudWvM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CnaBeYQndsRsWb+gR
	fqZCcikJWp2DZ9ZYQAUpd4MvXY=; b=TR2paizCaCACrsBruhcpPj4v0yuoG6GkX
	k1y+YD8WD4DIwT2yfftbTAcaQ/JPs4gyO/TpkST5aW/jRt4ESteLUw2fuPa1sVvb
	fp8UeXIcidl3kJMpNKHNfDTpcNN5PWU6treI++mwyY+05PNurzyOj6L1VT5/XqKC
	j5w0wFFnkOKBhBL7M/0/cAv6PjfYeYak1smv6sZZs1RciKI2iEgJ2yJ1eTwZeaEk
	Lf/C2zRo6LdMIN+OuJK9rtC5zEWRrtaE+R6yK3ir/CEp2QhKCdfq0VuRVxdlTzKE
	N6DH/Fqq98bpNCIm3wBQA4PzEVfbsn6uAljDHCfYftW77vnpPK2QQ==
X-ME-Sender: <xms:CsGdWlgbEg5AziAzMoX2AfueKTy94fuYhf7pLdxP-r8nO7g_EW6iCQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 59D997E498;
	Mon,  5 Mar 2018 17:13:30 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Mon,  5 Mar 2018 17:13:30 -0500
Message-Id: <1520288010-9187-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
Subject: [Qemu-trivial] [PATCH] tcg: fix s/compliment/complement/ typos
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
X-List-Received-Date: Mon, 05 Mar 2018 22:13:38 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 2 +-
 target/m68k/translate.c | 2 +-
 tcg/README              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 0135415..2e923c0 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -113,7 +113,7 @@ typedef struct DisasContext {
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
-    int vex_v;  /* vex vvvv register, without 1's compliment.  */
+    int vex_v;  /* vex vvvv register, without 1's complement.  */
     int ss32;   /* 32 bit stack segment */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index dbb24f8..8f0b7c9 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3974,7 +3974,7 @@ DISAS_INSN(bfext_reg)
     TCGv shift;
 
     /* In general, we're going to rotate the field so that it's at the
-       top of the word and then right-shift by the compliment of the
+       top of the word and then right-shift by the complement of the
        width to extend the field.  */
     if (ext & 0x20) {
         /* Variable width.  */
diff --git a/tcg/README b/tcg/README
index bb2ea51..8a8d7e2 100644
--- a/tcg/README
+++ b/tcg/README
@@ -553,7 +553,7 @@ E.g. VECL=1 -> 64 << 1 -> v128, and VECE=2 -> 1 << 2 -> i32.
 * orc_vec   v0, v1, v2
 * not_vec   v0, v1
 
-  Similarly, logical operations with and without compliment.
+  Similarly, logical operations with and without complement.
   Note that VECE is unused.
 
 * shli_vec   v0, v1, i2
-- 
2.7.4


