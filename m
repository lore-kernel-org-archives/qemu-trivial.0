Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopD7-0005Xl-64
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopD0-0005JB-FI
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCu-0007Ou-NQ
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopCi-0007Ly-GR; Mon, 26 May 2014 03:20:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 257B542FA6;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 117DF644;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23001 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:55 +0400
Message-Id: <1401088811-22923-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Saravanakumar <saravanakumar.punith@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/23] jazz_led: Add missing break in switch
	case
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
X-List-Received-Date: Mon, 26 May 2014 07:20:39 -0000

From: Saravanakumar <saravanakumar.punith@gmail.com>

Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
Reviewed-by: Paolo Bonizni <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/jazz_led.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index e9bb005..12b1707 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -173,6 +173,7 @@ static void jazz_led_update_display(void *opaque)
             case 16:
                 color_segment = rgb_to_pixel16(0xaa, 0xaa, 0xaa);
                 color_led = rgb_to_pixel16(0x00, 0xff, 0x00);
+                break;
             case 24:
                 color_segment = rgb_to_pixel24(0xaa, 0xaa, 0xaa);
                 color_led = rgb_to_pixel24(0x00, 0xff, 0x00);
-- 
1.7.10.4


