Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SE0KK-0004X4-Uy
	for mharc-qemu-trivial@gnu.org; Sat, 31 Mar 2012 11:34:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SE0KI-0004Ni-1n
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 11:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SE0KG-0006KZ-DT
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 11:34:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SE0KC-0006JW-VM; Sat, 31 Mar 2012 11:34:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2146272800AF; Sat, 31 Mar 2012 17:34:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UM0HkSyFKtUn; Sat, 31 Mar 2012 17:34:42 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 61C3172800B0; Sat, 31 Mar 2012 17:34:42 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 31 Mar 2012 17:34:41 +0200
Message-Id: <1333208081-26421-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block/curl: Replace usleep by g_usleep
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
X-List-Received-Date: Sat, 31 Mar 2012 15:34:51 -0000

The function usleep is not available for all supported platforms:
at least some versions of MinGW don't support it.

usleep was also declared obsolete by POSIX.1-2001.

The function g_usleep is part of glib2.0, so it is available for
all supported platforms.

Using nanosleep would also be possible but needs more code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/curl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index e9102e3..a909eca 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -282,7 +282,7 @@ static CURLState *curl_init_state(BDRVCURLState *s)
             break;
         }
         if (!state) {
-            usleep(100);
+            g_usleep(100);
             curl_multi_do(s);
         }
     } while(!state);
-- 
1.7.9


