Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb8-0007h5-Ib
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnaz-0007Bb-6Z
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnax-00023C-KB
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnat-00021j-2U; Fri, 11 Nov 2011 04:40:19 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 111DDA4113;
	Fri, 11 Nov 2011 10:40:11 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id E83C460070; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:09 +0100
Message-Id: <1321004409-3274-6-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 5/5] os-posix: Plug fd leak in
	qemu_create_pidfile()
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
X-List-Received-Date: Fri, 11 Nov 2011 09:40:27 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 os-posix.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index dbf3b24..dc4a6bb 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -372,13 +372,16 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
     if (lockf(fd, F_TLOCK, 0) == -1) {
+        close(fd);
         return -1;
     }
     len = snprintf(buffer, sizeof(buffer), FMT_pid "\n", getpid());
     if (write(fd, buffer, len) != len) {
+        close(fd);
         return -1;
     }
 
+    close(fd);
     return 0;
 }
 
-- 
1.7.6.4


