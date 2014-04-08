Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQEr-00023T-2q
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEk-0001ra-WF
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEg-0004Ps-Ju
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQEW-0004Mg-OV; Tue, 08 Apr 2014 03:14:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 14BD340E37;
	Tue,  8 Apr 2014 11:14:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 461AB6AD;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10577 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:06 +0400
Message-Id: <1396940651-10513-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/11] int128.h: Avoid undefined behaviours
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
X-List-Received-Date: Tue, 08 Apr 2014 07:14:31 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add casts when we're performing arithmetic on the .hi parts of an
Int128, to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/int128.h |    4 ++--
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
1.7.10.4


