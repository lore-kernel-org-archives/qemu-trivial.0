Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIMq-0002ju-Gv
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIMo-0002hW-A8
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIMn-0002IU-ED
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:19:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIMi-0002GQ-W4; Sat, 04 Apr 2015 03:19:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2542F40575;
	Sat,  4 Apr 2015 10:19:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D3D25924;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20942 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:22 +0300
Message-Id: <ecf2e5a46d7559f258a2c914131ba25d3c5326bf.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 1/5] pcspk: Fix I/O port name
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
X-List-Received-Date: Sat, 04 Apr 2015 07:19:43 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Probably a copy&paste bug. Fixing it helps identifying the device model
behind port 0x61.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/pcspk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 1d81bbe..5266fb5 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -167,7 +167,7 @@ static void pcspk_initfn(Object *obj)
 {
     PCSpkState *s = PC_SPEAKER(obj);
 
-    memory_region_init_io(&s->ioport, OBJECT(s), &pcspk_io_ops, s, "elcr", 1);
+    memory_region_init_io(&s->ioport, OBJECT(s), &pcspk_io_ops, s, "pcspk", 1);
 }
 
 static void pcspk_realizefn(DeviceState *dev, Error **errp)
-- 
2.1.4


