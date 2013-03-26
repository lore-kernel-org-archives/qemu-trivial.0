Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKT69-0008Io-3A
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2013 08:35:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UKT64-0008C0-3h
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 08:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UKT60-0001I7-SJ
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 08:35:24 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:33298 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UKT5r-0001FR-Li; Tue, 26 Mar 2013 08:35:11 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UKT5p-0002SH-7E; Tue, 26 Mar 2013 12:35:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Mar 2013 12:35:09 +0000
Message-Id: <1364301309-9414-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/tcx: Remove unused 'addr' field and the
	property that sets it
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
X-List-Received-Date: Tue, 26 Mar 2013 12:35:26 -0000

Remove the 'addr' field from TCXState (since it is completely unused),
also the qdev property which sets it. This seems to be a relic from
many years past; devices don't need to know where they are mapped.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Random minor cleanup, but I'm hoping we might be able to get rid of
the 'taddr' properties altogether; there aren't very many of them...

 hw/sparc/sun4m.c |    1 -
 hw/tcx.c         |    2 --
 2 files changed, 3 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 2f214da..9ebda02 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -575,7 +575,6 @@ static void tcx_init(hwaddr addr, int vram_size, int width,
     SysBusDevice *s;
 
     dev = qdev_create(NULL, "SUNW,tcx");
-    qdev_prop_set_taddr(dev, "addr", addr);
     qdev_prop_set_uint32(dev, "vram_size", vram_size);
     qdev_prop_set_uint16(dev, "width", width);
     qdev_prop_set_uint16(dev, "height", height);
diff --git a/hw/tcx.c b/hw/tcx.c
index f1edffd..c44068e 100644
--- a/hw/tcx.c
+++ b/hw/tcx.c
@@ -37,7 +37,6 @@
 
 typedef struct TCXState {
     SysBusDevice busdev;
-    hwaddr addr;
     QemuConsole *con;
     uint8_t *vram;
     uint32_t *vram24, *cplane;
@@ -707,7 +706,6 @@ write_err:
 }
 
 static Property tcx_properties[] = {
-    DEFINE_PROP_TADDR("addr",      TCXState, addr,      -1),
     DEFINE_PROP_HEX32("vram_size", TCXState, vram_size, -1),
     DEFINE_PROP_UINT16("width",    TCXState, width,     -1),
     DEFINE_PROP_UINT16("height",   TCXState, height,    -1),
-- 
1.7.9.5


