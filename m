Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRqRs-00063g-TI
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2011 14:19:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RRqRq-0005z4-Th
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2011 14:19:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RRqRq-0007uL-2x
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2011 14:19:34 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RRqRn-0007r0-Js; Sat, 19 Nov 2011 14:19:31 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	575717281889; Sat, 19 Nov 2011 20:19:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id D7MpffxD4iHK; Sat, 19 Nov 2011 20:18:40 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 03847728188A; Sat, 19 Nov 2011 20:18:39 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 19 Nov 2011 20:18:39 +0100
Message-Id: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] darwin-user: Fix format string in debug
	message
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
X-List-Received-Date: Sat, 19 Nov 2011 19:19:35 -0000

This was spotted by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 darwin-user/signal.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/darwin-user/signal.c b/darwin-user/signal.c
index c530227..317ef92 100644
--- a/darwin-user/signal.c
+++ b/darwin-user/signal.c
@@ -270,8 +270,7 @@ int do_sigaction(int sig, const struct sigaction *act,
         host_sig = target_to_host_signal(sig);
         if (host_sig != SIGSEGV && host_sig != SIGBUS) {
 #if defined(DEBUG_SIGNAL)
-    fprintf(stderr, "sigaction handler going to call sigaction\n",
-            act->sa_handler, act->sa_flags, act->sa_mask);
+            fprintf(stderr, "sigaction handler going to call sigaction\n");
 #endif
 
             sigfillset(&act1.sa_mask);
-- 
1.7.2.5


