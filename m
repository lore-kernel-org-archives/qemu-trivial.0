Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqDg-0004eE-KX
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:13:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqDd-0004ad-Pt
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:13:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqDZ-0005zw-Mq
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:13:41 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:45964 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqDZ-0005zr-Gg
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:13:37 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqDZ-0007jY-2l; Fri, 06 Feb 2015 22:13:37 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnug.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:13:33 +0100
Message-Id: <1423257213-29692-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] vga: Fix warning caused by missing 'static'
	attribute
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
X-List-Received-Date: Fri, 06 Feb 2015 21:13:42 -0000

Warning from the Sparse static analysis tool:

hw/display/vga.c:2012:26: warning:
 symbol 'vmstate_vga_endian' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


