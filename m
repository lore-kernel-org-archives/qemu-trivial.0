Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmQgx-00079Y-73
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2015 14:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio.nemesis@gmail.com>) id 1ZmQ5X-0004zN-I1
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 13:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julio.nemesis@gmail.com>) id 1ZmQ5W-0000Uc-IR
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 13:43:43 -0400
Received: from mail-wi0-f193.google.com ([209.85.212.193]:33928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio.nemesis@gmail.com>)
	id 1ZmQ5Q-0000QZ-I5; Wed, 14 Oct 2015 13:43:36 -0400
Received: by wicuk10 with SMTP id uk10so9421205wic.1;
	Wed, 14 Oct 2015 10:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=uVoRuGSgddNbhdVEkyeoGEqIEihTXdDACoxA8jaLttg=;
	b=Ij/CoGFhfbdbToDhF9yhJgFqxqfIjw/cP3TkSvCHS5Lutn4oAo+oO6j8qsQYZDNYf1
	HWnUOCKYOxOGS6On7QnFHtEuhrT2IEzLmcayU/wmtxaY7AGXuL8HMXvDXulANnTYvICK
	UZhrHwBwwS7Kp9GPoTEb/jEoqYZ02F+WSzEtZICR9+3U27+hyVc6x1p6bRk0eEOeNqnl
	Q9fylYg1JCaUHinFUUSvjJgMgpZ+UjRbDVTXcvz+bNs+Ujy4a2M4ccQ1lJh/SoXasTYU
	W///F3wRyIvIoq6AfblJ3r4i2acurS3emDfatgqbpLMpl+NdCbuPFIhTNWn0fCisLDjr
	e2hA==
X-Received: by 10.180.8.106 with SMTP id q10mr5567580wia.92.1444844615697;
	Wed, 14 Oct 2015 10:43:35 -0700 (PDT)
Received: from localhost.localdomain (ram94-1-82-67-246-35.fbx.proxad.net.
	[82.67.246.35]) by smtp.gmail.com with ESMTPSA id
	ld5sm11355641wjc.18.2015.10.14.10.43.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 10:43:34 -0700 (PDT)
From: Julio Guerra <julio@farjump.io>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 14 Oct 2015 19:43:19 +0200
Message-Id: <1444844599-33161-1-git-send-email-julio@farjump.io>
X-Mailer: git-send-email 2.5.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.193
X-Mailman-Approved-At: Wed, 14 Oct 2015 14:21:19 -0400
Cc: christophe@farjump.io, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH v2] taget-ppc: Fix read access to IBAT
	registers higher than IBAT3
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
X-List-Received-Date: Wed, 14 Oct 2015 17:43:44 -0000

Fix the index used to read the IBAT's vector which results in IBAT0..3 instead
of IBAT4..N.

The bug appeared by saving/restoring contexts including IBATs values.

Signed-off-by: Julio Guerra <julio@farjump.io>
---
 target-ppc/translate_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index b541473..76d9a02 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -305,7 +305,7 @@ static void spr_read_ibat (DisasContext *ctx, int gprn, int sprn)
 
 static void spr_read_ibat_h (DisasContext *ctx, int gprn, int sprn)
 {
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IBAT[sprn & 1][(sprn - SPR_IBAT4U) / 2]));
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
 }
 
 static void spr_write_ibatu (DisasContext *ctx, int sprn, int gprn)
-- 
2.5.2


