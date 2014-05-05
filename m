Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDg-0003zk-7I
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDa-0003n7-4m
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDV-00018O-Lb
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDM-00015g-El; Mon, 05 May 2014 14:02:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C7E84074F;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1564B671;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24214 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:44 +0400
Message-Id: <1399312923-24129-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/22] qga: Fix typo (plural) in comment
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
X-List-Received-Date: Mon, 05 May 2014 18:02:27 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index d838c3e..38219c9 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -1110,7 +1110,7 @@ int main(int argc, char **argv)
 
     if (ga_is_frozen(s)) {
         if (daemonize) {
-            /* delay opening/locking of pidfile till filesystem are unfrozen */
+            /* delay opening/locking of pidfile till filesystems are unfrozen */
             s->deferred_options.pid_filepath = pid_filepath;
             become_daemon(NULL);
         }
-- 
1.7.10.4


