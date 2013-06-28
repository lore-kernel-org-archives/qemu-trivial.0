Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdFB-000197-WE
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:18:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF6-0000w5-4f
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF4-000585-Bw
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdEz-00055X-Hk; Fri, 28 Jun 2013 14:17:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B793742BD0;
	Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 1C04556C; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:35 +0400
Message-Id: <1372443465-22384-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/14] qemu-char: check optional fields using
	has_*
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
X-List-Received-Date: Fri, 28 Jun 2013 18:17:58 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index a030e6b..a538217 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3493,7 +3493,7 @@ static CharDriverState *qmp_chardev_open_file(ChardevFile *file, Error **errp)
 {
     HANDLE out;
 
-    if (file->in) {
+    if (file->has_in) {
         error_setg(errp, "input file not supported");
         return NULL;
     }
@@ -3544,7 +3544,7 @@ static CharDriverState *qmp_chardev_open_file(ChardevFile *file, Error **errp)
         return NULL;
     }
 
-    if (file->in) {
+    if (file->has_in) {
         flags = O_RDONLY;
         in = qmp_chardev_open_file_source(file->in, flags, errp);
         if (error_is_set(errp)) {
-- 
1.7.10.4


