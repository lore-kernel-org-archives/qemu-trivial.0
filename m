Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTDTf-0007xB-73
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:48:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTY-0007mk-LN
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTU-0006Zb-FG
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTDTH-0006TO-Hr; Thu, 27 Mar 2014 12:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2DBCA436DC;
	Thu, 27 Mar 2014 20:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 469CB678;
	Thu, 27 Mar 2014 19:28:31 +0400 (MSK)
Received: (nullmailer pid 1773 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:09 +0400
Message-Id: <1395934108-1694-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/23] util: Add 'static' attribute to
	function implementation
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
X-List-Received-Date: Thu, 27 Mar 2014 16:48:26 -0000

From: Stefan Weil <sw@weilnetz.de>

The static code analyzer smatch complains because of a missing 'static'
attribute:

util/module.c:166:6: warning:
 symbol 'module_load' was not declared. Should it be static?

'static' is used in the forward declaration, but not in the implementation.
Add it there, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


