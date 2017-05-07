Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GUj-0004Mv-Jc
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUh-0004KJ-8R
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUg-00036e-Fo
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GUc-00034e-2c; Sun, 07 May 2017 03:20:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 083AA40480;
	Sun,  7 May 2017 10:20:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0E73C432;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26546 invoked by uid 1000);
	Sun, 07 May 2017 07:02:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Craig Jellick <craig@rancher.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:07 +0300
Message-Id: <ed1fcd00094cdd9395315068442abe28f612e8a3.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/23] Add 'none' as type for drive's if option
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
X-List-Received-Date: Sun, 07 May 2017 07:20:40 -0000

From: Craig Jellick <craig@rancher.com>

Signed-off-by: Craig Jellick <craig@rancher.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index f68829f3b0..a24fef2107 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -604,7 +604,7 @@ Special files such as iSCSI devices can be specified using protocol
 specific URLs. See the section for "Device URL Syntax" for more information.
 @item if=@var{interface}
 This option defines on which type on interface the drive is connected.
-Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.
+Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio, none.
 @item bus=@var{bus},unit=@var{unit}
 These options define where is connected the drive by defining the bus number and
 the unit id.
-- 
2.11.0


