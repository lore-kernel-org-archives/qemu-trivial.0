Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPqQ-0000br-W6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 13:28:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqL-0000Sc-3g
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqG-0000WG-BN
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPpy-0000Rg-Pp; Tue, 10 Jun 2014 13:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 89266412D8;
	Tue, 10 Jun 2014 21:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 83A3B6BF;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13321 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:33 +0400
Message-Id: <1402416523-13212-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/25] target-microblaze: Delete unused
	sign_extend() function
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
X-List-Received-Date: Tue, 10 Jun 2014 17:28:21 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The sign_extend() function is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/translate.c |   13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index c422bdc..03ea158 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -99,19 +99,6 @@ static const char *special_regnames[] =
     "sr16", "sr17", "sr18"
 };
 
-/* Sign extend at translation time.  */
-static inline int sign_extend(unsigned int val, unsigned int width)
-{
-        int sval;
-
-        /* LSL.  */
-        val <<= 31 - width;
-        sval = val;
-        /* ASR.  */
-        sval >>= 31 - width;
-        return sval;
-}
-
 static inline void t_sync_flags(DisasContext *dc)
 {
     /* Synch the tb dependent flags between translator and runtime.  */
-- 
1.7.10.4


