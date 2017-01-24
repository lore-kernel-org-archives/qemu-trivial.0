Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxeu-0002Du-Uf
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:45:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxeo-00025j-Jb
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxen-0002eI-Op
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxej-0002d4-2h; Tue, 24 Jan 2017 04:44:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5EF0342107;
	Tue, 24 Jan 2017 12:44:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id F2FF1567;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12634 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:17 +0300
Message-Id: <5bec9e10fb516b473088f9901847f622ddf36e8e.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/31] pci-assign: avoid pointless stat
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
X-List-Received-Date: Tue, 24 Jan 2017 09:44:55 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Just check the errno value after fopen and follow it with fstat.
This shuts up Coverity's complaint about TOC/TOU violation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pci-assign-load-rom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-rom.c
index 0d8e4b2..fd59076 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -39,19 +39,19 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev, struct Object *owner,
              "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/rom",
              domain, bus, slot, function);
 
-    if (stat(rom_file, &st)) {
-        if (errno != ENOENT) {
-            error_report("pci-assign: Invalid ROM.");
-        }
-        return NULL;
-    }
-
     /* Write "1" to the ROM file to enable it */
     fp = fopen(rom_file, "r+");
     if (fp == NULL) {
-        error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+        if (errno != ENOENT) {
+            error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+        }
         return NULL;
     }
+    if (fstat(fileno(fp), &st) == -1) {
+        error_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
+        goto close_rom;
+    }
+
     val = 1;
     if (fwrite(&val, 1, 1, fp) != 1) {
         goto close_rom;
-- 
2.1.4


