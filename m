Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJuK3-0006eJ-GH
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 17:50:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RJuK0-0006Ux-Vu
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 17:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RJuK0-0000zS-3a
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 17:50:40 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:33052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RJuJy-0000yd-0T; Fri, 28 Oct 2011 17:50:38 -0400
Received: by bke5 with SMTP id 5so757718bke.4
	for <multiple recipients>; Fri, 28 Oct 2011 14:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=F0nT4fl8bVZkPlRcFKGwl0jDF1sAJKJI+xxyimu7tRo=;
	b=Q8OL8O23Kdn0iF33EDcPmFNNfxO1DjyXYhjWkcZB/SO40z4sTRwbTzqzbFGWmcbCqS
	i/a05KqLKhR5nMknqeEtbs2WLzflURcVJNDN2LU1Vgw1cdleTLHPlHrRnacVABhJ7L3G
	ULi2Oud0wjE5bO3poghEqinMAuzeDZEeRFT2Q=
Received: by 10.204.15.208 with SMTP id l16mr3857868bka.18.1319838637043;
	Fri, 28 Oct 2011 14:50:37 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-4-61.pppoe.mtu-net.ru.
	[83.237.4.61])
	by mx.google.com with ESMTPS id e14sm8808803bka.0.2011.10.28.14.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Oct 2011 14:50:35 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 29 Oct 2011 01:50:33 +0400
Message-Id: <1319838633-25493-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] cmd: Fix potential memory leak
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
X-List-Received-Date: Fri, 28 Oct 2011 21:50:41 -0000

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
Note, that almost all code in the file violates CODING STYLE. The changed lines
are written wrt CODING STYLE (like commits 7d7d975c and c32d766a).
---
 cmd.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/cmd.c b/cmd.c
index abcf206..e1ae5a0 100644
--- a/cmd.c
+++ b/cmd.c
@@ -334,16 +334,21 @@ breakline(
 	int	c = 0;
 	char	*p;
 	char	**rval = calloc(sizeof(char *), 1);
+    char **tmp;
 
 	while (rval && (p = qemu_strsep(&input, " ")) != NULL) {
 		if (!*p)
 			continue;
 		c++;
-		rval = realloc(rval, sizeof(*rval) * (c + 1));
-		if (!rval) {
+        tmp = realloc(rval, sizeof(*rval) * (c + 1));
+        if (!tmp) {
+            free(rval);
+            rval = NULL;
 			c = 0;
 			break;
-		}
+        } else {
+            rval = tmp;
+        }
 		rval[c - 1] = p;
 		rval[c] = NULL;
 	}
-- 
1.7.0.4


