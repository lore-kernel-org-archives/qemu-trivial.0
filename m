Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKp8l-0001av-VD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 09:44:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35496)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <qemu@mrs.ro>)
	id 1XKkaA-0003Tm-VU
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:52:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu@mrs.ro>) id 1XKka3-000200-FZ
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:52:26 -0400
Received: from mrs.ro ([109.74.194.28]:40500)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <qemu@mrs.ro>)
	id 1XKka3-0001zm-A3
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:52:19 -0400
Received: from [192.168.1.4] (cs181218058.pp.htv.fi [82.181.218.58])
	by mrs.ro (Postfix) with ESMTPSA id 73A7E60F7;
	Fri, 22 Aug 2014 11:55:04 +0300 (EEST)
Message-ID: <53F704BE.6000407@mrs.ro>
Date: Fri, 22 Aug 2014 11:52:14 +0300
From: Valentin Manea <qemu@mrs.ro>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 109.74.194.28
X-Mailman-Approved-At: Fri, 22 Aug 2014 09:44:26 -0400
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Wenchao Xia <xiawenc@linux.vnet.ibm.com>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH] IDE: MMIO IDE device control should be
	little endian
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
X-List-Received-Date: Fri, 22 Aug 2014 08:52:34 -0000

Set the IDE MMIO memory type to little endian. The ATA specs identify
words part of the control commands encoded as little endian.
While this has no impact on little endian systems, it's required for big
endian systems(eg OpenRisc).

Signed-off-by: Valentin Manea <valentin.manea@gmail.com>
---
 hw/ide/mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 01c1d0e..334c8cc 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -82,7 +82,7 @@ static void mmio_ide_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps mmio_ide_ops = {
     .read = mmio_ide_read,
     .write = mmio_ide_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };

 static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
@@ -102,7 +102,7 @@ static void mmio_ide_cmd_write(void *opaque, hwaddr
addr,
 static const MemoryRegionOps mmio_ide_cs_ops = {
     .read = mmio_ide_status_read,
     .write = mmio_ide_cmd_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_ide_mmio = {
-- 
1.9.1


