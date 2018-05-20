Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHlg-0008Hn-5N
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:24:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlZ-0007tp-0Q
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0008NZ-5C
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHlT-0008JB-EO; Sun, 20 May 2018 02:24:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B630B4111D;
	Sun, 20 May 2018 09:24:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DC79610CB;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7412 invoked by uid 1000);
	Sun, 20 May 2018 06:15:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:06 +0300
Message-Id: <2f652224f76c115f6c991766b7acac1e22580954.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/22] gdbstub: Handle errors in gdb_accept()
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
X-List-Received-Date: Sun, 20 May 2018 06:24:26 -0000

From: Peter Maydell <peter.maydell@linaro.org>

In gdb_accept(), we both fail to check all errors (notably
that from socket_set_nodelay(), as Coverity notes in CID 1005666),
and fail to return an error status back to our caller. Correct
both of these things, so that errors in accept() result in our
stopping with a useful error message rather than ignoring it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b99980d2e2..e4ece2f5bc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1814,7 +1814,7 @@ void gdb_signalled(CPUArchState *env, int sig)
     put_packet(s, buf);
 }
=20
-static void gdb_accept(void)
+static bool gdb_accept(void)
 {
     GDBState *s;
     struct sockaddr_in sockaddr;
@@ -1826,7 +1826,7 @@ static void gdb_accept(void)
         fd =3D accept(gdbserver_fd, (struct sockaddr *)&sockaddr, &len);
         if (fd < 0 && errno !=3D EINTR) {
             perror("accept");
-            return;
+            return false;
         } else if (fd >=3D 0) {
             qemu_set_cloexec(fd);
             break;
@@ -1834,7 +1834,10 @@ static void gdb_accept(void)
     }
=20
     /* set short latency */
-    socket_set_nodelay(fd);
+    if (socket_set_nodelay(fd)) {
+        perror("setsockopt");
+        return false;
+    }
=20
     s =3D g_malloc0(sizeof(GDBState));
     s->c_cpu =3D first_cpu;
@@ -1843,6 +1846,7 @@ static void gdb_accept(void)
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
+    return true;
 }
=20
 static int gdbserver_open(int port)
@@ -1883,7 +1887,11 @@ int gdbserver_start(int port)
     if (gdbserver_fd < 0)
         return -1;
     /* accept connections */
-    gdb_accept();
+    if (!gdb_accept()) {
+        close(gdbserver_fd);
+        gdbserver_fd =3D -1;
+        return -1;
+    }
     return 0;
 }
=20
--=20
2.11.0


