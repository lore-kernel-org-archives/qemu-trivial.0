Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZj5A-0006zi-IF
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 13:59:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZj58-0006xT-0z
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 13:59:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZj57-0007TV-Er
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 13:59:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cZj55-0007Sg-61; Fri, 03 Feb 2017 13:59:35 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZj52-0002jc-6F; Fri, 03 Feb 2017 18:59:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Fri,  3 Feb 2017 18:59:31 +0000
Message-Id: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] softfloat: Use correct type in
 float64_to_uint64_round_to_zero()
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
X-List-Received-Date: Fri, 03 Feb 2017 18:59:39 -0000

In float64_to_uint64_round_to_zero() a typo meant that we were
taking the uint64_t return value from float64_to_uint64() and
putting it into an int64_t variable before returning it as
uint64_t again. Use uint64_t instead of pointlessly casting it
back and forth to int64_t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted while reading the code...

 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c295f31..218b375 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -7386,7 +7386,7 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *status)
 {
     signed char current_rounding_mode = status->float_rounding_mode;
     set_float_rounding_mode(float_round_to_zero, status);
-    int64_t v = float64_to_uint64(a, status);
+    uint64_t v = float64_to_uint64(a, status);
     set_float_rounding_mode(current_rounding_mode, status);
     return v;
 }
-- 
2.7.4


