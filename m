Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKIEd-00086W-DI
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:54:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKIEa-0007w1-IS
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKIEZ-0002On-R4
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:54:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKIEV-0002Je-BB; Sun, 20 May 2018 02:54:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A66E4112D;
	Sun, 20 May 2018 09:54:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1F9C310CD;
	Sun, 20 May 2018 09:15:14 +0300 (MSK)
Received: (nullmailer pid 7410 invoked by uid 1000);
	Sun, 20 May 2018 06:15:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:05 +0300
Message-Id: <f5bdd781316d2ba140323cb98392e44cac54017d.1526796813.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 19/22] gdbstub: Use qemu_set_cloexec()
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
X-List-Received-Date: Sun, 20 May 2018 06:54:25 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Use the utility routine qemu_set_cloexec() rather than
manually calling fcntl(). This lets us drop the #ifndef _WIN32
guards and also means Coverity doesn't complain that we're
ignoring the fcntl error return (CID 1005665, CID 1005667).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9682e16ef7..b99980d2e2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1828,9 +1828,7 @@ static void gdb_accept(void)
             perror("accept");
             return;
         } else if (fd >=3D 0) {
-#ifndef _WIN32
-            fcntl(fd, F_SETFD, FD_CLOEXEC);
-#endif
+            qemu_set_cloexec(fd);
             break;
         }
     }
@@ -1857,9 +1855,7 @@ static int gdbserver_open(int port)
         perror("socket");
         return -1;
     }
-#ifndef _WIN32
-    fcntl(fd, F_SETFD, FD_CLOEXEC);
-#endif
+    qemu_set_cloexec(fd);
=20
     socket_set_fast_reuse(fd);
=20
--=20
2.11.0


