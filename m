Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4FTt-0008Oa-JO
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 16:25:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EGS-0008KC-C2
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EGN-000526-6i
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:07:48 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4EGC-0004hf-0d; Mon, 07 Jul 2014 15:07:32 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0180E17FA16; Mon,  7 Jul 2014 21:07:29 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:07:29 +0200
Message-Id: <1404760049-29815-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qga: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 07 Jul 2014 20:25:43 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


