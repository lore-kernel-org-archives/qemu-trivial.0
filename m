Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XxwsQ-0006qN-BZ
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 06:53:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwsJ-0006eY-K6
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:53:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwsD-000681-My
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:53:11 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:49298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xxws2-00062M-Nr; Mon, 08 Dec 2014 06:52:55 -0500
Received: from 172.24.2.119 (EHLO szxeml411-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDQ97334; Mon, 08 Dec 2014 19:52:51 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml411-hub.china.huawei.com
	(10.82.67.138) with Microsoft SMTP Server id 14.3.158.1; Mon, 8 Dec 2014
	19:52:42 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 8 Dec 2014 19:52:41 +0800
Message-ID: <1418039561-5672-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] fw_cfg: remove superfluous blank line
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
X-List-Received-Date: Mon, 08 Dec 2014 11:53:16 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/nvram/fw_cfg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index a7122ee..c4b78ed 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -621,7 +621,6 @@ static void fw_cfg_realize(DeviceState *dev, Error **errp)
     FWCfgState *s = FW_CFG(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-
     if (s->ctl_iobase + 1 == s->data_iobase) {
         sysbus_add_io(sbd, s->ctl_iobase, &s->comb_iomem);
     } else {
-- 
1.7.12.4



