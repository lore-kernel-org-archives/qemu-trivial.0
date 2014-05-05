Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNVN-0003eK-6z
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVF-0003V0-Lo
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVB-0006qt-6L
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNV0-0006p6-K9; Mon, 05 May 2014 14:20:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A099840756;
	Mon,  5 May 2014 22:20:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CEBDC6B2;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24235 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:51 +0400
Message-Id: <1399312923-24129-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/22] ui: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 05 May 2014 18:20:42 -0000

From: Stefan Weil <sw@weilnetz.de>

There was already a forward declaration using 'static',
but the attribute was missing in the implementation.

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/console.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index e057755..34d1eaa 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1407,7 +1407,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
     qemu_free_displaysurface(old_surface);
 }
 
-void dpy_refresh(DisplayState *s)
+static void dpy_refresh(DisplayState *s)
 {
     DisplayChangeListener *dcl;
 
-- 
1.7.10.4


