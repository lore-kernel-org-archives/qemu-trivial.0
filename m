Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb8-0007hz-SB
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnaz-0007Bc-7A
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnax-00023H-P2
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnas-00020C-Du; Fri, 11 Nov 2011 04:40:18 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 85D31A4112;
	Fri, 11 Nov 2011 10:40:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id DD36060071; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:08 +0100
Message-Id: <1321004409-3274-5-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 4/5] posix-aio-compat: Plug memory leak on
	paio_init() error path
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
 posix-aio-compat.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/posix-aio-compat.c b/posix-aio-compat.c
index d3c1174..0c0035c 100644
--- a/posix-aio-compat.c
+++ b/posix-aio-compat.c
@@ -667,6 +667,7 @@ int paio_init(void)
     s->first_aio = NULL;
     if (qemu_pipe(fds) == -1) {
         fprintf(stderr, "failed to create pipe\n");
+        g_free(s);
         return -1;
     }
 
-- 
1.7.6.4


