Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Up2Rz-0004F0-T7
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 16:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Up2Ry-0004CC-7K
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 16:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Up2Rw-0001bZ-BX
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 16:24:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Up2Rs-0001ac-Nm; Tue, 18 Jun 2013 16:24:16 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 67B8541A6B;
	Wed, 19 Jun 2013 00:24:15 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id B91D051B; Wed, 19 Jun 2013 00:24:14 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2013 00:24:13 +0400
Message-Id: <1371587053-16439-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH trivial] Makefile.objs: do not link block/
	twice
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
X-List-Received-Date: Tue, 18 Jun 2013 20:24:23 -0000

$(block-obj-y) already includes block/, so there's
no need to add it explicitly to $(common-obj-y).

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile.objs |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.objs b/Makefile.objs
index 5b288ba..24c74a8 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -41,7 +41,7 @@ libcacard-y += libcacard/vcardt.o
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = $(block-obj-y) blockdev.o blockdev-nbd.o block/
+common-obj-y = $(block-obj-y) blockdev.o blockdev-nbd.o
 common-obj-y += net/
 common-obj-y += readline.o
 common-obj-y += qdev-monitor.o device-hotplug.o
-- 
1.7.10.4


