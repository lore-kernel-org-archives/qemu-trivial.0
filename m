Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqMH-0006WW-FQ
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqMA-0006Pw-QK
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM6-0008DE-Mu
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLx-0007sb-2O; Tue, 13 Sep 2016 12:14:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3167D416E5;
	Tue, 13 Sep 2016 19:14:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 63A0AAFE;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: (nullmailer pid 31906 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:50 +0300
Message-Id: <e2f310ec384d51c85c1498b49d66893d6dd036b7.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/16] maint: Ignore generated version file
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:51 -0000

From: Eric Blake <eblake@redhat.com>

Commit 67a1de0d created a generated version file, and, in some
circumstances, also a temporary file.  Make sure 'git add .'
won't check them into the repository.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 88ec249..5ffc84b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -53,6 +53,8 @@
 /qemu-bridge-helper
 /qemu-monitor.texi
 /qemu-monitor-info.texi
+/qemu-version.h
+/qemu-version.h.tmp
 /qmp-commands.txt
 /vscclient
 /fsdev/virtfs-proxy-helper
-- 
2.1.4


