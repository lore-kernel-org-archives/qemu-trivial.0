Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxCuQ-0002X0-Uu
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 08:57:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxCuO-0002VI-Qp
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 08:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxCuL-0004K3-Oz
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 08:57:20 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:33363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1bxCuL-0004JQ-IN
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 08:57:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bxCuB-0006t0-IE; Thu, 20 Oct 2016 13:57:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 20 Oct 2016 13:57:06 +0100
Message-Id: <1476968226-15918-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] s390: avoid always-true comparison in
 s390_pci_generate_fid()
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
X-List-Received-Date: Thu, 20 Oct 2016 12:57:21 -0000

Coverity points out that the comparison "fid <= ZPCI_MAX_FID"
in s390_pci_generate_fid() is always true (because fid
is 32 bits and ZPCI_MAX_FID is 0xffffffff). This isn't a
bug because the real loop termination condition is
expressed later via an "if (...) break;" inside the loop,
but it is a bit odd. Rephrase the loop to avoid the
unnecessary duplicate-but-never-true conditional.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/s390x/s390-pci-bus.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index b7f8bca..bbbe0b1 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -809,17 +809,11 @@ static uint32_t s390_pci_generate_fid(Error **errp)
 {
     uint32_t fid = 0;
 
-    while (fid <= ZPCI_MAX_FID) {
+    do {
         if (!s390_pci_find_dev_by_fid(fid)) {
             return fid;
         }
-
-        if (fid == ZPCI_MAX_FID) {
-            break;
-        }
-
-        fid++;
-    }
+    } while (fid++ != ZPCI_MAX_FID);
 
     error_setg(errp, "no free fid could be found");
     return 0;
-- 
2.7.4


