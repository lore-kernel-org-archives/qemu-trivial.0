Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoFPr-0006MI-Bj
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 12:02:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoESE-00070s-FM
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 11:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoESB-0005Wh-Ic
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 11:01:18 -0400
Received: from [2a03:4000:2:362::1] (port=44872
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoES5-0005Tk-Sm; Sun, 16 Jun 2013 11:01:09 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 66A581828E7; Sun, 16 Jun 2013 17:01:06 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 16 Jun 2013 17:01:05 +0200
Message-Id: <1371394865-19485-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
X-Mailman-Approved-At: Sun, 16 Jun 2013 12:02:53 -0400
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] qemu-img: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Sun, 16 Jun 2013 15:01:19 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-img.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index a2967ea..9c9254a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -128,7 +128,7 @@ static void QEMU_NORETURN help(void)
     exit(1);
 }
 
-static int qprintf(bool quiet, const char *fmt, ...)
+static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
 {
     int ret = 0;
     if (!quiet) {
-- 
1.7.10.4


