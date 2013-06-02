Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjA2t-0001uG-5F
	for mharc-qemu-trivial@gnu.org; Sun, 02 Jun 2013 11:18:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UjA2p-0001pI-D2
	for qemu-trivial@nongnu.org; Sun, 02 Jun 2013 11:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UjA2n-00007m-2u
	for qemu-trivial@nongnu.org; Sun, 02 Jun 2013 11:18:07 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:57724 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UjA2g-00005g-MR; Sun, 02 Jun 2013 11:17:58 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UjA2X-0006LE-GE; Sun, 02 Jun 2013 16:17:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun,  2 Jun 2013 16:17:49 +0100
Message-Id: <1370186269-24353-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] softfloat: Fix shift128Right for shift
	counts 64..127
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
X-List-Received-Date: Sun, 02 Jun 2013 15:18:10 -0000

shift128Right would give the wrong result for a shift count
between 64 and 127. This was never noticed because all of
our uses of this function are guaranteed not to use shift
counts in this range.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Found by code inspection. This contribution can be licensed
under either the softfloat-2a or -2b license.

 fpu/softfloat-macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat-macros.h b/fpu/softfloat-macros.h
index b5164af..9b09545 100644
--- a/fpu/softfloat-macros.h
+++ b/fpu/softfloat-macros.h
@@ -168,7 +168,7 @@ INLINE void
         z0 = a0>>count;
     }
     else {
-        z1 = ( count < 64 ) ? ( a0>>( count & 63 ) ) : 0;
+        z1 = (count < 128) ? (a0 >> (count & 63)) : 0;
         z0 = 0;
     }
     *z1Ptr = z1;
-- 
1.7.11.4


