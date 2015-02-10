Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bw-0006sv-Uz
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5bu-0006og-4P
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5bt-0004HV-9E
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:54 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:33335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YL5bo-0004Dk-A0; Tue, 10 Feb 2015 02:51:48 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHC52464; Tue, 10 Feb 2015 15:51:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Feb 2015 15:51:29 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 10 Feb 2015 15:51:23 +0800
Message-ID: <1423554683-2968-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
References: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH v2 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:55 -0000

From: Gonglei <arei.gonglei@huawei.com>

The array length of s->real_device.io_regions[] is
"PCI_NUM_REGIONS - 1".

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/xen/xen_pt_config_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 710fe50..d99c22e 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -438,7 +438,7 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 
     /* get BAR index */
     index = xen_pt_bar_offset_to_index(reg->offset);
-    if (index < 0 || index >= PCI_NUM_REGIONS) {
+    if (index < 0 || index >= PCI_NUM_REGIONS - 1) {
         XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
         return -1;
     }
-- 
1.7.12.4



