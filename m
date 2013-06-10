Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um8tk-00019n-4o
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 16:41:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8th-00014Y-Dc
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8tg-0005bc-Dr
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:41:01 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:52593
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8td-0005aj-HB; Mon, 10 Jun 2013 16:40:57 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 9DBEE18218F; Mon, 10 Jun 2013 22:40:54 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 10 Jun 2013 22:40:52 +0200
Message-Id: <1370896852-12473-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Blue Swirl <blauwirbel@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] target-sparc: Replace free by g_free
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
X-List-Received-Date: Mon, 10 Jun 2013 20:41:02 -0000

The wrong function was reported by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-sparc/cpu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index 290b580..13bb7bb 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -614,7 +614,7 @@ static int cpu_sparc_find_by_name(sparc_def_t *cpu_def, const char *cpu_model)
     return 0;
 
  error:
-    free(s);
+    g_free(s);
     return -1;
 }
 
-- 
1.7.10.4


