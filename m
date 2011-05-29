Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQnsd-0006J2-Ma
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 17:50:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQnsb-0006Ge-RZ
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 17:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQnsb-00046U-3q
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 17:50:37 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:46353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQnsZ-00046E-0i; Sun, 29 May 2011 17:50:35 -0400
Received: from smtp08.web.de  ( [172.20.5.216])
	by fmmailgate03.web.de (Postfix) with ESMTP id 122A118F98CD9;
	Sun, 29 May 2011 23:50:33 +0200 (CEST)
Received: from [87.173.127.118] (helo=af.local)
	by smtp08.web.de with asmtp (WEB.DE 4.110 #2)
	id 1QQnsW-0002wG-00; Sun, 29 May 2011 23:50:32 +0200
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Sun, 29 May 2011 23:50:31 +0200
Message-Id: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.5.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1+Dm9dauFRMh1oA+zcFgtwMe7oJm72z2s7LkSYU
	mHGi9HBoZvB7gCvlavJwPv7YW4/kIz1Jo1HZoMWmq0JNfI0U7C
	AnkINlpzu/y2t3a48+HQ==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
Subject: [Qemu-trivial] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Sun, 29 May 2011 21:50:38 -0000

BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
and doesn't need to be blocked.

Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
---
 cpus.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/cpus.c b/cpus.c
index 1fc34b7..42af291 100644
--- a/cpus.c
+++ b/cpus.c
@@ -395,7 +395,9 @@ static int qemu_signal_init(void)
     pthread_sigmask(SIG_UNBLOCK, &set, NULL);
=20
     sigemptyset(&set);
+#ifdef SIGIO
     sigaddset(&set, SIGIO);
+#endif
     sigaddset(&set, SIGALRM);
     sigaddset(&set, SIG_IPI);
     sigaddset(&set, SIGBUS);
@@ -408,7 +410,9 @@ static int qemu_signal_init(void)
          * We need to process timer signals synchronously to avoid a rac=
e
          * between exit_request check and KVM vcpu entry.
          */
+#ifdef SIGIO
         sigaddset(&set, SIGIO);
+#endif
         sigaddset(&set, SIGALRM);
     }
 #endif
@@ -449,12 +453,16 @@ static void qemu_kvm_init_cpu_signals(CPUState *env=
)
 #else
     sigemptyset(&set);
     sigaddset(&set, SIG_IPI);
+#ifdef SIGIO
     sigaddset(&set, SIGIO);
+#endif
     sigaddset(&set, SIGALRM);
     pthread_sigmask(SIG_BLOCK, &set, NULL);
=20
     pthread_sigmask(SIG_BLOCK, NULL, &set);
+#ifdef SIGIO
     sigdelset(&set, SIGIO);
+#endif
     sigdelset(&set, SIGALRM);
 #endif
     sigdelset(&set, SIG_IPI);
--=20
1.7.5.3


