Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0D-0000tw-82
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh06-0000eV-6c
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000dq-VP
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzx-0000bH-At; Thu, 30 Apr 2015 01:26:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A557C42B8F;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8DA6946;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4294 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:14 +0300
Message-Id: <1ceca3dc79da677ffc2694dcaf326b308b70776e.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 01/42] tpm: Cast 64bit variables to int when
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:07 -0000

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Cast 64bit variables to int when used in DPRINTF. They only contain
32bit of data.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


