Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqKk-00055r-Jz
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-000509-Pp
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-0008Qt-14
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqKd-0008Mk-Uw; Thu, 11 Feb 2016 07:26:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DD3324146B;
	Thu, 11 Feb 2016 15:26:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BDDD0AB6;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: (nullmailer pid 11175 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:51 +0300
Message-Id: <b8d8e8fde3a442d4cf5c95cb4598b8dcb87b9b3d.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Christophe Fergeau <cfergeau@redhat.com>
Subject: [Qemu-trivial] [PULL 02/14] man: virtfs-proxy-helper: Rework
	awkward sentence
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
X-List-Received-Date: Thu, 11 Feb 2016 12:26:52 -0000

From: Christophe Fergeau <cfergeau@redhat.com>

There was a 'capbilities' typo in this man page. This commit
reformulates the sentence the typo was in to make it easier to grasp.
This is based on a suggestion from Eric Blake.

Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtfs-proxy-helper.texi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index 9a25d7e..6eb2d50 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -28,8 +28,8 @@ QEMU and proxy helper communicate using this socket. QEMU proxy fs
 driver sends filesystem request to proxy helper and receives the
 response from it.
 
-Proxy helper is designed so that it can drop the root privilege with
-retaining capbilities needed for doing filesystem operations only.
+The proxy helper is designed so that it can drop root privileges except
+for the capabilities needed for doing filesystem operations.
 
 @end table
 @c man end
-- 
2.1.4


