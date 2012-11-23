Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbuwF-0006ht-5c
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:13:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Tbuw7-0006dz-RK
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:13:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Tbuw3-00040P-Dn
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:12:59 -0500
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:42854
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Tbuw3-00040F-6G
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:12:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Tbuvy-0007wm-Lu; Fri, 23 Nov 2012 15:12:50 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2012 15:12:50 +0000
Message-Id: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, Yurij Popov <oss@djphoenix.ru>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qemu-timer: Don't use RDTSC on 386s and 486s
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
X-List-Received-Date: Fri, 23 Nov 2012 15:13:05 -0000

Adjust the conditional which guards the implementation of
cpu_get_real_ticks() via RDTSC, so that we don't try to use it
on x86 CPUs which don't implement RDTSC.  Instead we will fall
back to the no-cycle-counter-available default implementation.

Reported-by: Yurij Popov <oss@djphoenix.ru>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qemu-timer.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-timer.h b/qemu-timer.h
index da7e97c..e35f163 100644
--- a/qemu-timer.h
+++ b/qemu-timer.h
@@ -169,7 +169,7 @@ static inline int64_t cpu_get_real_ticks(void)
     return retval;
 }
 
-#elif defined(__i386__)
+#elif defined(__i586__)
 
 static inline int64_t cpu_get_real_ticks(void)
 {
-- 
1.7.9.5


