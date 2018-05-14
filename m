Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIHJM-0007Cz-VO
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 13:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJL-0007Am-0h
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJJ-00068r-Tc
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fIHJI-0005yO-1U; Mon, 14 May 2018 13:30:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fIHJ8-0000I7-E3; Mon, 14 May 2018 18:30:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Mon, 14 May 2018 18:30:43 +0100
Message-Id: <20180514173044.5025-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180514173044.5025-1-peter.maydell@linaro.org>
References: <20180514173044.5025-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 1/2] gdbstub: Use qemu_set_cloexec()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 17:31:00 -0000

Use the utility routine qemu_set_cloexec() rather than
manually calling fcntl(). This lets us drop the #ifndef _WIN32
guards and also means Coverity doesn't complain that we're
ignoring the fcntl error return (CID 1005665, CID 1005667).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 gdbstub.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3c3807358c..cc7626c790 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1818,9 +1818,7 @@ static void gdb_accept(void)
             perror("accept");
             return;
         } else if (fd >= 0) {
-#ifndef _WIN32
-            fcntl(fd, F_SETFD, FD_CLOEXEC);
-#endif
+            qemu_set_cloexec(fd);
             break;
         }
     }
@@ -1847,9 +1845,7 @@ static int gdbserver_open(int port)
         perror("socket");
         return -1;
     }
-#ifndef _WIN32
-    fcntl(fd, F_SETFD, FD_CLOEXEC);
-#endif
+    qemu_set_cloexec(fd);
 
     socket_set_fast_reuse(fd);
 
-- 
2.17.0


