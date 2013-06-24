Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rs-00052b-Ek
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Re-0004U9-Ks
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rb-0007Gu-Oy
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RT-0006xr-R5; Mon, 24 Jun 2013 02:39:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxEB002221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dwg6010913; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id E20784173E; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:48 +0200
Message-Id: <1372055996-4072-6-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 05/13] qemu-char: use more specific
	error_setg_* variants
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:18 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index ee7c70e..cfc68cd 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2604,7 +2604,7 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
 
     memset(&ss, 0, ss_len);
     if (getsockname(fd, (struct sockaddr *) &ss, &ss_len) != 0) {
-        error_setg(errp, "getsockname: %s", strerror(errno));
+        error_setg_errno(errp, errno, "getsockname");
         return NULL;
     }
 
@@ -3536,7 +3536,7 @@ static int qmp_chardev_open_file_source(char *src, int flags,
 
     TFR(fd = qemu_open(src, flags, 0666));
     if (fd == -1) {
-        error_setg(errp, "open %s: %s", src, strerror(errno));
+        error_setg_file_open(errp, errno, src);
     }
     return fd;
 }
-- 
1.7.9.7


