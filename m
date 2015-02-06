Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgu-0006vk-KP
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgn-0006hp-5y
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgi-0006yg-7K
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:49 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46025 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgh-0006yH-FP
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:44 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgY-00084X-RD; Fri, 06 Feb 2015 22:43:34 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:09 +0100
Message-Id: <1423258997-30957-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 02/10] disas/sh4: Fix warning caused by
	missing 'static' attribute
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:55 -0000

Warning from the Sparse static analysis tool:

disas/sh4.c:335:22: warning:
 symbol 'sh_table' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/sh4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/sh4.c b/disas/sh4.c
index f6cadd5..020f5eb 100644
--- a/disas/sh4.c
+++ b/disas/sh4.c
@@ -332,7 +332,7 @@ typedef struct
 
 #ifdef DEFINE_TABLE
 
-const sh_opcode_info sh_table[] =
+static const sh_opcode_info sh_table[] =
   {
 /* 0111nnnni8*1.... add #<imm>,<REG_N>  */{"add",{A_IMM,A_REG_N},{HEX_7,REG_N,IMM0_8}, arch_sh1_up},
 
-- 
2.1.4


