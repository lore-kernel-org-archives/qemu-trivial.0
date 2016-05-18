Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b31Iu-0007nU-Ea
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 09:14:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b31In-0007iC-Fu
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b31Il-00027F-Hf
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:14:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b31Ie-000256-AF; Wed, 18 May 2016 09:14:08 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F20F1417C8;
	Wed, 18 May 2016 16:14:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 14BB6ADA;
	Wed, 18 May 2016 16:14:02 +0300 (MSK)
Received: (nullmailer pid 1391 invoked by uid 1000);
	Wed, 18 May 2016 13:14:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 16:14:01 +0300
Message-Id: <1463577241-1351-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial 2/2] fsdev: spelling fix
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
X-List-Received-Date: Wed, 18 May 2016 13:14:23 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtfs-proxy-helper.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index 6eb2d50..f4cbb60 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -15,7 +15,7 @@ provide access to files beyond 9p export path.
 
 2) Running QEMU with root privilege could be a security issue.
 
-To overcome above issues, following approach is used: A new filesytem
+To overcome above issues, following approach is used: A new filesystem
 type 'proxy' is introduced. Proxy FS uses chroot + socket combination
 for securing the vulnerability known with following symbolic links.
 Intention of adding a new filesystem type is to allow qemu to run
-- 
2.1.4


