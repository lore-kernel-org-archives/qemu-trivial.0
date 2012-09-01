Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7jfL-0001nN-OT
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 05:06:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7jfI-0001do-MZ
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 05:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7jfH-0007DD-SH
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 05:06:52 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7jfD-0007BD-Ts; Sat, 01 Sep 2012 05:06:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7B56C7280021; Sat,  1 Sep 2012 11:06:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Er+KqeTrYrfC; Sat,  1 Sep 2012 11:06:45 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id C8FCC728002B; Sat,  1 Sep 2012 11:06:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Kevin Wolf <kwolf@redhat.com>
Date: Sat,  1 Sep 2012 11:06:45 +0200
Message-Id: <1346490405-18889-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] block/curl: Fix wrong free statement
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
X-List-Received-Date: Sat, 01 Sep 2012 09:06:53 -0000

Report from smatch:
block/curl.c:546 curl_close(21) info: redundant null check on s->url calling free()

The check was redundant, and free was also wrong because the memory
was allocated using g_strdup.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/curl.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index e7c3634..c1074cd 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -542,8 +542,7 @@ static void curl_close(BlockDriverState *bs)
     }
     if (s->multi)
         curl_multi_cleanup(s->multi);
-    if (s->url)
-        free(s->url);
+    g_free(s->url);
 }
 
 static int64_t curl_getlength(BlockDriverState *bs)
-- 
1.7.10


