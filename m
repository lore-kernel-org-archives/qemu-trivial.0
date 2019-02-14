Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYz-0002Te-QU
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYs-0002Kz-IG
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYm-0002pQ-GG
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:10 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55037)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYh-0002Uy-Qk; Thu, 14 Feb 2019 05:48:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MlfGs-1hLLuW3hXG-00imvM; Thu, 14 Feb 2019 11:47:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 14 Feb 2019 11:47:11 +0100
Message-Id: <20190214104717.3543-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iaG/nFgEendP6IDARXyTKjdsT7UpTyxg0+hriBohdWV6KSBFIyM
	3ZYDO8HFuCJy2+CmRxZW6gDJyX9r+U4T+TVkCtKaea4kNebmf0jD/gw5e8bFMaogy4FHgTW
	JjJQQJvnn0MoZQ8oEeat92gnV3ZFIxq5jA+JatowoouzZOMIjgmo0mDTN+l5U6hVJvRYgSh
	FbAA26VuJ3yRFytzPgQvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ySIu+flUAaM=:dRQQ3e5+t0Ve3mK1PyaUR6
	+3eegs8b89JaX3BMhztTgrcWJnxXYxWCqM3v9KKtRq/vkUYNfn2SnzfhBQDYYuxn4yeaLe7wY
	DxWWBbQo8QQf9grK1ttknBuLp9XMjTOM+e2nkDUHOgqZUe6OWXSDUz85uetoRwWZlBT4veCtl
	OvDVoUVMqIBWLP4OV1to9pNz0RAIABluNE/3bvZuXkDS3oARIfD6G4sG3khqaJJuvjgHOi+Jn
	RrXTUqFzzgFQ+88IoK2GEFGuKLkzpEV32u3E4Y55g9wow9FbSBI4GMPiZttBk9+mkeTrpuNk4
	EplbmsJxbtDtsLkS9xcj6ff3qzJoU9LLDCB/HP8cZbrQtSinWW4hZP/FTf179/x8LHo0eXLnq
	8/qa8iwlFauHuhhUAIjzY//v0/OpCY2wyixoV5/Fgz03Os8SlIciByvx5T/fGwOjsM11YWxs8
	lSzmsE1+FUS3eUIZWYME6jNpNkcElMkYDacsDNqPNCYVyL9vTNqiLyQbNS65hshNBnJpNhMyV
	fr/JGpksv4lb/3qjhc+n96uvHMJ0VeuEymZ07zirJvL4MSVVfsEo6RUofaiIUkrUwXRXE8rqP
	izHg1NHa9Q1lAne9wpCdpk2N76FhqTW78VJ/ChI8ZyBxyQcamxjxIEf+Iw2OutB0gLxRE3x0V
	Xv+Yj6HzLDlzXikALVqvnpY9OjVZzOe1uJ9uKIruMmSLYmTldci6m56tc24KEO54vF9152+6X
	kf0b95L28erEj1w6jXcXoLrosM0Cp6zGekrQRNFizBQXmjwSp2mxQyLNHqA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 08/14] pckbd: Convert DPRINTF->trace
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:13 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20181016112232.23241-1-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/pckbd.c      | 19 ++++++-------------
 hw/input/trace-events |  7 +++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 72e7d5f6cc50..47a606f5e3a0 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -30,14 +30,7 @@
 #include "hw/input/i8042.h"
 #include "sysemu/sysemu.h"
 
-/* debug PC keyboard */
-//#define DEBUG_KBD
-#ifdef DEBUG_KBD
-#define DPRINTF(fmt, ...)                                       \
-    do { printf("KBD: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 /*	Keyboard Controller Commands */
 #define KBD_CCMD_READ_MODE	0x20	/* Read mode bits */
@@ -210,7 +203,7 @@ static uint64_t kbd_read_status(void *opaque, hwaddr addr,
     KBDState *s = opaque;
     int val;
     val = s->status;
-    DPRINTF("kbd: read status=0x%02x\n", val);
+    trace_pckbd_kbd_read_status(val);
     return val;
 }
 
@@ -224,7 +217,7 @@ static void kbd_queue(KBDState *s, int b, int aux)
 
 static void outport_write(KBDState *s, uint32_t val)
 {
-    DPRINTF("kbd: write outport=0x%02x\n", val);
+    trace_pckbd_outport_write(val);
     s->outport = val;
     qemu_set_irq(s->a20_out, (val >> 1) & 1);
     if (!(val & 1)) {
@@ -237,7 +230,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
 {
     KBDState *s = opaque;
 
-    DPRINTF("kbd: write cmd=0x%02" PRIx64 "\n", val);
+    trace_pckbd_kbd_write_command(val);
 
     /* Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
      * low for approximately 6 micro seconds. Bits 3-0 of the KBD_CCMD_PULSE
@@ -326,7 +319,7 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
     else
         val = ps2_read_data(s->kbd);
 
-    DPRINTF("kbd: read data=0x%02x\n", val);
+    trace_pckbd_kbd_read_data(val);
     return val;
 }
 
@@ -335,7 +328,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
 {
     KBDState *s = opaque;
 
-    DPRINTF("kbd: write data=0x%02" PRIx64 "\n", val);
+    trace_pckbd_kbd_write_data(val);
 
     switch(s->write_cmd) {
     case 0:
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 3965a842aee5..8e53ae5bbf15 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -14,6 +14,13 @@ adb_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x o
 adb_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
 adb_mouse_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
 
+# hw/input/pckbd.c
+pckbd_kbd_read_data(uint32_t val) "0x%02x"
+pckbd_kbd_read_status(int status) "0x%02x"
+pckbd_outport_write(uint32_t val) "0x%02x"
+pckbd_kbd_write_command(uint64_t val) "0x%02"PRIx64
+pckbd_kbd_write_data(uint64_t val) "0x%02"PRIx64
+
 # hw/input/ps2.c
 ps2_put_keycode(void *opaque, int keycode) "%p keycode 0x%02x"
 ps2_keyboard_event(void *opaque, int qcode, int down, unsigned int modifier, unsigned int modifiers) "%p qcode %d down %d modifier 0x%x modifiers 0x%x"
-- 
2.20.1


