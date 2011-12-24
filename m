Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Reb9g-0006hE-UY
	for mharc-qemu-trivial@gnu.org; Sat, 24 Dec 2011 18:37:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Reb9d-0006VN-Is
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 18:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Reb9c-0008Jz-QF
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 18:37:29 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:44654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Reb9a-0008Jc-TV; Sat, 24 Dec 2011 18:37:27 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Reb9Y-0001Z4-3y; Sat, 24 Dec 2011 23:37:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 24 Dec 2011 23:37:24 +0000
Message-Id: <1324769844-5991-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] gdbstub: Fix fd leak in gdbserver_open()
	error path
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
X-List-Received-Date: Sat, 24 Dec 2011 23:37:31 -0000

Fix a leak of a file descriptor in error exit paths in
gdbserver_open().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Of no great consequence, but it was in the pile of coverity complaints
and it's a trivial fix.

 gdbstub.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a5806ef..7d470b6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2762,11 +2762,13 @@ static int gdbserver_open(int port)
     ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
     if (ret < 0) {
         perror("bind");
+        close(fd);
         return -1;
     }
     ret = listen(fd, 0);
     if (ret < 0) {
         perror("listen");
+        close(fd);
         return -1;
     }
     return fd;
-- 
1.7.5.4


