Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wf1TP-0001r5-7R
	for mharc-qemu-trivial@gnu.org; Tue, 29 Apr 2014 02:24:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wf1TI-0001j0-7Q
	for qemu-trivial@nongnu.org; Tue, 29 Apr 2014 02:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wf1TD-00047h-99
	for qemu-trivial@nongnu.org; Tue, 29 Apr 2014 02:24:52 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:42365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Wf1T3-00046r-5p; Tue, 29 Apr 2014 02:24:37 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id BD2FC17F843; Tue, 29 Apr 2014 08:24:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue, 29 Apr 2014 08:24:34 +0200
Message-Id: <1398752674-23657-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qga: Fix typo (plural) in comment
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
X-List-Received-Date: Tue, 29 Apr 2014 06:24:57 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


