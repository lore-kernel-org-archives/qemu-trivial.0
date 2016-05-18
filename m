Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Mu-0000DD-4v
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Ms-0000Ax-FM
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mr-00032L-Ik
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30Mk-00030T-Ie; Wed, 18 May 2016 08:14:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 644B3417A6;
	Wed, 18 May 2016 15:14:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 97E1BAE1;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12406 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <gkurz@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:07 +0300
Message-Id: <d506dc87b97659f08c65d3bb470b1b7bfd789759.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/13] 9p: drop unused declaration from coth.h
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
X-List-Received-Date: Wed, 18 May 2016 12:14:27 -0000

From: Greg Kurz <gkurz@linux.vnet.ibm.com>

Commit "ebac1202c95a virtio-9p: use QEMU thread pool" dropped function
v9fs_init_worker_threads.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/coth.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index 209fc6a..a911cbb 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -47,7 +47,6 @@
     } while (0)
 
 extern void co_run_in_worker_bh(void *);
-extern int v9fs_init_worker_threads(void);
 extern int v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
 extern int v9fs_co_readdir_r(V9fsPDU *, V9fsFidState *,
                            struct dirent *, struct dirent **result);
-- 
2.1.4


