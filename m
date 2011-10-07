Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RC39Z-0001fs-Pn
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2011 01:39:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RC39V-0001Tb-Tt
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2011 01:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RC39U-0003Xe-Or
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2011 01:39:21 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RC39S-0003XJ-Fh; Fri, 07 Oct 2011 01:39:18 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	CBAF272833FB; Fri,  7 Oct 2011 07:39:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id MfUMVZza7C4u; Fri,  7 Oct 2011 07:38:47 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 711FD72833FC; Fri,  7 Oct 2011 07:38:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri,  7 Oct 2011 07:38:46 +0200
Message-Id: <1317965926-1696-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qemu-char: Fix use of free() instead of
	g_free()
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
X-List-Received-Date: Fri, 07 Oct 2011 05:39:23 -0000

cppcheck reported these errors:

qemu-char.c:1667: error: Mismatching allocation and deallocation: s
qemu-char.c:1668: error: Mismatching allocation and deallocation: chr
qemu-char.c:1769: error: Mismatching allocation and deallocation: s
qemu-char.c:1770: error: Mismatching allocation and deallocation: chr

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-char.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 09d2309..e1b2b87 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1664,8 +1664,8 @@ static int qemu_chr_open_win(QemuOpts *opts, CharDriverState **_chr)
     chr->chr_close = win_chr_close;
 
     if (win_chr_init(chr, filename) < 0) {
-        free(s);
-        free(chr);
+        g_free(s);
+        g_free(chr);
         return -EIO;
     }
     qemu_chr_generic_open(chr);
@@ -1766,8 +1766,8 @@ static int qemu_chr_open_win_pipe(QemuOpts *opts, CharDriverState **_chr)
     chr->chr_close = win_chr_close;
 
     if (win_chr_pipe_init(chr, filename) < 0) {
-        free(s);
-        free(chr);
+        g_free(s);
+        g_free(chr);
         return -EIO;
     }
     qemu_chr_generic_open(chr);
-- 
1.7.2.5


