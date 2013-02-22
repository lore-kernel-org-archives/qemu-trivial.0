Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8m7O-0006kt-5q
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 01:28:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U8m7G-0006Mm-3g
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 01:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U8m7D-00033v-BM
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 01:28:18 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1U8m74-00032N-OL; Fri, 22 Feb 2013 01:28:06 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	725C27280047; Fri, 22 Feb 2013 07:28:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ov4D1PQ13FgM; Fri, 22 Feb 2013 07:28:02 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8947E728004A; Fri, 22 Feb 2013 07:28:02 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri, 22 Feb 2013 07:28:01 +0100
Message-Id: <1361514481-26164-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] ui/gtk: Fix build (missing include for
	setlocale)
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
X-List-Received-Date: Fri, 22 Feb 2013 06:28:23 -0000

At least for Ubuntu Linux locale.h is needed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is a build regression, please apply without waiting for qemu-trivial.

Thanks,
Stefan

 ui/gtk.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 29156be..5f91de4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -37,6 +37,7 @@
 #include <gtk/gtk.h>
 #include <gdk/gdkkeysyms.h>
 #include <glib/gi18n.h>
+#include <locale.h>
 #include <vte/vte.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-- 
1.7.10.4


