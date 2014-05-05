Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNom-00034c-3R
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNof-00030T-6i
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNoa-0005T6-M1
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNoN-0005QU-4t; Mon, 05 May 2014 14:40:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E8AB640755;
	Mon,  5 May 2014 22:40:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 80CED6B6;
	Mon,  5 May 2014 22:02:08 +0400 (MSK)
Received: (nullmailer pid 24256 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:02:00 +0400
Message-Id: <1399312923-24129-20-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/22] readline: use g_strndup instead of
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
X-List-Received-Date: Mon, 05 May 2014 18:40:46 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 util/readline.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/util/readline.c b/util/readline.c
index 8441be4..a3fd2cb 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -279,9 +279,7 @@ static void readline_completion(ReadLineState *rs)
=20
     rs->nb_completions =3D 0;
=20
-    cmdline =3D g_malloc(rs->cmd_buf_index + 1);
-    memcpy(cmdline, rs->cmd_buf, rs->cmd_buf_index);
-    cmdline[rs->cmd_buf_index] =3D '\0';
+    cmdline =3D g_strndup(rs->cmd_buf, rs->cmd_buf_index);
     rs->completion_finder(rs->opaque, cmdline);
     g_free(cmdline);
=20
--=20
1.7.10.4


