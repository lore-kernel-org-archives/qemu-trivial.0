Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5rmB-0001lS-9j
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 06:44:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5rm3-0001f0-Ck
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5rm2-0002BB-M9
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:44:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1d5rm0-00029C-LH; Wed, 03 May 2017 06:44:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 843B04E040;
	Wed,  3 May 2017 10:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 843B04E040
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 843B04E040
Received: from donizetti.redhat.com (ovpn-118-18.ams2.redhat.com
	[10.36.118.18] (may be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v43Aif8E025239; Wed, 3 May 2017 06:44:42 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
Date: Wed,  3 May 2017 12:44:41 +0200
Message-Id: <20170503104441.1349-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 03 May 2017 10:44:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Wed, 03 May 2017 10:44:53 -0000

Detected by GCC 7's -Wformat-truncation.  snprintf writes at most
2 bytes here including the terminating NUL, so the result is
truncated.  In addition, the newline at the end is pointless.
Fix the buffer size and the format string.
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
2.12.2


