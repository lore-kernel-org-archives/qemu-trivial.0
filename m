Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVAa-0000Mw-Hi
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:44:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvVAX-0000KX-Fn
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:44:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6j-00029e-S2
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:01 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00023S-7R; Wed, 16 Jan 2013 09:36:41 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 56D5D9FE7B;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9D9BD200AD; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:31 +0100
Message-Id: <1358346998-26328-5-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 04/11] readline: Fix unchecked strdup() by
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
X-List-Received-Date: Wed, 16 Jan 2013 15:44:50 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


