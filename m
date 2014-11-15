Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGg-0006wc-Ib
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGY-0006e8-8F
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGT-0003wW-ER
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:38 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:53412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iZ-0x; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml452-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXD50464; Sat, 15 Nov 2014 18:07:05 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml452-hub.china.huawei.com
	(10.82.67.195) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:55 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:47 +0800
Message-ID: <1416046008-7880-9-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.546725C9.0087, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 153be71d93371df780ba9550493589d5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 8/9] shpc: fix dead code
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
 hw/pci/shpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 65b2f51..9a39060 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -559,8 +559,9 @@ void shpc_device_hot_unplug_request_cb(HotplugHandler *hotplug_dev,
     uint8_t led;
     int slot;
 
-    shpc_device_hotplug_common(PCI_DEVICE(dev), &slot, shpc, errp);
+    shpc_device_hotplug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
     if (local_err) {
+        error_propagate(errp, local_err);
         return;
     }
 
-- 
1.7.12.4



