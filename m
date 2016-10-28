Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c092b-0001yh-20
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:25:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0001r7-Nu
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092T-0007ti-Sk
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c092P-0007qw-9b; Fri, 28 Oct 2016 11:25:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5502243736;
	Fri, 28 Oct 2016 18:25:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A99CFB67;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6079 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:48 +0300
Message-Id: <35b6e94ba50cd92600a85eef444bc31df8999de1.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/23] s390: avoid always-true comparison in
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
X-List-Received-Date: Fri, 28 Oct 2016 15:25:51 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that the comparison "fid <= ZPCI_MAX_FID"
in s390_pci_generate_fid() is always true (because fid
is 32 bits and ZPCI_MAX_FID is 0xffffffff). This isn't a
bug because the real loop termination condition is
expressed later via an "if (...) break;" inside the loop,
but it is a bit odd. Rephrase the loop to avoid the
unnecessary duplicate-but-never-true conditional.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


