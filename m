Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txbip-0007US-4F
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 06:08:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamQ-0008Mh-1G
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamM-0000J5-IW
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:33 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam7-0000BW-2H; Tue, 22 Jan 2013 05:08:15 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 759C5A247C;
	Tue, 22 Jan 2013 11:08:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 55D05200AD; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:07:59 +0100
Message-Id: <1358849286-24750-5-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 04/11] readline: Fix unchecked strdup() by
	converting to g_strdup()
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
X-List-Received-Date: Tue, 22 Jan 2013 11:08:54 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 readline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/readline.c b/readline.c
index a0c9638..d6e04d4 100644
--- a/readline.c
+++ b/readline.c
@@ -247,14 +247,14 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
     }
     if (idx == READLINE_MAX_CMDS) {
 	/* Need to get one free slot */
-	free(rs->history[0]);
+        g_free(rs->history[0]);
 	memmove(rs->history, &rs->history[1],
 	        (READLINE_MAX_CMDS - 1) * sizeof(char *));
 	rs->history[READLINE_MAX_CMDS - 1] = NULL;
 	idx = READLINE_MAX_CMDS - 1;
     }
     if (new_entry == NULL)
-	new_entry = strdup(cmdline);
+        new_entry = g_strdup(cmdline);
     rs->history[idx] = new_entry;
     rs->hist_entry = -1;
 }
-- 
1.7.11.7


