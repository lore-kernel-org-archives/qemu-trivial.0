Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIHJM-0007CC-EM
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 13:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJJ-0007AG-RQ
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJJ-00067c-0k
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fIHJH-0005yO-3A; Mon, 14 May 2018 13:30:55 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fIHJ9-0000IO-3t; Mon, 14 May 2018 18:30:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Mon, 14 May 2018 18:30:44 +0100
Message-Id: <20180514173044.5025-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180514173044.5025-1-peter.maydell@linaro.org>
References: <20180514173044.5025-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 2/2] gdbstub: Handle errors in gdb_accept()
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
X-List-Received-Date: Mon, 14 May 2018 17:30:58 -0000

In gdb_accept(), we both fail to check all errors (notably
that from socket_set_nodelay(), as Coverity notes in CID 1005666),
and fail to return an error status back to our caller. Correct
both of these things, so that errors in accept() result in our
stopping with a useful error message rather than ignoring it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 gdbstub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index cc7626c790..7c2bceb040 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1804,7 +1804,7 @@ void gdb_signalled(CPUArchState *env, int sig)
     put_packet(s, buf);
 }
 
-static void gdb_accept(void)
+static bool gdb_accept(void)
 {
     GDBState *s;
     struct sockaddr_in sockaddr;
@@ -1816,7 +1816,7 @@ static void gdb_accept(void)
         fd = accept(gdbserver_fd, (struct sockaddr *)&sockaddr, &len);
         if (fd < 0 && errno != EINTR) {
             perror("accept");
-            return;
+            return false;
         } else if (fd >= 0) {
             qemu_set_cloexec(fd);
             break;
@@ -1824,7 +1824,10 @@ static void gdb_accept(void)
     }
 
     /* set short latency */
-    socket_set_nodelay(fd);
+    if (socket_set_nodelay(fd)) {
+        perror("setsockopt");
+        return false;
+    }
 
     s = g_malloc0(sizeof(GDBState));
     s->c_cpu = first_cpu;
@@ -1833,6 +1836,7 @@ static void gdb_accept(void)
     gdb_has_xml = false;
 
     gdbserver_state = s;
+    return true;
 }
 
 static int gdbserver_open(int port)
@@ -1873,7 +1877,11 @@ int gdbserver_start(int port)
     if (gdbserver_fd < 0)
         return -1;
     /* accept connections */
-    gdb_accept();
+    if (!gdb_accept()) {
+        close(gdbserver_fd);
+        gdbserver_fd = -1;
+        return -1;
+    }
     return 0;
 }
 
-- 
2.17.0


