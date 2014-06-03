Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wrszl-0004LZ-0b
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 13:59:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wrszf-0004Dc-06
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 13:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wrsze-0005LL-AW
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 13:59:26 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wrszc-0005Kr-JB; Tue, 03 Jun 2014 13:59:24 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WrszZ-0000Py-Bn; Tue, 03 Jun 2014 18:59:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  3 Jun 2014 18:59:21 +0100
Message-Id: <1401818361-1581-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-microblaze: Delete unused
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
X-List-Received-Date: Tue, 03 Jun 2014 17:59:31 -0000

The sign_extend() function is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We have sextract() for this these days anyway.
---
 target-microblaze/translate.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index 488df2d..50c214b 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -98,19 +98,6 @@ static const char *special_regnames[] =
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
1.9.2


