Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPFOp-00062N-Jm
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:03:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFOm-0005yn-Ca
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFOl-0002Yr-Hq
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:03:00 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52017
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFOj-0002YS-SQ; Sun, 16 Mar 2014 14:02:58 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id AD85B17FF89; Sun, 16 Mar 2014 19:02:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 19:02:52 +0100
Message-Id: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] util: Add 'static' attribute to function
	implementation
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
X-List-Received-Date: Sun, 16 Mar 2014 18:03:01 -0000

The static code analyzer smatch complains because of a missing 'static'
attribute:

util/module.c:166:6: warning:
 symbol 'module_load' was not declared. Should it be static?

'static' is used in the forward declaration, but not in the implementation.
Add it there, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 util/module.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 863a8a3..214effb 100644
--- a/util/module.c
+++ b/util/module.c
@@ -163,7 +163,7 @@ out:
 }
 #endif
 
-void module_load(module_init_type type)
+static void module_load(module_init_type type)
 {
 #ifdef CONFIG_MODULES
     char *fname = NULL;
-- 
1.7.10.4


