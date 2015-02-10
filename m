Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fH-00068B-97
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fE-00062w-Jp
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fD-0007oQ-TP
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f2-0007kW-FV; Tue, 10 Feb 2015 01:51:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4FA9041822;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3B656961;
	Tue, 10 Feb 2015 09:34:48 +0300 (MSK)
Received: (nullmailer pid 9410 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:27 +0300
Message-Id: <59c1c2e257f6c38424ce5e6b037a652b09fd6891.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 38/46] disas/sh4: Fix warning caused by
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:17 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

disas/sh4.c:335:22: warning:
 symbol 'sh_table' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


