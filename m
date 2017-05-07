Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GoA-0001UN-2A
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-0001Qg-P8
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go2-00074A-SE
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7Gny-00071f-5j; Sun, 07 May 2017 03:40:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 81A4740481;
	Sun,  7 May 2017 10:40:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8ABDF437;
	Sun,  7 May 2017 10:02:31 +0300 (MSK)
Received: (nullmailer pid 26579 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:23 +0300
Message-Id: <8d152b536ef6b40d51901ae650d72a4afb794e80.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/23] jazz_led: fix bad snprintf
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
X-List-Received-Date: Sun, 07 May 2017 07:40:40 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Detected by GCC 7's -Wformat-truncation.  snprintf writes at most
2 bytes here including the terminating NUL, so the result is
truncated.  In addition, the newline at the end is pointless.
Fix the buffer size and the format string.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/jazz_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index b72fdb1717..3c97d56434 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -227,13 +227,13 @@ static void jazz_led_invalidate_display(void *opaque)
 static void jazz_led_text_update(void *opaque, console_ch_t *chardata)
 {
     LedState *s = opaque;
-    char buf[2];
+    char buf[3];
 
     dpy_text_cursor(s->con, -1, -1);
     qemu_console_resize(s->con, 2, 1);
 
     /* TODO: draw the segments */
-    snprintf(buf, 2, "%02hhx\n", s->segments);
+    snprintf(buf, 3, "%02hhx", s->segments);
     console_write_ch(chardata++, ATTR2CHTYPE(buf[0], QEMU_COLOR_BLUE,
                                              QEMU_COLOR_BLACK, 1));
     console_write_ch(chardata++, ATTR2CHTYPE(buf[1], QEMU_COLOR_BLUE,
-- 
2.11.0


