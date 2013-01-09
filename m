Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tt68y-0006OK-6U
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2013 19:37:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>) id 1Tt68t-0006Bi-O6
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2013 19:37:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>) id 1Tt68q-0007AK-Ih
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2013 19:37:11 -0500
Received: from smtp02.citrix.com ([66.165.176.63]:13857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>)
	id 1Tt68j-00078Z-PA; Wed, 09 Jan 2013 19:37:01 -0500
X-IronPort-AV: E=Sophos;i="4.84,440,1355097600"; 
   d="scan'208";a="3078550"
Received: from ftlpex01cl01.citrite.net ([10.13.107.78])
	by FTLPIPO02.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	10 Jan 2013 00:37:00 +0000
Received: from meteora.cam.xci-test.com (10.80.248.22) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 9 Jan 2013 19:36:59 -0500
From: Julien Grall <julien.grall@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 9 Jan 2013 18:10:22 +0000
Message-ID: <1357755022-3572-1-git-send-email-julien.grall@citrix.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: qemu-trivial@nongnu.org, Julien Grall <julien.grall@citrix.com>,
	aliguori@us.ibm.com, adam@os.inf.tu-dresden.de
Subject: [Qemu-trivial] [PATCH] hw/pc.c: Fix converting of ioport_register*
	to MemoryRegion
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
X-List-Received-Date: Thu, 10 Jan 2013 00:37:14 -0000

The commit 258711 introduced MemoryRegion to replace ioport_region*
for ioport 80h and F0h.
A MemoryRegion needs to have both read and write callback otherwise a segfault
will occur when an access is made.

The previous behaviour of this both ioport is to return 0xffffffffffffffff.
So keep this behaviour.

Reported-by: Adam Lackorzynski <adam@os.inf.tu-dresden.de>
Signed-off-by: Julien Grall <julien.grall@citrix.com>
---
 hw/pc.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/pc.c b/hw/pc.c
index df0c48e..90b1bf7 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -103,6 +103,11 @@ static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
 {
 }
 
+static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0xffffffffffffffff;
+}
+
 /* MSDOS compatibility mode FPU exception support */
 static qemu_irq ferr_irq;
 
@@ -123,6 +128,11 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
     qemu_irq_lower(ferr_irq);
 }
 
+static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0xffffffffffffffff;
+}
+
 /* TSC handling */
 uint64_t cpu_get_tsc(CPUX86State *env)
 {
@@ -960,6 +970,7 @@ static void cpu_request_exit(void *opaque, int irq, int level)
 
 static const MemoryRegionOps ioport80_io_ops = {
     .write = ioport80_write,
+    .read = ioport80_read,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -969,6 +980,7 @@ static const MemoryRegionOps ioport80_io_ops = {
 
 static const MemoryRegionOps ioportF0_io_ops = {
     .write = ioportF0_write,
+    .read = ioportF0_read,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
-- 
Julien Grall


