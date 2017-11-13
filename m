Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eE99S-0006rv-Na
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 02:27:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eE99P-0006o3-Iz
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 02:27:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eE99O-0000B3-OT
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 02:27:23 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:52256
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1eE99K-00009V-Dv; Mon, 13 Nov 2017 02:27:18 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 3A0F8DA8D96;
	Mon, 13 Nov 2017 08:27:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sRHIhiSMsZMh; Mon, 13 Nov 2017 08:27:16 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id BFCAFDA8D95;
	Mon, 13 Nov 2017 08:27:16 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id B560C46162C; Mon, 13 Nov 2017 08:27:16 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 13 Nov 2017 08:27:15 +0100
Message-Id: <20171113072715.3443-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH for 2.12] disas/hppa: Fix compiler errors
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
X-List-Received-Date: Mon, 13 Nov 2017 07:27:24 -0000

gcc (Debian 6.3.0-18) 6.3.0 20170516 reports these errors:

disas/hppa.c:2702:20: error:
 left shift of negative value [-Werror=shift-negative-value]
disas/hppa.c:2718:20: error:
 left shift of negative value [-Werror=shift-negative-value]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch fails with checkpatch.pl because the code uses
tab indention.

 disas/hppa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/hppa.c b/disas/hppa.c
index a2d371fdb1..0d1e99eab3 100644
--- a/disas/hppa.c
+++ b/disas/hppa.c
@@ -2699,7 +2699,7 @@ print_insn_hppa (bfd_vma memaddr, disassemble_info *info)
 		    int disp;
 
 		    if (sign)
-		      disp = (-1 << 10) | imm10;
+		      disp = (UINT_MAX << 10) | imm10;
 		    else
 		      disp = imm10;
 
@@ -2715,7 +2715,7 @@ print_insn_hppa (bfd_vma memaddr, disassemble_info *info)
 		    int disp;
 
 		    if (sign)
-		      disp = (-1 << 11) | imm11;
+		      disp = (UINT_MAX << 11) | imm11;
 		    else
 		      disp = imm11;
 
-- 
2.11.0


