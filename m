Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fN-0006J3-60
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fH-00067q-3r
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fG-0007pG-3W
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f2-0007kZ-FS; Tue, 10 Feb 2015 01:51:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 328C64181F;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BABCB947;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9419 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:31 +0300
Message-Id: <4eb6cdbb6297f13622bd085a73b20a0b445722eb.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 42/46] serial: Fix warnings caused by missing
	'static' attribute
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:20 -0000

From: Stefan Weil <sw@weilnetz.de>

Warnings from the Sparse static analysis tool:

hw/char/serial.c:630:26: warning: symbol
 'vmstate_serial_thr_ipending' was not declared. Should it be static?
hw/char/serial.c:646:26: warning: symbol
 'vmstate_serial_tsr' was not declared. Should it be static?
hw/char/serial.c:665:26: warning: symbol
 'vmstate_serial_recv_fifo' was not declared. Should it be static?
hw/char/serial.c:681:26: warning: symbol
 'vmstate_serial_xmit_fifo' was not declared. Should it be static?
hw/char/serial.c:697:26: warning: symbol
 'vmstate_serial_fifo_timeout_timer' was not declared. Should it be static?
hw/char/serial.c:713:26: warning: symbol
 'vmstate_serial_timeout_ipending' was not declared. Should it be static?
hw/char/serial.c:729:26: warning: symbol
 'vmstate_serial_poll' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/serial.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index bd25c03..0491897 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -658,7 +658,7 @@ static bool serial_thr_ipending_needed(void *opaque)
     }
 }
 
-const VMStateDescription vmstate_serial_thr_ipending = {
+static const VMStateDescription vmstate_serial_thr_ipending = {
     .name = "serial/thr_ipending",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -674,7 +674,7 @@ static bool serial_tsr_needed(void *opaque)
     return s->tsr_retry != 0;
 }
 
-const VMStateDescription vmstate_serial_tsr = {
+static const VMStateDescription vmstate_serial_tsr = {
     .name = "serial/tsr",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -693,7 +693,7 @@ static bool serial_recv_fifo_needed(void *opaque)
 
 }
 
-const VMStateDescription vmstate_serial_recv_fifo = {
+static const VMStateDescription vmstate_serial_recv_fifo = {
     .name = "serial/recv_fifo",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -709,7 +709,7 @@ static bool serial_xmit_fifo_needed(void *opaque)
     return !fifo8_is_empty(&s->xmit_fifo);
 }
 
-const VMStateDescription vmstate_serial_xmit_fifo = {
+static const VMStateDescription vmstate_serial_xmit_fifo = {
     .name = "serial/xmit_fifo",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -725,7 +725,7 @@ static bool serial_fifo_timeout_timer_needed(void *opaque)
     return timer_pending(s->fifo_timeout_timer);
 }
 
-const VMStateDescription vmstate_serial_fifo_timeout_timer = {
+static const VMStateDescription vmstate_serial_fifo_timeout_timer = {
     .name = "serial/fifo_timeout_timer",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -741,7 +741,7 @@ static bool serial_timeout_ipending_needed(void *opaque)
     return s->timeout_ipending != 0;
 }
 
-const VMStateDescription vmstate_serial_timeout_ipending = {
+static const VMStateDescription vmstate_serial_timeout_ipending = {
     .name = "serial/timeout_ipending",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -757,7 +757,7 @@ static bool serial_poll_needed(void *opaque)
     return s->poll_msl >= 0;
 }
 
-const VMStateDescription vmstate_serial_poll = {
+static const VMStateDescription vmstate_serial_poll = {
     .name = "serial/poll",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
2.1.4


