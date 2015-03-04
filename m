Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTDNm-0000k0-7F
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:46:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNf-0000TS-EO
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNb-0004HM-BZ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTDNS-0004CW-7w; Wed, 04 Mar 2015 12:46:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AAC92408AF;
	Wed,  4 Mar 2015 20:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 70DAC94E;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17579 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:07:04 +0300
Message-Id: <6212a2aeae17a1452e37af11e9938feea098404b.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 47/47] 9pfs: remove useless return
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
X-List-Received-Date: Wed, 04 Mar 2015 17:46:52 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-local.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index a183eee..d05c917 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -332,7 +332,6 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
             tsize = read(fd, (void *)buf, bufsz);
         } while (tsize == -1 && errno == EINTR);
         close(fd);
-        return tsize;
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         buffer = rpath(fs_ctx, path);
-- 
2.1.4


