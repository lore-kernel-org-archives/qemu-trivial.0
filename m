Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtFwO-0003E0-Hl
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 09:18:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtFwM-0003B9-Od
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 09:18:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtFwL-0006GN-Uj
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 09:18:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZtFwG-0006FC-7A; Mon, 02 Nov 2015 09:18:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id BE62396CA;
	Mon,  2 Nov 2015 14:18:23 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-64.ams2.redhat.com
	[10.36.112.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA2EILZ1024721; Mon, 2 Nov 2015 09:18:22 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Nov 2015 15:17:37 +0100
Message-Id: <1446473857-11934-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] pci-assign: do not test path with access()
	before opening
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
X-List-Received-Date: Mon, 02 Nov 2015 14:18:31 -0000

Using access() is a time-of-check/time-of-use race condition.  It is
okay to use them to provide better error messages, but that is pretty
much it.

In this case we can get the same error from fopen(), so just use
strerror and errno there---which actually improves the error
message most of the time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.5.0


