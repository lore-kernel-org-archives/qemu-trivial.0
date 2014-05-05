Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhF9Q-00034M-1n
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhF9J-00030Q-Kc
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhF9E-0008CZ-OU
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:25:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhF94-00089H-DF; Mon, 05 May 2014 05:25:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D143C4068E;
	Mon,  5 May 2014 13:25:08 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C07C55FE;
	Mon,  5 May 2014 13:25:08 +0400 (MSK)
Received: (nullmailer pid 523 invoked by uid 1000);
	Mon, 05 May 2014 09:25:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Mon,  5 May 2014 13:25:06 +0400
Message-Id: <1399281906-479-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] readline: use g_strndup instead of
	open-coding it
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
X-List-Received-Date: Mon, 05 May 2014 09:25:30 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/readline.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/util/readline.c b/util/readline.c
index 8441be4..a3fd2cb 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -279,9 +279,7 @@ static void readline_completion(ReadLineState *rs)
 
     rs->nb_completions = 0;
 
-    cmdline = g_malloc(rs->cmd_buf_index + 1);
-    memcpy(cmdline, rs->cmd_buf, rs->cmd_buf_index);
-    cmdline[rs->cmd_buf_index] = '\0';
+    cmdline = g_strndup(rs->cmd_buf, rs->cmd_buf_index);
     rs->completion_finder(rs->opaque, cmdline);
     g_free(cmdline);
 
-- 
1.7.10.4


