Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RebJ8-0007qF-G1
	for mharc-qemu-trivial@gnu.org; Sat, 24 Dec 2011 18:47:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RebJ6-0007kb-4k
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 18:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RebJ5-00010I-Dp
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 18:47:16 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:48070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RebJ3-0000zd-93; Sat, 24 Dec 2011 18:47:13 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RebJ1-0001aP-D0; Sat, 24 Dec 2011 23:47:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 24 Dec 2011 23:47:11 +0000
Message-Id: <1324770431-6074-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] net/socket.c: Fix fd leak in
	net_socket_listen_init() error paths
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
X-List-Received-Date: Sat, 24 Dec 2011 23:47:17 -0000

Fix a leak of a file descriptor due to missing closesocket() calls
in error paths in net_socket_listen_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Coverity again...

 net/socket.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index aaf9be4..c9d70d3 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -427,12 +427,14 @@ static int net_socket_listen_init(VLANState *vlan,
     if (ret < 0) {
         perror("bind");
         g_free(s);
+        closesocket(fd);
         return -1;
     }
     ret = listen(fd, 0);
     if (ret < 0) {
         perror("listen");
         g_free(s);
+        closesocket(fd);
         return -1;
     }
     s->vlan = vlan;
-- 
1.7.5.4


