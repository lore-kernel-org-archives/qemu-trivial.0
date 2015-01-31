Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHSUG-0003qO-Mk
	for mharc-qemu-trivial@gnu.org; Sat, 31 Jan 2015 02:29:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YHSUB-0003gh-Ec
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 02:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YHSUA-0003Km-Ig
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 02:28:55 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:65243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YHSU2-0003GI-Je; Sat, 31 Jan 2015 02:28:47 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CGQ06827; Sat, 31 Jan 2015 15:28:30 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 31 Jan 2015 15:28:19 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 31 Jan 2015 15:27:57 +0800
Message-ID: <1422689277-16032-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Sat, 31 Jan 2015 07:28:59 -0000

From: Gonglei <arei.gonglei@huawei.com>

The array length of s->real_device.io_regions[] is
"PCI_NUM_REGIONS - 1". Add a check, just make Coverity happy.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/xen/xen_pt_config_init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 710fe50..3c8b0f1 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -443,6 +443,11 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
         return -1;
     }
 
+    if (index == PCI_ROM_SLOT) {
+        XEN_PT_ERR(&s->dev, "Internal error: Access violation at ROM BAR.\n");
+        return -1;
+    }
+
     /* use fixed-up value from kernel sysfs */
     *value = base_address_with_flags(&s->real_device.io_regions[index]);
 
-- 
1.7.12.4



