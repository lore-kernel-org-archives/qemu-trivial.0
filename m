Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNVO-0003h0-Ln
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVI-0003XC-AE
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVD-0006rL-PK
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNUz-0006oR-To; Mon, 05 May 2014 14:20:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A84840752;
	Mon,  5 May 2014 22:20:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 927876B7;
	Mon,  5 May 2014 22:02:08 +0400 (MSK)
Received: (nullmailer pid 24258 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:02:01 +0400
Message-Id: <1399312923-24129-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hani Benhabiles <hani@linux.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>
Subject: [Qemu-trivial] [PULL 20/22] readline: Sort completions before
	printing them.
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
X-List-Received-Date: Mon, 05 May 2014 18:20:45 -0000

From: Hani Benhabiles <kroosec@gmail.com>

Signed-off-by: Hani Benhabiles <hani@linux.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/readline.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/readline.c b/util/readline.c
index a3fd2cb..8baec55 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -272,6 +272,11 @@ void readline_set_completion_index(ReadLineState *rs, int index)
     rs->completion_index = index;
 }
 
+static int completion_comp(const void *a, const void *b)
+{
+    return strcmp(*(const char **) a, *(const char **) b);
+}
+
 static void readline_completion(ReadLineState *rs)
 {
     int len, i, j, max_width, nb_cols, max_prefix;
@@ -295,6 +300,8 @@ static void readline_completion(ReadLineState *rs)
         if (len > 0 && rs->completions[0][len - 1] != '/')
             readline_insert_char(rs, ' ');
     } else {
+        qsort(rs->completions, rs->nb_completions, sizeof(char *),
+              completion_comp);
         rs->printf_func(rs->opaque, "\n");
         max_width = 0;
         max_prefix = 0;	
-- 
1.7.10.4


