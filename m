Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuF-0007RH-9k
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu9-0007GY-Jg
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu5-0007b5-Ev
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtu-0007Y9-Ec; Tue, 10 Jun 2014 12:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D014412C9;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 754086DD;
	Tue, 10 Jun 2014 20:08:51 +0400 (MSK)
Received: (nullmailer pid 13340 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:42 +0400
Message-Id: <1402416523-13212-25-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Nicolas Owens <mischief@offblast.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 24/25] hw: vmware_vga: don't return cursorx
	when the driver asks for cursory register
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:13 -0000

From: Nicolas Owens <mischief@offblast.org>

hello qemu-*@nongnu.org, this is my first contribution. apologies if
something is incorrect.

this patch fixes vmware_vga.c so that it actually returns the cursory
register when asked for, instead of cursorx.

Signed-off-by: Nicolas Owens <mischief@offblast.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/vmware_vga.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 9ba47e6..ab54b6f 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -863,7 +863,7 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
         break;
 
     case SVGA_REG_CURSOR_Y:
-        ret = s->cursor.x;
+        ret = s->cursor.y;
         break;
 
     case SVGA_REG_CURSOR_ON:
-- 
1.7.10.4


