Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDd-0002PD-RY
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDW-0002AP-DI
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDR-0007Ws-F0
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDG-0007Tq-VS; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 993BD412CF;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4F38D6CF;
	Tue, 10 Jun 2014 20:08:49 +0400 (MSK)
Received: (nullmailer pid 13317 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:31 +0400
Message-Id: <1402416523-13212-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/25] target-i386/translate.c: Remove unused
	tcg_gen_lshift()
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:16 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The function tcg_gen_lshift() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/translate.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/target-i386/translate.c b/target-i386/translate.c
index 2359787..6fcd824 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -1506,14 +1506,6 @@ static void gen_shift_rm_im(DisasContext *s, TCGMemOp ot, int op1, int op2,
     }
 }
 
-static inline void tcg_gen_lshift(TCGv ret, TCGv arg1, target_long arg2)
-{
-    if (arg2 >= 0)
-        tcg_gen_shli_tl(ret, arg1, arg2);
-    else
-        tcg_gen_shri_tl(ret, arg1, -arg2);
-}
-
 static void gen_rot_rm_T1(DisasContext *s, TCGMemOp ot, int op1, int is_right)
 {
     target_ulong mask = (ot == MO_64 ? 0x3f : 0x1f);
-- 
1.7.10.4


