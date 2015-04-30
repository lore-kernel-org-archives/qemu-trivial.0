Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk7g-0006pP-7R
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:47:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0006e5-Vf
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0004bf-5j
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynk7W-0004aG-FC; Thu, 30 Apr 2015 04:46:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB6AA42BC4;
	Thu, 30 Apr 2015 11:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1341B93E;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4314 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:24 +0300
Message-Id: <0b3beae70cdb859101d028cafd818e60364b2955.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 11/42] tpm: fix coding style
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
X-List-Received-Date: Thu, 30 Apr 2015 08:47:04 -0000

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Fix coding style in one instance.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/tpm/tpm_tis.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 4b6d601..b8235d5 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -842,7 +842,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
                 (tis->loc[locty].sts & TPM_TIS_STS_EXPECT)) {
                 /* we have a packet length - see if we have all of it */
 #ifdef RAISE_STS_IRQ
-                bool needIrq = !(tis->loc[locty].sts & TPM_TIS_STS_VALID);
+                bool need_irq = !(tis->loc[locty].sts & TPM_TIS_STS_VALID);
 #endif
                 len = tpm_tis_get_size_from_buffer(&tis->loc[locty].w_buffer);
                 if (len > tis->loc[locty].w_offset) {
@@ -853,7 +853,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
                     tpm_tis_sts_set(&tis->loc[locty], TPM_TIS_STS_VALID);
                 }
 #ifdef RAISE_STS_IRQ
-                if (needIrq) {
+                if (need_irq) {
                     tpm_tis_raise_irq(s, locty, TPM_TIS_INT_STS_VALID);
                 }
 #endif
-- 
2.1.4


