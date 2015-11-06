Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvo-0002yb-GP
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvk-0002qx-Mo
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002I9-Kv
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugve-0002Cr-D5; Fri, 06 Nov 2015 08:19:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B95C340D82;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 98DD6ADB;
	Fri,  6 Nov 2015 15:44:06 +0300 (MSK)
Received: (nullmailer pid 31709 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:55 +0300
Message-Id: <6268520d7df9b3f183bb4397218c9287441bc04f.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/24] pci-assign: do not test path with
	access() before opening
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:50 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Using access() is a time-of-check/time-of-use race condition.  It is
okay to use them to provide better error messages, but that is pretty
much it.

In this case we can get the same error from fopen(), so just use
strerror and errno there---which actually improves the error
message most of the time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pci-assign-load-rom.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-rom.c
index 34a3a7e..e40b586 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -45,14 +45,10 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev, struct Object *owner,
         return NULL;
     }
 
-    if (access(rom_file, F_OK)) {
-        error_report("pci-assign: Insufficient privileges for %s", rom_file);
-        return NULL;
-    }
-
     /* Write "1" to the ROM file to enable it */
     fp = fopen(rom_file, "r+");
     if (fp == NULL) {
+        error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
         return NULL;
     }
     val = 1;
-- 
2.1.4


