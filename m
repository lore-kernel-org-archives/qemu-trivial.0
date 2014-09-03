Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Ak-0001qr-3V
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:36:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Ad-0001d6-Ai
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4AZ-0005fR-5p
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4AL-0005b4-EN; Wed, 03 Sep 2014 02:35:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3FD234075E;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2D79B6E0;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1606 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:27 +0400
Message-Id: <1409726135-1547-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/10] Fix debug print warning
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
X-List-Received-Date: Wed, 03 Sep 2014 06:36:00 -0000

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i2c/pm_smbus.c      |    5 +++--
 hw/i386/pc.c           |    2 +-
 hw/input/pckbd.c       |    4 ++--
 hw/intc/i8259.c        |    2 +-
 hw/isa/apm.c           |    5 +++--
 hw/timer/mc146818rtc.c |    2 +-
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
index 0ca4deb..b6c9b61 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -481,7 +481,7 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
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
index 4df650f..17912b8 100644
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
1.7.10.4


