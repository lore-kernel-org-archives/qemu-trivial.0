Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZlZ0C-0001wo-84
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2015 05:02:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1ZlZ04-0001kn-TT
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 05:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1ZlZ01-0007tS-MT
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 05:02:32 -0400
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:3258
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1ZlYzs-0007sM-IH; Mon, 12 Oct 2015 05:02:20 -0400
Received: from localhost (localhost.localhost [127.0.0.1])
	by mail.embedded-brains.de (Postfix) with ESMTP id 3C21F2A181A;
	Mon, 12 Oct 2015 10:25:27 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
	by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id B35sZMWUalkZ; Mon, 12 Oct 2015 10:25:25 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
	by mail.embedded-brains.de (Postfix) with ESMTP id 02B842A097D;
	Mon, 12 Oct 2015 10:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
	by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WVDsRWh9eZQU; Mon, 12 Oct 2015 10:25:24 +0200 (CEST)
Received: from huber-linux.eb.localhost (unknown [192.168.96.129])
	by mail.embedded-brains.de (Postfix) with ESMTP id D65D82A097C;
	Mon, 12 Oct 2015 10:25:24 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Oct 2015 10:25:01 +0200
Message-Id: <1444638301-10401-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 1.8.4.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
	jasowang@redhat.com, peter.crosthwaite@xilinx.com
Subject: [Qemu-trivial] [PATCH] net: cadence_gem: Set initial MAC address
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
X-List-Received-Date: Mon, 12 Oct 2015 09:02:38 -0000

Set initial MAC address to the one specified by the command line.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/net/cadence_gem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 1127223..3639fc1 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -964,6 +964,7 @@ static void gem_reset(DeviceState *d)
 {
     int i;
     CadenceGEMState *s = CADENCE_GEM(d);
+    const uint8_t *a;
 
     DB_PRINT("\n");
 
@@ -982,6 +983,11 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF5] = 0x002f2145;
     s->regs[GEM_DESCONF6] = 0x00000200;
 
+    /* Set MAC address */
+    a = &s->conf.macaddr.a[0];
+    s->regs[GEM_SPADDR1LO] = a[0] | (a[1] << 8) | (a[2] << 16) | (a[3] << 24);
+    s->regs[GEM_SPADDR1HI] = a[4] | (a[5] << 8);
+
     for (i = 0; i < 4; i++) {
         s->sar_active[i] = false;
     }
-- 
1.8.4.5


