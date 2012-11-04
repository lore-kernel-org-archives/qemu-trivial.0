Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TV6jR-0003Qa-DA
	for mharc-qemu-trivial@gnu.org; Sun, 04 Nov 2012 15:23:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TV6jP-0003M1-KG
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 15:23:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TV6jO-0004Fz-KL
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 15:23:43 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TV6jL-0004En-3Q; Sun, 04 Nov 2012 15:23:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	37B7E728002F; Sun,  4 Nov 2012 21:23:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id IN7VB7cr-NF2; Sun,  4 Nov 2012 21:23:36 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 899A5728003A; Sun,  4 Nov 2012 21:23:36 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  4 Nov 2012 21:23:35 +0100
Message-Id: <1352060615-17419-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qemu-timer: Fix compilation for POSIX and
	non-POSIX hosts
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
X-List-Received-Date: Sun, 04 Nov 2012 20:23:44 -0000

This compiler error is fixed by including pthread.h:

qemu-timer.c: In function =E2=80=98init_timer_alarm=E2=80=99:
qemu-timer.c:782: error: implicit declaration of function =E2=80=98pthrea=
d_atfork=E2=80=99

Another compiler warning is caused by the unused local function
reinit_timers on non-POSIX hosts. Include that function only for
POSIX hosts.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-timer.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qemu-timer.c b/qemu-timer.c
index 7b2217a..3bc86cf 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -34,6 +34,9 @@
 #ifdef _WIN32
 #include <mmsystem.h>
 #endif
+#ifdef CONFIG_POSIX
+#include <pthread.h>    /* pthread_atfork */
+#endif
=20
 /***********************************************************/
 /* timers */
@@ -742,6 +745,7 @@ static void quit_timers(void)
     t->stop(t);
 }
=20
+#ifdef CONFIG_POSIX
 static void reinit_timers(void)
 {
     struct qemu_alarm_timer *t =3D alarm_timer;
@@ -752,6 +756,7 @@ static void reinit_timers(void)
     }
     qemu_rearm_alarm_timer(t);
 }
+#endif /* CONFIG_POSIX */
=20
 int init_timer_alarm(void)
 {
--=20
1.7.10.4


