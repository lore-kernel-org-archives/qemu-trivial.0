Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgh-0006Vc-Ii
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqge-0006Pz-MD
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgd-0006xc-L0
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:40 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46017 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgc-0006vX-Ax
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:39 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgY-00084n-Tg; Fri, 06 Feb 2015 22:43:34 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:13 +0100
Message-Id: <1423258997-30957-7-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 06/10] serial: Fix warnings caused by missing
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:41 -0000

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


