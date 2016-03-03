Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPpG-00059e-TU
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:45:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpC-00051J-5m
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpB-0006B9-CY
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:45:38 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:20650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPp8-00067u-UZ; Thu, 03 Mar 2016 04:45:35 -0500
Received: from 172.24.1.47 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN06033; Thu, 03 Mar 2016 17:45:26 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:52 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:40 +0800
Message-ID: <1456998223-12356-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.56D807B7.0030, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f4d0a409e6a7e06f0ffe54513b5b3f1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 3/6] spice: fix coverity complains
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
X-List-Received-Date: Thu, 03 Mar 2016 09:45:41 -0000

Remove the unnecessary NULL check.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 ui/spice-display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 242ab5f..1ffbec1 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -769,9 +769,7 @@ static void display_mouse_define(DisplayChangeListener *dcl,
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
 
     qemu_mutex_lock(&ssd->lock);
-    if (c) {
-        cursor_get(c);
-    }
+    cursor_get(c);
     cursor_put(ssd->cursor);
     ssd->cursor = c;
     ssd->hot_x = c->hot_x;
-- 
1.8.5.2



