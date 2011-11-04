Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMGjE-0001OW-3X
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 06:10:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RMGjA-0000up-CA
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 06:10:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RMGj1-0003px-27
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 06:10:18 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:51214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RMGiq-0003k5-Lt; Fri, 04 Nov 2011 06:10:04 -0400
Received: from blackfin.pond.sub.org (p5B32A39D.dip.t-dialin.net
	[91.50.163.157])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 46880A3FC8;
	Fri,  4 Nov 2011 11:10:02 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id B4B2B6006D; Fri,  4 Nov 2011 11:10:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  4 Nov 2011 11:10:01 +0100
Message-Id: <1320401401-28871-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] readline: Fix buffer overrun on re-add to
	history
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
X-List-Received-Date: Fri, 04 Nov 2011 10:10:25 -0000

readline_hist_add() moves the history entry to the end of history.  It
uses memmove() to move rs->history[idx + 1..] to rs->history[idx..].
However, its size argument is off by two array elements, so it writes
one element beyond rs->history[], and reads two.

On my system, this clobbers rs->hist_entry and the hole right after
it.  Since the function assigns to rs->hist_entry in time, the bug has
no ill effects for me.

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 readline.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/readline.c b/readline.c
index 6a3160a..a6c0039 100644
--- a/readline.c
+++ b/readline.c
@@ -236,7 +236,7 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
 	    new_entry = hist_entry;
 	    /* Put this entry at the end of history */
 	    memmove(&rs->history[idx], &rs->history[idx + 1],
-		    (READLINE_MAX_CMDS - idx + 1) * sizeof(char *));
+		    (READLINE_MAX_CMDS - (idx + 1)) * sizeof(char *));
 	    rs->history[READLINE_MAX_CMDS - 1] = NULL;
 	    for (; idx < READLINE_MAX_CMDS; idx++) {
 		if (rs->history[idx] == NULL)
-- 
1.7.6.4


