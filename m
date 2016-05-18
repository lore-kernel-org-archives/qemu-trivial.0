Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b31Iw-0007p3-IV
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 09:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b31Io-0007ja-OY
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b31Ik-000274-Eu
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 09:14:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b31Id-000253-8n; Wed, 18 May 2016 09:14:07 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7B44F41788;
	Wed, 18 May 2016 16:13:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8EBB1ADA;
	Wed, 18 May 2016 16:13:58 +0300 (MSK)
Received: (nullmailer pid 1348 invoked by uid 1000);
	Wed, 18 May 2016 13:13:58 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 16:13:57 +0300
Message-Id: <1463577237-1308-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial 1/2] qga: spelling fix
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
 qga/commands-posix.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 2ae3725..f0057f5 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1242,8 +1242,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
             goto error;
         }
 
-        /* we try to cull filesytems we know won't work in advance, but other
-         * filesytems may not implement fsfreeze for less obvious reasons.
+        /* we try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fsfreeze for less obvious reasons.
          * these will report EOPNOTSUPP. we simply ignore these when tallying
          * the number of frozen filesystems.
          *
@@ -1392,10 +1392,10 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
             continue;
         }
 
-        /* We try to cull filesytems we know won't work in advance, but other
-         * filesytems may not implement fstrim for less obvious reasons.  These
-         * will report EOPNOTSUPP; while in some other cases ENOTTY will be
-         * reported (e.g. CD-ROMs).
+        /* We try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fstrim for less obvious reasons.
+         * These will report EOPNOTSUPP; while in some other cases ENOTTY
+         * will be reported (e.g. CD-ROMs).
          * Any other error means an unexpected error.
          */
         r.start = 0;
-- 
2.1.4


