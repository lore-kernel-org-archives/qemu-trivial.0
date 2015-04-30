Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwM-0005fj-6n
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwE-0005NC-0f
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwD-0002bQ-7C
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002Z4-9E; Thu, 30 Apr 2015 02:27:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A429942BA1;
	Thu, 30 Apr 2015 09:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A33A95D;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4358 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:45 +0300
Message-Id: <3cb64013c4213b24ebf1ee96e706339fc8f6d789.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 32/42] input: remove unused mouse_handlers list
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:11 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/input-legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 2d4ca19..3e9bb38 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -57,8 +57,6 @@ struct QEMUPutLEDEntry {
 
 static QTAILQ_HEAD(, QEMUPutLEDEntry) led_handlers =
     QTAILQ_HEAD_INITIALIZER(led_handlers);
-static QTAILQ_HEAD(, QEMUPutMouseEntry) mouse_handlers =
-    QTAILQ_HEAD_INITIALIZER(mouse_handlers);
 
 int index_from_key(const char *key)
 {
-- 
2.1.4


