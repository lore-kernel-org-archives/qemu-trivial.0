Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4H3-0008C9-AW
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:42:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gx-0007y0-54
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gs-0007Fd-LV
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4Gd-0007Bk-IY; Wed, 03 Sep 2014 02:42:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EFE2940763;
	Wed,  3 Sep 2014 10:42:05 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5BD0E6F3;
	Wed,  3 Sep 2014 10:35:37 +0400 (MSK)
Received: (nullmailer pid 1614 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:31 +0400
Message-Id: <1409726135-1547-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/10] MAINTAINERS: Add VMWare devices
	maintainer
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
X-List-Received-Date: Wed, 03 Sep 2014 06:42:31 -0000

From: Dmitry Fleytman <dmitry@daynix.com>

Signed-off-by: Dmitry Fleytman <dmitry@daynix.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 142f68a..8622e01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -684,6 +684,12 @@ S: Maintained
 F: hw/*/xilinx_*
 F: include/hw/xilinx.h
 
+Vmware
+M: Dmitry Fleytman <dmitry@daynix.com>
+S: Maintained
+F: hw/net/vmxnet*
+F: hw/scsi/vmw_pvscsi*
+
 Subsystems
 ----------
 Audio
-- 
1.7.10.4


