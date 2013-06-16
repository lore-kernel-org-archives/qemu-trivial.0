Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoFPp-0006HL-5m
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 12:02:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBH1-0003Il-Kw
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 07:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBH0-0003H6-Qy
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 07:37:31 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:32902
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBGy-0003Gi-Mh; Sun, 16 Jun 2013 07:37:28 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 6EB58182F86; Sun, 16 Jun 2013 13:37:26 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 16 Jun 2013 13:37:25 +0200
Message-Id: <1371382645-20912-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
X-Mailman-Approved-At: Sun, 16 Jun 2013 12:02:50 -0400
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] kvm: Fix potential resource leak (missing
	fclose)
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
X-List-Received-Date: Sun, 16 Jun 2013 11:37:33 -0000

This leak was detected by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/kvm/pci-assign.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index ff85590..1fb7ad4 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -548,6 +548,7 @@ static int get_real_id(const char *devpath, const char *idname, uint16_t *val)
     if (fscanf(f, "%li\n", &id) == 1) {
         *val = id;
     } else {
+        fclose(f);
         return -1;
     }
     fclose(f);
-- 
1.7.10.4


