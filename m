Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCjk-0004Jb-Hr
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCjb-0004Cj-4P
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:05:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCjX-0004yf-2A
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:05:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCjM-0004pE-Py; Wed, 04 Mar 2015 12:05:08 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BD10B4089A;
	Wed,  4 Mar 2015 20:05:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A945A722;
	Wed,  4 Mar 2015 20:05:05 +0300 (MSK)
Received: (nullmailer pid 17312 invoked by uid 1000);
	Wed, 04 Mar 2015 17:05:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Wed,  4 Mar 2015 20:05:04 +0300
Message-Id: <1425488704-17272-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] 9pfs: remove useless return
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
X-List-Received-Date: Wed, 04 Mar 2015 17:05:28 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-local.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index a183eee..d05c917 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -328,15 +328,14 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
         if (fd == -1) {
             return -1;
         }
         do {
             tsize = read(fd, (void *)buf, bufsz);
         } while (tsize == -1 && errno == EINTR);
         close(fd);
-        return tsize;
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         buffer = rpath(fs_ctx, path);
         tsize = readlink(buffer, buf, bufsz);
         g_free(buffer);
     }
     return tsize;
-- 
2.1.4


