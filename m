Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YD3FC-0008GD-Ar
	for mharc-qemu-trivial@gnu.org; Sun, 18 Jan 2015 22:43:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YD3F9-0008Bo-JI
	for qemu-trivial@nongnu.org; Sun, 18 Jan 2015 22:43:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YD3F8-0008G4-KW
	for qemu-trivial@nongnu.org; Sun, 18 Jan 2015 22:43:11 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:44114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YD3F2-0007hi-H9; Sun, 18 Jan 2015 22:43:05 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CID26263; Mon, 19 Jan 2015 11:42:55 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 19 Jan 2015 11:42:42 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 19 Jan 2015 11:42:30 +0800
Message-ID: <1421638950-12056-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] usb/desc-msos: using g_free instead of free
	in usb_desc_msos()
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
X-List-Received-Date: Mon, 19 Jan 2015 03:43:12 -0000

From: Gonglei <arei.gonglei@huawei.com>

It's important to match g_malloc() with g_free(), plain
malloc() with free(). Otherwise bad things can happen,
since these allocators may use different memory pools.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
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
1.7.12.4



