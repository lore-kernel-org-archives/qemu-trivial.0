Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTYgL-0001Hv-2Y
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 11:26:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYgI-0001Ce-LI
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYgH-0001CY-Oq
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:26:54 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYgF-0001An-SG; Fri, 28 Mar 2014 11:26:52 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSn-0000X3-Tz; Fri, 28 Mar 2014 15:12:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 28 Mar 2014 15:12:56 +0000
Message-Id: <1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 2/3] int128.h: Avoid undefined behaviours
	involving signed arithmetic
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
X-List-Received-Date: Fri, 28 Mar 2014 15:26:55 -0000

Add casts when we're performing arithmetic on the .hi parts of an
Int128, to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/int128.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 9ed47aa..f597031 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -53,7 +53,7 @@ static inline Int128 int128_rshift(Int128 a, int n)
     if (n >= 64) {
         return (Int128) { h, h >> 63 };
     } else {
-        return (Int128) { (a.lo >> n) | (a.hi << (64 - n)), h };
+        return (Int128) { (a.lo >> n) | ((uint64_t)a.hi << (64 - n)), h };
     }
 }
 
@@ -78,7 +78,7 @@ static inline Int128 int128_neg(Int128 a)
 
 static inline Int128 int128_sub(Int128 a, Int128 b)
 {
-    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
+    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };
 }
 
 static inline bool int128_nonneg(Int128 a)
-- 
1.9.0


