Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCuZ-0000Xz-Oj
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuS-0000F9-7O
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuR-0000wz-FA
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCuO-0000vM-Jg; Wed, 04 Mar 2015 12:16:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A8EB408A3;
	Wed,  4 Mar 2015 20:16:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 576CB959;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17565 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:57 +0300
Message-Id: <806021fc0fac27559d6b3d8ef9a47ffb2925349a.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 40/47] disas/cris: Fix warning caused by
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
X-List-Received-Date: Wed, 04 Mar 2015 17:16:41 -0000

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


