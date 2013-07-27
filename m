Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z1i-0004K6-EB
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:34:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1f-0004F2-MW
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1e-0006Vw-M7
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z1c-0006RE-RF; Sat, 27 Jul 2013 03:34:48 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3879E42F73;
	Sat, 27 Jul 2013 11:34:48 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 532D720288A; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:26 +0400
Message-Id: <1374910406-15273-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 11/11] target-mips: Remove assignment
	to a variable which is never used
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
X-List-Received-Date: Sat, 27 Jul 2013 07:34:52 -0000

From: Stefan Weil <sw@weilnetz.de>

This assignment causes a compiler warning for compilations with the compiler
option -Wunused-but-set-variable (which is included with -Wextra).

Removing it allows using -Wextra for QEMU code without suppressing too many
extra warnings.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-mips/op_helper.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 5cf1c3f..b828375 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -1735,7 +1735,6 @@ target_ulong helper_evpe(CPUMIPSState *env)
 void helper_fork(target_ulong arg1, target_ulong arg2)
 {
     // arg1 = rt, arg2 = rs
-    arg1 = 0;
     // TODO: store to TC register
 }
 
-- 
1.7.10.4


