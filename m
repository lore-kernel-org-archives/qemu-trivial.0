Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YS3ah-0004Wj-00
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2015 08:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3ae-0004RD-Bl
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 08:07:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3ad-0004mD-Gn
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 08:07:24 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YS3ab-0004gg-FA; Sun, 01 Mar 2015 08:07:21 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 451181803EC; Sun,  1 Mar 2015 14:07:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  1 Mar 2015 14:07:18 +0100
Message-Id: <1425215238-25799-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] disas/cris: Fix warning caused by missing
	'static' attribute
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
X-List-Received-Date: Sun, 01 Mar 2015 13:07:25 -0000

Warning from the Sparse static analysis tool:

disas/cris.c:1218:26: warning:
 symbol 'cris_cond15s' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/cris.c |    2 +-
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
1.7.10.4


