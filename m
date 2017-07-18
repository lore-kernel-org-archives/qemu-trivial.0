Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVKi-0000aD-Uh
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:26:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKh-0000Y4-3U
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKg-00012a-Ar
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dXVKe-0000zb-Hq; Tue, 18 Jul 2017 12:26:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dXVKX-00055B-Gy; Tue, 18 Jul 2017 17:26:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 18 Jul 2017 17:26:34 +0100
Message-Id: <1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH for-2.10 4/4] bsd-user/main.c: Fix unused
 variable warning
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
X-List-Received-Date: Tue, 18 Jul 2017 16:26:48 -0000

On OpenBSD the compiler warns:
bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wunused-but-set-variable]

This is because a lot of the signal delivery code is #if-0'd
out as unused. Reshuffle #ifdefs a bit to silence the warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index fa9c012..501e16f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -619,9 +619,10 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case EXCP_DEBUG:
             {
-                int sig;
-
-                sig = gdb_handlesig(cs, TARGET_SIGTRAP);
+#if 0
+                int sig =
+#endif
+                gdb_handlesig(cs, TARGET_SIGTRAP);
 #if 0
                 if (sig)
                   {
-- 
2.7.4


