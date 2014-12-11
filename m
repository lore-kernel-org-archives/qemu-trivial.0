Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8Qg-0003Nw-Pu
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:25:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QZ-00038z-Ba
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QU-00069W-Nr
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8QJ-00066T-GW; Thu, 11 Dec 2014 13:25:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 40A8141D2C;
	Thu, 11 Dec 2014 21:25:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 52DDA8F2;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22983 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:02 +0300
Message-Id: <d504fb4cecdb7c6f3b18c4d83296e84b6e970595.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/20] fw_cfg: remove superfluous blank line
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
X-List-Received-Date: Thu, 11 Dec 2014 18:25:31 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.3


