Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2o-00014f-U0
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2j-0000sS-44
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2e-000085-Tb
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-0008Vd-1t; Mon, 02 Sep 2013 07:11:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1BC1E40236;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 541744CE;
	Mon,  2 Sep 2013 15:01:58 +0400 (MSK)
Received: (nullmailer pid 14650 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:32 +0400
Message-Id: <1378119695-14568-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/15] tci: Remove function tcg_out64 (fix
	broken build)
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:41 -0000

From: Stefan Weil <sw@weilnetz.de>

Commit ac26eb69a311396668809eadbf7ff4e623447d4c added tcg_out64 to tcg/tcg.c.
tcg/tci/tcg-target.c already had a nearly identical implementation which is
now removed to fix a compiler error.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/tci/tcg-target.c |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
index e118bc7..eb23832 100644
--- a/tcg/tci/tcg-target.c
+++ b/tcg/tci/tcg-target.c
@@ -415,13 +415,6 @@ static void tcg_out_i(TCGContext *s, tcg_target_ulong v)
     s->code_ptr += sizeof(tcg_target_ulong);
 }
 
-/* Write 64 bit value. */
-static void tcg_out64(TCGContext *s, uint64_t v)
-{
-    *(uint64_t *)s->code_ptr = v;
-    s->code_ptr += sizeof(v);
-}
-
 /* Write opcode. */
 static void tcg_out_op_t(TCGContext *s, TCGOpcode op)
 {
-- 
1.7.10.4


