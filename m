Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88r4-0007ua-7V
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qw-0007fi-AU
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qr-0001mV-95
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001ee-Pn; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 05A734386D;
	Fri, 18 Jul 2014 18:09:15 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E0DDD6BD;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 631 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:11 +0400
Message-Id: <1405692553-564-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 6/8] qga: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:44 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-posix.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 34ddba0..8e6272c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -643,7 +643,7 @@ typedef enum {
     FSFREEZE_HOOK_FREEZE,
 } FsfreezeHookArg;
 
-const char *fsfreeze_hook_arg_string[] = {
+static const char *fsfreeze_hook_arg_string[] = {
     "thaw",
     "freeze",
 };
-- 
1.7.10.4


