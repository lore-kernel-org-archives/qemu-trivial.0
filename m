Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLjbx-0002zX-MW
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 22:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XLjbr-0002qK-0G
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 22:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XLjbm-0003ll-Ds
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 22:02:14 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:23042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XLjbc-0003ku-Dh; Sun, 24 Aug 2014 22:02:01 -0400
Received: from 172.24.2.119 (EHLO szxeml450-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAS83448; Mon, 25 Aug 2014 10:01:46 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml450-hub.china.huawei.com
	(10.82.67.193) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 25 Aug 2014 10:01:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 Aug 2014 10:01:27 +0800
Message-ID: <1408932087-11036-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, peter.crosthwaite@xilinx.com,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com
Subject: [Qemu-trivial] [PATCH trivial v2] Fix debug print warning
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
X-List-Received-Date: Mon, 25 Aug 2014 02:02:19 -0000

From: Gonglei <arei.gonglei@huawei.com>

Steps:

1.enable qemu debug print, using simply scprit as below:
 grep "//#define DEBUG" * -rl | xargs sed -i "s/\/\/#define DEBUG/#define DEBUG/g"
2. make -j
3. get some warning:
hw/i2c/pm_smbus.c: In function 'smb_ioport_writeb':
hw/i2c/pm_smbus.c:142: warning: format '%04x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
hw/i2c/pm_smbus.c:142: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
hw/i2c/pm_smbus.c: In function 'smb_ioport_readb':
hw/i2c/pm_smbus.c:209: warning: format '%04x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
hw/intc/i8259.c: In function 'pic_ioport_read':
hw/intc/i8259.c:373: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
hw/input/pckbd.c: In function 'kbd_write_command':
hw/input/pckbd.c:232: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'
hw/input/pckbd.c: In function 'kbd_write_data':
hw/input/pckbd.c:333: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'
hw/isa/apm.c: In function 'apm_ioport_writeb':
hw/isa/apm.c:44: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
hw/isa/apm.c:44: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
hw/isa/apm.c: In function 'apm_ioport_readb':
hw/isa/apm.c:67: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
hw/timer/mc146818rtc.c: In function 'cmos_ioport_write':
hw/timer/mc146818rtc.c:394: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
hw/i386/pc.c: In function 'port92_write':
hw/i386/pc.c:479: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'

Fix them.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2: using HWADDR_PRIx instead of PRIx64 for hwaddr variable suggested by Peter.
---
 hw/i2c/pm_smbus.c      | 5 +++--
 hw/i386/pc.c           | 2 +-
 hw/input/pckbd.c       | 4 ++--
 hw/intc/i8259.c        | 2 +-
 hw/isa/apm.c           | 5 +++--
 hw/timer/mc146818rtc.c | 2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index fedb5fb..ce1713d 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -139,7 +139,8 @@ static void smb_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
 {
     PMSMBus *s = opaque;
 
-    SMBUS_DPRINTF("SMB writeb port=0x%04x val=0x%02x\n", addr, val);
+    SMBUS_DPRINTF("SMB writeb port=0x%04" HWADDR_PRIx
+                  " val=0x%02" PRIx64 "\n", addr, val);
     switch(addr) {
     case SMBHSTSTS:
         s->smb_stat = (~(val & 0xff)) & s->smb_stat;
@@ -206,7 +207,7 @@ static uint64_t smb_ioport_readb(void *opaque, hwaddr addr, unsigned width)
         val = 0;
         break;
     }
-    SMBUS_DPRINTF("SMB readb port=0x%04x val=0x%02x\n", addr, val);
+    SMBUS_DPRINTF("SMB readb port=0x%04" HWADDR_PRIx " val=0x%02x\n", addr, val);
     return val;
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8fa8d2f..0b1ab1f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -476,7 +476,7 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
     Port92State *s = opaque;
     int oldval = s->outport;
 
-    DPRINTF("port92: write 0x%02x\n", val);
+    DPRINTF("port92: write 0x%02" PRIx64 "\n", val);
     s->outport = val;
     qemu_set_irq(*s->a20_out, (val >> 1) & 1);
     if ((val & 1) && !(oldval & 1)) {
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index ca1cffc..2ab8c87 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -229,7 +229,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
 {
     KBDState *s = opaque;
 
-    DPRINTF("kbd: write cmd=0x%02x\n", val);
+    DPRINTF("kbd: write cmd=0x%02" PRIx64 "\n", val);
 
     /* Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
      * low for approximately 6 micro seconds. Bits 3-0 of the KBD_CCMD_PULSE
@@ -330,7 +330,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
 {
     KBDState *s = opaque;
 
-    DPRINTF("kbd: write data=0x%02x\n", val);
+    DPRINTF("kbd: write data=0x%02" PRIx64 "\n", val);
 
     switch(s->write_cmd) {
     case 0:
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index a563b82..c51901b 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -370,7 +370,7 @@ static uint64_t pic_ioport_read(void *opaque, hwaddr addr,
             ret = s->imr;
         }
     }
-    DPRINTF("read: addr=0x%02x val=0x%02x\n", addr, ret);
+    DPRINTF("read: addr=0x%02" HWADDR_PRIx " val=0x%02x\n", addr, ret);
     return ret;
 }
 
diff --git a/hw/isa/apm.c b/hw/isa/apm.c
index 054d529..26ab170 100644
--- a/hw/isa/apm.c
+++ b/hw/isa/apm.c
@@ -41,7 +41,8 @@ static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
 {
     APMState *apm = opaque;
     addr &= 1;
-    APM_DPRINTF("apm_ioport_writeb addr=0x%x val=0x%02x\n", addr, val);
+    APM_DPRINTF("apm_ioport_writeb addr=0x%" HWADDR_PRIx
+                " val=0x%02" PRIx64 "\n", addr, val);
     if (addr == 0) {
         apm->apmc = val;
 
@@ -64,7 +65,7 @@ static uint64_t apm_ioport_readb(void *opaque, hwaddr addr, unsigned size)
     } else {
         val = apm->apms;
     }
-    APM_DPRINTF("apm_ioport_readb addr=0x%x val=0x%02x\n", addr, val);
+    APM_DPRINTF("apm_ioport_readb addr=0x%" HWADDR_PRIx " val=0x%02x\n", addr, val);
     return val;
 }
 
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 233fc70..340dd92 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -391,7 +391,7 @@ static void cmos_ioport_write(void *opaque, hwaddr addr,
     if ((addr & 1) == 0) {
         s->cmos_index = data & 0x7f;
     } else {
-        CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02x\n",
+        CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02" PRIx64 "\n",
                      s->cmos_index, data);
         switch(s->cmos_index) {
         case RTC_SECONDS_ALARM:
-- 
1.7.12.4



