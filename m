Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Vd-00070Z-Au
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VW-0006o9-Ff
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VS-0003qP-Ng
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4VL-0003lq-S5; Tue, 10 Feb 2015 01:41:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 25D1641828;
	Tue, 10 Feb 2015 09:41:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F2F9B94A;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9408 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:26 +0300
Message-Id: <d538b947da8f12ddc118714677fa66fd4f1dd136.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 37/46] disas/cris: Fix warning caused by
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:19 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

disas/cris.c:1218:26: warning:
 symbol 'cris_cond15s' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/cris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/cris.c b/disas/cris.c
index 9dfb4e3..a034dba 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -1215,7 +1215,7 @@ cris_cc_strings[] =
 };
 
 /* Different names and semantics for condition 1111 (0xf).  */
-const struct cris_cond15 cris_cond15s[] =
+static const struct cris_cond15 cris_cond15s[] =
 {
   /* FIXME: In what version did condition "ext" disappear?  */
   {"ext", cris_ver_v0_3},
-- 
2.1.4


