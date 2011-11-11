Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb7-0007ew-Lh
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnay-0007AN-Nf
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnax-000235-9c
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnas-00020B-Dw; Fri, 11 Nov 2011 04:40:18 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 7B65DA3FC8;
	Fri, 11 Nov 2011 10:40:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id CF9286006F; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:07 +0100
Message-Id: <1321004409-3274-4-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/5] qemu-sockets: Plug fd leak on
	unix_connect_opts() error path
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
X-List-Received-Date: Fri, 11 Nov 2011 09:40:26 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-sockets.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/qemu-sockets.c b/qemu-sockets.c
index 183a9cb..61b2247 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -572,6 +572,7 @@ int unix_connect_opts(QemuOpts *opts)
     snprintf(un.sun_path, sizeof(un.sun_path), "%s", path);
     if (connect(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
         fprintf(stderr, "connect(unix:%s): %s\n", path, strerror(errno));
+        close(sock);
 	return -1;
     }
 
-- 
1.7.6.4


