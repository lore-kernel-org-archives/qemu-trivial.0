Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9YJO-0006D8-Se
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:41:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJM-000683-6r
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJK-0002L6-Ad
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9YJ4-0002HW-58; Sun, 05 Jun 2016 09:41:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B167A4092C;
	Sun,  5 Jun 2016 16:41:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E7C1CAE3;
	Sun,  5 Jun 2016 10:43:34 +0300 (MSK)
Received: (nullmailer pid 1099 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun,  5 Jun 2016 10:42:42 +0300
Message-Id: <bf19f5e04ec2a25fb5b836c7f251a30e40974661.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/52] fsdev: spelling fix
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
X-List-Received-Date: Sun, 05 Jun 2016 13:41:53 -0000

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


