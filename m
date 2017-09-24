Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEfB-0003El-UX
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:42:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEf9-0003Bv-JW
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEf8-0004pJ-S8
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:42:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEf2-0004lf-MR; Sun, 24 Sep 2017 17:42:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 094F341C96;
	Mon, 25 Sep 2017 00:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7109EC43;
	Mon, 25 Sep 2017 00:22:57 +0300 (MSK)
Received: (nullmailer pid 28296 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:46 +0300
Message-Id: <9e482d1a7ea967ffd465f530b3e5a6df32c20f69.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 28/31] dma/i82374: avoid double creation of
 i82374 device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 21:42:08 -0000

From: Eduardo Otubo <otubo@redhat.com>

QEMU fails when used with the following command line:

  ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
  qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
  Aborted (core dumped)

The 40p machine type already creates the device i82374. If specified in the
command line, it will try to create it again, hence generating the error. The
function isa_bus_dma() isn't supposed to be called twice for the same bus. One
way to avoid this problem is to set user_creatable=false.

A possible fix in a near future would be making
isa_bus_dma()/DMA_init()/i82374_realize() return an error instead of asserting
as well.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/i82374.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6c0f975df0..e76dea8dc7 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -139,6 +139,11 @@ static void i82374_class_init(ObjectClass *klass, void *data)
     dc->realize = i82374_realize;
     dc->vmsd = &vmstate_i82374;
     dc->props = i82374_properties;
+    dc->user_creatable = false;
+    /*
+     * Reason: i82374_realize() crashes (assertion failure inside isa_bus_dma()
+     *         if the device is instantiated twice.
+     */
 }
 
 static const TypeInfo i82374_info = {
-- 
2.11.0


