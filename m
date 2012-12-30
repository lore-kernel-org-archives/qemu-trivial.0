Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TpDCC-0001cR-CZ
	for mharc-qemu-trivial@gnu.org; Sun, 30 Dec 2012 02:20:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TpDC7-0001NN-7b
	for qemu-trivial@nongnu.org; Sun, 30 Dec 2012 02:20:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TpDC4-0001aR-R5
	for qemu-trivial@nongnu.org; Sun, 30 Dec 2012 02:20:27 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TpDBz-0001SF-9i; Sun, 30 Dec 2012 02:20:19 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	38FD97280048; Sun, 30 Dec 2012 08:20:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gNHInI2Ud5RK; Sun, 30 Dec 2012 08:20:16 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 943C0728004A; Sun, 30 Dec 2012 08:20:16 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 30 Dec 2012 08:20:13 +0100
Message-Id: <1356852013-12955-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] tcg: Remove unneeded assertion
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
X-List-Received-Date: Sun, 30 Dec 2012 07:20:30 -0000

Commit 7f6f0ae5b95adfa76e10eabe2c34424a955fd10c added two assertions.

One of these assertions is not needed:
The pointer ts is never NULL because it is initialized with the
address of an array element.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tcg.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ede51a3..9275e37 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -800,7 +800,6 @@ static char *tcg_get_arg_str_idx(TCGContext *s, char *buf, int buf_size,
 
     assert(idx >= 0 && idx < s->nb_temps);
     ts = &s->temps[idx];
-    assert(ts);
     if (idx < s->nb_globals) {
         pstrcpy(buf, buf_size, ts->name);
     } else {
-- 
1.7.10.4


