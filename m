Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zsO-0007Ah-Tt
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:26:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zqT-0002pG-LL
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zlG-00082x-IV
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:20:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zkb-0007wX-Fw; Sun, 02 Feb 2014 11:18:29 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 677C240232;
	Sun,  2 Feb 2014 20:18:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6A39E5FC;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: (nullmailer pid 1646 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:40 +0400
Message-Id: <1391357563-1592-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PULL 4/7] tcg/s390: Remove sigill_handler
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
X-List-Received-Date: Sun, 02 Feb 2014 16:26:31 -0000

From: Richard Henderson <rth@twiddle.net>

Commit c9baa30f42a87f61627391698f63fa4d1566d9d8 failed to
delete all of the relevant code, leading to Werrors about
unused symbols.

Signed-off-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/s390/tcg-target.c |   19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tcg/s390/tcg-target.c b/tcg/s390/tcg-target.c
index 248726e..907d9d1 100644
--- a/tcg/s390/tcg-target.c
+++ b/tcg/s390/tcg-target.c
@@ -2214,25 +2214,6 @@ static const TCGTargetOpDef s390_op_defs[] = {
     { -1 },
 };
 
-/* ??? Linux kernels provide an AUXV entry AT_HWCAP that provides most of
-   this information.  However, getting at that entry is not easy this far
-   away from main.  Our options are: start searching from environ, but
-   that fails as soon as someone does a setenv in between.  Read the data
-   from /proc/self/auxv.  Or do the probing ourselves.  The only thing
-   extra that AT_HWCAP gives us is HWCAP_S390_HIGH_GPRS, which indicates
-   that the kernel saves all 64-bits of the registers around traps while
-   in 31-bit mode.  But this is true of all "recent" kernels (ought to dig
-   back and see from when this might not be true).  */
-
-#include <signal.h>
-
-static volatile sig_atomic_t got_sigill;
-
-static void sigill_handler(int sig)
-{
-    got_sigill = 1;
-}
-
 static void query_facilities(void)
 {
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
-- 
1.7.10.4


