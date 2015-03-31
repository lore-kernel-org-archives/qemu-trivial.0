Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd1E4-0006it-Dr
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 14:49:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1E2-0006ij-Ig
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1Dx-0005oi-GN
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:22 -0400
Received: from e36.co.us.ibm.com ([32.97.110.154]:56049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1Dx-0005oD-97
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:17 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 12:49:15 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 12:49:14 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com
	(b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id C2D231FF001E;
	Tue, 31 Mar 2015 12:40:24 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VIn2Lq36110542; Tue, 31 Mar 2015 11:49:02 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VInDAV008685; Tue, 31 Mar 2015 12:49:13 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VInCSj008636; Tue, 31 Mar 2015 12:49:12 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Tue, 31 Mar 2015 14:49:09 -0400
Message-Id: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033118-0021-0000-0000-0000098B887A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.154
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/2] tpm: Cast 64bit variables to int when
	used in DPRINTF
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
X-List-Received-Date: Tue, 31 Mar 2015 18:49:23 -0000

Cast 64bit variables to int when used in DPRINTF. They only contain
32bit of data.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_tis.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 815c8ea..cb9c7c8 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -421,7 +421,7 @@ static void tpm_tis_dump_state(void *opaque, hwaddr addr)
 
     for (idx = 0; regs[idx] != 0xfff; idx++) {
         DPRINTF("tpm_tis: 0x%04x : 0x%08x\n", regs[idx],
-                (uint32_t)tpm_tis_mmio_read(opaque, base + regs[idx], 4));
+                (int)tpm_tis_mmio_read(opaque, base + regs[idx], 4));
     }
 
     DPRINTF("tpm_tis: read offset   : %d\n"
@@ -555,7 +555,7 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
         val >>= shift;
     }
 
-    DPRINTF("tpm_tis:  read.%u(%08x) = %08x\n", size, (int)addr, (uint32_t)val);
+    DPRINTF("tpm_tis:  read.%u(%08x) = %08x\n", size, (int)addr, (int)val);
 
     return val;
 }
@@ -578,7 +578,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
     uint16_t len;
     uint32_t mask = (size == 1) ? 0xff : ((size == 2) ? 0xffff : ~0);
 
-    DPRINTF("tpm_tis: write.%u(%08x) = %08x\n", size, (int)addr, (uint32_t)val);
+    DPRINTF("tpm_tis: write.%u(%08x) = %08x\n", size, (int)addr, (int)val);
 
     if (locty == 4 && !hw_access) {
         DPRINTF("tpm_tis: Access to locality 4 only allowed from hardware\n");
@@ -815,7 +815,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
             /* drop the byte */
         } else {
             DPRINTF("tpm_tis: Data to send to TPM: %08x (size=%d)\n",
-                    val, size);
+                    (int)val, size);
             if (tis->loc[locty].state == TPM_TIS_STATE_READY) {
                 tis->loc[locty].state = TPM_TIS_STATE_RECEPTION;
                 tpm_tis_sts_set(&tis->loc[locty],
-- 
1.9.3


