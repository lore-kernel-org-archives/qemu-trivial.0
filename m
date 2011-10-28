Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJuIU-0005sM-W3
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 17:49:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RJuIS-0005kP-3W
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 17:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RJuIR-0000ds-78
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 17:49:04 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:39546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RJuIP-0000dD-1w; Fri, 28 Oct 2011 17:49:01 -0400
Received: by bke5 with SMTP id 5so757008bke.4
	for <multiple recipients>; Fri, 28 Oct 2011 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EjS/vyhP+7cExD/jg8jmMzb2FwmeTO4xPsCf+xNq1pg=;
	b=WRp+bZQ7x0DF50VHlrkz791O9QhKH8ymbDbWuU7T5oSb95DCDYrwjPzBK1uTPyZ0aO
	O8akk6H6OUzKNMSbLAOq8lMgkcrMRuTWJw16ACoQUYFGlpEtsbw+Oyns8bbnxkj/nMCD
	zjlxA13v3Ga1KbSBsIp00VcI678qpOhq5v2X0=
Received: by 10.204.29.8 with SMTP id o8mr3746241bkc.48.1319838539327;
	Fri, 28 Oct 2011 14:48:59 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-4-61.pppoe.mtu-net.ru.
	[83.237.4.61])
	by mx.google.com with ESMTPS id w8sm8775987bks.11.2011.10.28.14.48.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Oct 2011 14:48:58 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 29 Oct 2011 01:48:53 +0400
Message-Id: <1319838533-25405-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] cmd: Fix potential NULL pointer dereference
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
X-List-Received-Date: Fri, 28 Oct 2011 21:49:05 -0000

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
Note, that almost all code in the file violates CODING STYLE. The changed lines
are written wrt CODING STYLE (like commits 7d7d975c and c32d766a).
---

 cmd.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/cmd.c b/cmd.c
index f77897e..abcf206 100644
--- a/cmd.c
+++ b/cmd.c
@@ -49,7 +49,7 @@ void
 add_command(
 	const cmdinfo_t	*ci)
 {
-	cmdtab = realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab));
+    cmdtab = g_realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab));
 	cmdtab[ncmds - 1] = *ci;
 	qsort(cmdtab, ncmds, sizeof(*cmdtab), compare);
 }
@@ -125,12 +125,7 @@ find_command(
 void
 add_user_command(char *optarg)
 {
-	ncmdline++;
-	cmdline = realloc(cmdline, sizeof(char*) * (ncmdline));
-	if (!cmdline) {
-		perror("realloc");
-		exit(1);
-	}
+    cmdline = g_realloc(cmdline, ++ncmdline * sizeof(char *));
 	cmdline[ncmdline-1] = optarg;
 }
 
@@ -194,7 +189,7 @@ command_loop(void)
 		doneline(input, v);
 	}
 	if (cmdline) {
-		free(cmdline);
+        g_free(cmdline);
 		return;
 	}
 
-- 
1.7.0.4


