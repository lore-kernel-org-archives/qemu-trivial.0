Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rl3E3-0003V3-2q
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2012 13:48:43 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl3Dr-0002qj-2f
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl3De-0004Kt-4C
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:48:27 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rl3D1-0004If-JN; Wed, 11 Jan 2012 13:47:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E175E7280003; Wed, 11 Jan 2012 19:47:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2rfbqHycPx93; Wed, 11 Jan 2012 19:47:37 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B14E67280009; Wed, 11 Jan 2012 19:47:37 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 11 Jan 2012 19:47:37 +0100
Message-Id: <1326307657-2132-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] virtfs-proxy-helper: Add missing printf
	format attribute
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
X-List-Received-Date: Wed, 11 Jan 2012 18:48:40 -0000

Every function with printf like arguments must have it
(see file HACKING), so add it.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 fsdev/virtfs-proxy-helper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 21e9b16..4a507d8 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -54,7 +54,7 @@ static struct option helper_opts[] = {
 static bool is_daemon;
 static bool get_version; /* IOC getversion IOCTL supported */
 
-static void do_log(int loglevel, const char *format, ...)
+static void GCC_FMT_ATTR(2, 3) do_log(int loglevel, const char *format, ...)
 {
     va_list ap;
 
-- 
1.7.2.5


