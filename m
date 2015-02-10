Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Pd-0001VR-Q1
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:35:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Pa-0001QK-Nk
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:35:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4PZ-0001Zh-Je
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:35:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4PR-0001Ic-TI; Tue, 10 Feb 2015 01:34:58 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EE39E41820;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DA552933;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: (nullmailer pid 9340 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:53 +0300
Message-Id: <5edab03d40408564212887f7674591230784a1a8.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 04/46] Add trace to ps2.c.
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
X-List-Received-Date: Tue, 10 Feb 2015 06:35:08 -0000

From: Don Koch <dkoch@verizon.com>

Signed-off-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/input/ps2.c | 16 ++++++++++++++++
 trace-events   | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index a466e25..4baeea2 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -27,6 +27,8 @@
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
+#include "trace.h"
+
 /* debug PC keyboard */
 //#define DEBUG_KBD
 
@@ -158,6 +160,7 @@ static void ps2_put_keycode(void *opaque, int keycode)
 {
     PS2KbdState *s = opaque;
 
+    trace_ps2_put_keycode(opaque, keycode);
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER);
     /* XXX: add support for scancode set 1 */
     if (!s->translate && keycode < 0xe0 && s->scancode_set > 1) {
@@ -194,6 +197,7 @@ uint32_t ps2_read_data(void *opaque)
     PS2Queue *q;
     int val, index;
 
+    trace_ps2_read_data(opaque);
     q = &s->queue;
     if (q->count == 0) {
         /* NOTE: if no data left, we return the last keyboard one
@@ -218,12 +222,14 @@ uint32_t ps2_read_data(void *opaque)
 
 static void ps2_set_ledstate(PS2KbdState *s, int ledstate)
 {
+    trace_ps2_set_ledstate(s, ledstate);
     s->ledstate = ledstate;
     kbd_put_ledstate(ledstate);
 }
 
 static void ps2_reset_keyboard(PS2KbdState *s)
 {
+    trace_ps2_reset_keyboard(s);
     s->scan_enabled = 1;
     s->scancode_set = 2;
     ps2_set_ledstate(s, 0);
@@ -233,6 +239,7 @@ void ps2_write_keyboard(void *opaque, int val)
 {
     PS2KbdState *s = (PS2KbdState *)opaque;
 
+    trace_ps2_write_keyboard(opaque, val);
     switch(s->common.write_cmd) {
     default:
     case -1:
@@ -319,6 +326,7 @@ void ps2_write_keyboard(void *opaque, int val)
 void ps2_keyboard_set_translation(void *opaque, int mode)
 {
     PS2KbdState *s = (PS2KbdState *)opaque;
+    trace_ps2_keyboard_set_translation(opaque, mode);
     s->translate = mode;
 }
 
@@ -364,6 +372,7 @@ static void ps2_mouse_send_packet(PS2MouseState *s)
         break;
     }
 
+    trace_ps2_mouse_send_packet(s, dx1, dy1, dz1, b);
     /* update deltas */
     s->mouse_dx -= dx1;
     s->mouse_dy -= dy1;
@@ -433,6 +442,7 @@ static void ps2_mouse_sync(DeviceState *dev)
 void ps2_mouse_fake_event(void *opaque)
 {
     PS2MouseState *s = opaque;
+    trace_ps2_mouse_fake_event(opaque);
     s->mouse_dx++;
     ps2_mouse_sync(opaque);
 }
@@ -440,6 +450,8 @@ void ps2_mouse_fake_event(void *opaque)
 void ps2_write_mouse(void *opaque, int val)
 {
     PS2MouseState *s = (PS2MouseState *)opaque;
+
+    trace_ps2_write_mouse(opaque, val);
 #ifdef DEBUG_MOUSE
     printf("kbd: write mouse 0x%02x\n", val);
 #endif
@@ -606,6 +618,7 @@ static void ps2_kbd_reset(void *opaque)
 {
     PS2KbdState *s = (PS2KbdState *) opaque;
 
+    trace_ps2_kbd_reset(opaque);
     ps2_common_reset(&s->common);
     s->scan_enabled = 0;
     s->translate = 0;
@@ -616,6 +629,7 @@ static void ps2_mouse_reset(void *opaque)
 {
     PS2MouseState *s = (PS2MouseState *) opaque;
 
+    trace_ps2_mouse_reset(opaque);
     ps2_common_reset(&s->common);
     s->mouse_status = 0;
     s->mouse_resolution = 0;
@@ -763,6 +777,7 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
 
+    trace_ps2_kbd_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
     s->scancode_set = 2;
@@ -784,6 +799,7 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
 
+    trace_ps2_mouse_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
     vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
diff --git a/trace-events b/trace-events
index ce1bf60..61c8a9a 100644
--- a/trace-events
+++ b/trace-events
@@ -225,6 +225,23 @@ slavio_check_interrupts(uint32_t pending, uint32_t intregm_disabled) "pending %x
 slavio_set_irq(uint32_t target_cpu, int irq, uint32_t pil, int level) "Set cpu %d irq %d -> pil %d level %d"
 slavio_set_timer_irq_cpu(int cpu, int level) "Set cpu %d local timer level %d"
 
+# hw/input/ps2.c
+ps2_put_keycode(void *opaque, int keycode) "%p keycode %d"
+ps2_read_data(void *opaque) "%p"
+ps2_set_ledstate(void *s, int ledstate) "%p ledstate %d"
+ps2_reset_keyboard(void *s) "%p"
+ps2_write_keyboard(void *opaque, int val) "%p val %d"
+ps2_keyboard_set_translation(void *opaque, int mode) "%p mode %d"
+ps2_mouse_send_packet(void *s, int dx1, int dy1, int dz1, int b) "%p x %d y %d z %d bs %#x"
+ps2_mouse_event_disabled(void *opaque, int dx, int dy, int dz, int buttons_state, int mouse_dx, int mouse_dy, int mouse_dz) "%p x %d y %d z %d bs %#x mx %d my %d mz %d "
+ps2_mouse_event(void *opaque, int dx, int dy, int dz, int buttons_state, int mouse_dx, int mouse_dy, int mouse_dz) "%p x %d y %d z %d bs %#x mx %d my %d mz %d "
+ps2_mouse_fake_event(void *opaque) "%p"
+ps2_write_mouse(void *opaque, int val) "%p val %d"
+ps2_kbd_reset(void *opaque) "%p"
+ps2_mouse_reset(void *opaque) "%p"
+ps2_kbd_init(void *s) "%p"
+ps2_mouse_init(void *s) "%p"
+
 # hw/misc/slavio_misc.c
 slavio_misc_update_irq_raise(void) "Raise IRQ"
 slavio_misc_update_irq_lower(void) "Lower IRQ"
-- 
2.1.4


