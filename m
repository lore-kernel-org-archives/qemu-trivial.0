Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yY-0002LC-AC
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yW-0002HZ-0b
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yU-0007BE-VX
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yO-00077d-PW; Tue, 10 Feb 2015 02:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D9B941822;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9902B95B;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9384 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:14 +0300
Message-Id: <0c6f807f4a98e7e258765dcf22619a582995fce0.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 25/46] usb: Pair g_malloc() with g_free(),
	not free()
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:13 -0000

From: Markus Armbruster <armbru@redhat.com>

Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
and my "coverity: Model g_free() isn't necessarily free()" model patch
applied.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/desc-msos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 334d1ae..32c3600 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -231,7 +231,7 @@ int usb_desc_msos(const USBDesc *desc,  USBPacket *p,
         length = len;
     }
     memcpy(dest, buf, length);
-    free(buf);
+    g_free(buf);
 
     p->actual_length = length;
     return 0;
-- 
2.1.4


