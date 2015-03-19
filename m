Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYZG0-00014w-EM
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 08:09:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1YYZFu-0000vX-If
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 08:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1YYZFr-0001xw-IA
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 08:08:54 -0400
Received: from thoth.sbs.de ([192.35.17.2]:56300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1YYZFh-0001wT-Kc; Thu, 19 Mar 2015 08:08:41 -0400
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.14.3/8.14.3) with ESMTP id t2JC8ehP012025;
	Thu, 19 Mar 2015 13:08:40 +0100
Received: from md1f2u6c.ww002.siemens.net (md1f2u6c.mch.sbs.de [139.25.40.156]
	(may be forged))
	by mail3.siemens.de (8.14.3/8.14.3) with ESMTP id t2JC8eeB016073;
	Thu, 19 Mar 2015 13:08:40 +0100
Message-ID: <550ABC48.5060602@siemens.com>
Date: Thu, 19 Mar 2015 13:08:40 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.2
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] pcspk: Fix I/O port name
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
X-List-Received-Date: Thu, 19 Mar 2015 12:08:58 -0000

Probably a copy&paste bug. Fixing it helps identifying the device model
behind port 0x61.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
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

