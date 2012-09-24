Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TGBWr-0007kD-2N
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 12:29:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TGBWl-0007R9-6X
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 12:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TGBWf-0003af-8u
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 12:28:59 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:54976
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TGBWV-0003Vb-1b; Mon, 24 Sep 2012 12:28:43 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TGBWN-0003RO-1c; Mon, 24 Sep 2012 17:28:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 24 Sep 2012 17:28:35 +0100
Message-Id: <1348504115-13203-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] fpu/softfloat.c: Remove pointless shift of
	always-zero value
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
X-List-Received-Date: Mon, 24 Sep 2012 16:29:03 -0000

In float16_to_float32, when returning an infinity, just pass zero
as the mantissa argument to packFloat32(), rather than shifting
a value which we know must be zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted by the clang static analyzer. This brings this code into line with
the other float-to-float conversion functions and was probably a harmless
cut-n-paste error from the normal-return codepath.

 fpu/softfloat.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b29256a..01a28ca 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3007,7 +3007,7 @@ float32 float16_to_float32(float16 a, flag ieee STATUS_PARAM)
         if (aSig) {
             return commonNaNToFloat32(float16ToCommonNaN(a STATUS_VAR) STATUS_VAR);
         }
-        return packFloat32(aSign, 0xff, aSig << 13);
+        return packFloat32(aSign, 0xff, 0);
     }
     if (aExp == 0) {
         int8 shiftCount;
-- 
1.7.9.5


