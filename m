Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvt-00037e-IB
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvn-0002xC-Q8
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002HJ-20
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugve-0002Cs-DA; Fri, 06 Nov 2015 08:19:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CAEC640DDB;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2274CAD3;
	Fri,  6 Nov 2015 15:44:06 +0300 (MSK)
Received: (nullmailer pid 31717 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:59 +0300
Message-Id: <3ede8f699645f4ca7cdbc40d8139e5a0275b4805.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Julio Guerra <julio@farjump.io>
Subject: [Qemu-trivial] [PULL 22/24] taget-ppc: Fix read access to IBAT
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:55 -0000

From: Julio Guerra <julio@farjump.io>

Fix the index used to read the IBAT's vector which results in IBAT0..3 instead
of IBAT4..N.

The bug appeared by saving/restoring contexts including IBATs values.

Signed-off-by: Julio Guerra <julio@farjump.io>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-ppc/translate_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 4934c80..e88dc7f 100644
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
2.1.4


