Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CNh-0006Kb-9N
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:53:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNe-0006IE-Mo
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:52:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNd-0004gp-Ul
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:52:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CNZ-0004cA-Kb; Mon, 16 Oct 2017 16:52:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 828B840D2C;
	Mon, 16 Oct 2017 23:52:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 14A5AB32;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12319 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:32 +0300
Message-Id: <f3245d63a0df51184fdf12f483436329ef322d35.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/14] futex: add missing header guards
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
X-List-Received-Date: Mon, 16 Oct 2017 20:52:59 -0000

From: "Emilio G. Cota" <cota@braap.org>

The header file was introduced by fbcc3e5 ("qemu-thread: optimize QemuLoc=
kCnt
with futexes on Linux", 2017-01-16) without header guards. Add them.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/futex.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/qemu/futex.h b/include/qemu/futex.h
index bb7dc9e296..91ae88966e 100644
--- a/include/qemu/futex.h
+++ b/include/qemu/futex.h
@@ -11,6 +11,9 @@
  *
  */
=20
+#ifndef QEMU_FUTEX_H
+#define QEMU_FUTEX_H
+
 #include <sys/syscall.h>
 #include <linux/futex.h>
=20
@@ -34,3 +37,5 @@ static inline void qemu_futex_wait(void *f, unsigned va=
l)
         }
     }
 }
+
+#endif /* QEMU_FUTEX_H */
--=20
2.11.0


