Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCaac-0002zH-Sm
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2013 15:30:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VCaaV-0002tF-21
	for qemu-trivial@nongnu.org; Thu, 22 Aug 2013 15:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VCaaQ-0005bX-3r
	for qemu-trivial@nongnu.org; Thu, 22 Aug 2013 15:30:30 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:51938
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VCaaF-0005XN-S4; Thu, 22 Aug 2013 15:30:15 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id DC70417F56C; Thu, 22 Aug 2013 21:30:10 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu, 22 Aug 2013 21:30:09 +0200
Message-Id: <1377199809-12208-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] monitor: Add missing attributes to local
	function
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
X-List-Received-Date: Thu, 22 Aug 2013 19:30:36 -0000

Function expr_error gets a format string and variable arguments like printf.
It also never returns. Add the necessary attributes.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 monitor.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index da9c9a2..6413d44 100644
--- a/monitor.c
+++ b/monitor.c
@@ -3171,7 +3171,8 @@ static const MonitorDef monitor_defs[] = {
     { NULL },
 };
 
-static void expr_error(Monitor *mon, const char *fmt, ...)
+static void GCC_FMT_ATTR(2, 3) QEMU_NORETURN
+expr_error(Monitor *mon, const char *fmt, ...)
 {
     va_list ap;
     va_start(ap, fmt);
-- 
1.7.10.4


