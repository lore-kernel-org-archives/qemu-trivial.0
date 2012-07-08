Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sny8l-0004k3-7X
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jul 2012 16:31:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sny8g-0004YM-RH
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2012 16:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sny8f-0001fk-8e
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2012 16:31:30 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Sny8b-0001dI-JG; Sun, 08 Jul 2012 16:31:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A7B9D72800C0; Sun,  8 Jul 2012 22:31:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 5jQDASxY3kvF; Sun,  8 Jul 2012 22:31:22 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 224E872800C1; Sun,  8 Jul 2012 22:31:22 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  8 Jul 2012 22:31:21 +0200
Message-Id: <1341779481-24690-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] bitops: Fix documentation
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
X-List-Received-Date: Sun, 08 Jul 2012 20:31:33 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 bitops.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bitops.h b/bitops.h
index b967ef3..c456232 100644
--- a/bitops.h
+++ b/bitops.h
@@ -319,8 +319,8 @@ static inline uint64_t extract64(uint64_t value, int start, int length)
  * @value. Bits of @value outside the bit field are not modified.
  * Bits of @fieldval above the least significant @length bits are
  * ignored. The bit field must lie entirely within the 32 bit word.
- * It is valid to request that all 64 bits are modified (ie @length
- * 64 and @start 0).
+ * It is valid to request that all 32 bits are modified (ie @length
+ * 32 and @start 0).
  *
  * Returns: the modified @value.
  */
@@ -334,7 +334,7 @@ static inline uint32_t deposit32(uint32_t value, int start, int length,
 }
 
 /**
- * deposit32:
+ * deposit64:
  * @value: initial value to insert bit field into
  * @start: the lowest bit in the bit field (numbered from 0)
  * @length: the length of the bit field
@@ -344,7 +344,7 @@ static inline uint32_t deposit32(uint32_t value, int start, int length,
  * by the @start and @length parameters, and return the modified
  * @value. Bits of @value outside the bit field are not modified.
  * Bits of @fieldval above the least significant @length bits are
- * ignored. The bit field must lie entirely within the 32 bit word.
+ * ignored. The bit field must lie entirely within the 64 bit word.
  * It is valid to request that all 64 bits are modified (ie @length
  * 64 and @start 0).
  *
-- 
1.7.10


