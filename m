Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0zU-00089U-9P
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:23:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zO-0007vT-B8
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zK-0008Gb-5V
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0zB-0008An-9V; Fri, 06 Dec 2013 14:22:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CC9FC40DD3;
	Fri,  6 Dec 2013 23:22:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7E4B0607;
	Fri,  6 Dec 2013 23:15:45 +0400 (MSK)
Received: (nullmailer pid 19234 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:39 +0400
Message-Id: <1386357341-19147-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 12/14] Don't crash on keyboard input with no
	handler
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
X-List-Received-Date: Fri, 06 Dec 2013 19:23:03 -0000

From: Don Koch <dkoch@verizon.com>

Prevent a call to put_kbd if null.

On shutdown of some OSes, the keyboard handler goes away before the
system is down. If a key is typed during this window, qemu crashes.

Signed-off-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/input.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/input.c b/ui/input.c
index 10d8c05..1c70f60 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -414,7 +414,7 @@ void kbd_put_keycode(int keycode)
     if (!runstate_is_running() && !runstate_check(RUN_STATE_SUSPENDED)) {
         return;
     }
-    if (entry) {
+    if (entry && entry->put_kbd) {
         entry->put_kbd(entry->opaque, keycode);
     }
 }
-- 
1.7.10.4


