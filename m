Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YiOGj-0003zs-Ba
	for mharc-qemu-trivial@gnu.org; Wed, 15 Apr 2015 10:26:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YiOGe-0003xS-06
	for qemu-trivial@nongnu.org; Wed, 15 Apr 2015 10:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YiOGd-0000Gn-43
	for qemu-trivial@nongnu.org; Wed, 15 Apr 2015 10:26:15 -0400
Received: from e17.ny.us.ibm.com ([129.33.205.207]:48833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YiOGd-0000DW-0N
	for qemu-trivial@nongnu.org; Wed, 15 Apr 2015 10:26:15 -0400
Received: from /spool/local
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Wed, 15 Apr 2015 10:26:09 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 15 Apr 2015 10:26:07 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
	[9.57.198.28])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 8530A6E8047;
	Wed, 15 Apr 2015 10:17:56 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t3FEPVEJ36044990; Wed, 15 Apr 2015 14:26:07 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t3FEJmN4030264; Wed, 15 Apr 2015 10:19:48 -0400
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t3FEJmxk028099; Wed, 15 Apr 2015 10:19:48 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Wed, 15 Apr 2015 10:18:55 -0400
Message-Id: <1429107535-989274-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15041514-0041-0000-0000-0000001B4160
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 129.33.205.207
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH] tpm: fix coding style
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
X-List-Received-Date: Wed, 15 Apr 2015 14:26:20 -0000

Fix coding style in one instance.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
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
1.9.3


