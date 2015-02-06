Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqPN-0005jY-4d
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:25:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqPK-0005ii-Jg
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqPE-0001Rf-It
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:25:44 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:45983 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqPE-0001RZ-86
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:25:40 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqP9-0007qY-UY; Fri, 06 Feb 2015 22:25:35 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnug.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:25:27 +0100
Message-Id: <1423257927-30126-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
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
X-List-Received-Date: Fri, 06 Feb 2015 21:25:48 -0000

Warning from the Sparse static analysis tool:

disas/cris.c:1218:26: warning:
 symbol 'cris_cond15s' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


