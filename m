Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJJ-0007be-8x
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJE-0007VZ-5X
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJD-0007Yp-D9
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJ6-0007UT-T9; Mon, 14 Aug 2017 07:13:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1BF1C40D52;
	Mon, 14 Aug 2017 14:07:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8BAA9B77;
	Mon, 14 Aug 2017 14:07:44 +0300 (MSK)
Received: (nullmailer pid 31411 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:44 +0300
Message-Id: <a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 7/7] hw/misc/mmio_interface: Return after
 error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 11:13:25 -0000

From: Thomas Huth <thuth@redhat.com>

QEMU currently abort()s if the user tries to specify the mmio_interface
device without parameters:

x86_64-softmmu/qemu-system-x86_64 -nographic -device mmio_interface
qemu-system-x86_64: /home/thuth/devel/qemu/util/error.c:57: error_setv:
 Assertion `*errp == ((void *)0)' failed.
Aborted (core dumped)

This happens because the realize function is trying to set the errp
twice in this case. After setting an error, the realize function
should immediately return instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/mmio_interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/mmio_interface.c b/hw/misc/mmio_interface.c
index 6f004d2bab..da154e5c95 100644
--- a/hw/misc/mmio_interface.c
+++ b/hw/misc/mmio_interface.c
@@ -63,10 +63,12 @@ static void mmio_interface_realize(DeviceState *dev, Error **errp)
 
     if (!s->host_ptr) {
         error_setg(errp, "host_ptr property must be set");
+        return;
     }
 
     if (!s->subregion) {
         error_setg(errp, "subregion property must be set");
+        return;
     }
 
     memory_region_init_ram_ptr(&s->ram_mem, OBJECT(s), "ram",
-- 
2.11.0


