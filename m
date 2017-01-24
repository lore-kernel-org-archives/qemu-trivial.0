Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxoZ-0001kf-8n
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:54:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoW-0001i0-Jd
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoV-0005kg-NJ
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005iV-8G; Tue, 24 Jan 2017 04:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 20E5E42108;
	Tue, 24 Jan 2017 12:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 334B5589;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12647 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:23 +0300
Message-Id: <95d294e069dcfcde3ddeb0a965c8258f98f7dbe6.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/31] disas/cris.c: Fix Coverity warning
 about unchecked NULL
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
X-List-Received-Date: Tue, 24 Jan 2017 09:54:57 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Coverity (CID 1005689) warns that we don't check that
spec_reg_info() returned non-NULL before dereferencing.
Add the check, though as the comment notes this is
a can't-really-happen case because the earlier constraint
matching should have ruled out the "unknown reg" case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/cris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/cris.c b/disas/cris.c
index 08161d1..8a1daf9 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -2490,7 +2490,7 @@ print_with_operands (const struct cris_opcode *opcodep,
 	const struct cris_spec_reg *sregp
 	  = spec_reg_info ((insn >> 12) & 15, disdata->distype);
 
-	if (sregp->name == NULL)
+	if (sregp == NULL || sregp->name == NULL)
 	  /* Should have been caught as a non-match earlier.  */
 	  *tp++ = '?';
 	else
-- 
2.1.4


