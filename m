Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGg-0006xD-St
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGY-0006eT-Db
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGT-0003wb-KP
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:38 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:47195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003ie-3Y; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCJ79977; Sat, 15 Nov 2014 18:07:05 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:45 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:48 +0800
Message-ID: <1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 9/9] hcd-musb: fix dereference null return
	value
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:43 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/usb/hcd-musb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 66bc61a..f2cb73c 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -624,6 +624,10 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
 
     /* A wild guess on the FADDR semantics... */
     dev = usb_find_device(&s->port, ep->faddr[idx]);
+    if (!dev) {
+        TRACE("Do not find an usb device");
+        return;
+    }
     uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
     usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
                      (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
-- 
1.7.12.4



