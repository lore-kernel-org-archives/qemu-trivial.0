Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RQgid-0002Uv-PS
	for mharc-qemu-trivial@gnu.org; Wed, 16 Nov 2011 09:44:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RQgib-0002MH-7T
	for qemu-trivial@nongnu.org; Wed, 16 Nov 2011 09:44:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RQgiW-0002f8-DA
	for qemu-trivial@nongnu.org; Wed, 16 Nov 2011 09:44:05 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:54971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RQgiN-0002dQ-Fl; Wed, 16 Nov 2011 09:43:51 -0500
Received: from blackfin.pond.sub.org (p5B32D5E5.dip.t-dialin.net
	[91.50.213.229])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 85C7CA22CD;
	Wed, 16 Nov 2011 15:43:48 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id D96CD6006E; Wed, 16 Nov 2011 15:43:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2011 15:43:47 +0100
Message-Id: <1321454627-19403-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] monitor: Fix file_completion() to check for
	stat() failure
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
X-List-Received-Date: Wed, 16 Nov 2011 14:44:06 -0000

stat() can fail for a file name just read with readdir().  Easiest way
to trigger is a dangling symbolic link --- look ma, no race!  When it
fails, file_completion() uses sb.st_mode uninitialized.  If the
directory bit happens to be set, it appends a "/" to the completed
name.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor.c b/monitor.c
index 5ea35de..1be222e 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4207,9 +4207,9 @@ static void file_completion(const char *input)
             /* stat the file to find out if it's a directory.
              * In that case add a slash to speed up typing long paths
              */
-            stat(file, &sb);
-            if(S_ISDIR(sb.st_mode))
+            if (stat(file, &sb) == 0 && S_ISDIR(sb.st_mode)) {
                 pstrcat(file, sizeof(file), "/");
+            }
             readline_add_completion(cur_mon->rs, file);
         }
     }
-- 
1.7.6.4


