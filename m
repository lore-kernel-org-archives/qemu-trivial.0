Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fQ-0006O3-0G
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fH-00067y-5f
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fG-0007pO-DB
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f3-0007ky-Fs; Tue, 10 Feb 2015 01:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6005841824;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 03D21955;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9425 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:34 +0300
Message-Id: <ac285ff5aa599a05ea97775a7a37aab00c83f957.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 45/46] vga: Fix warning caused by missing
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:24 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

hw/display/vga.c:2012:26: warning:
 symbol 'vmstate_vga_endian' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index ffcfce3..9c62fbf 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2032,7 +2032,7 @@ static bool vga_endian_state_needed(void *opaque)
     return s->default_endian_fb != s->big_endian_fb;
 }
 
-const VMStateDescription vmstate_vga_endian = {
+static const VMStateDescription vmstate_vga_endian = {
     .name = "vga.endian",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
2.1.4


