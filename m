Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Ro-0004t6-Li
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rd-0004QQ-C1
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Ra-0007E1-1p
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RS-0006xG-MR; Mon, 24 Jun 2013 02:39:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dwAW010290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:58 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dvMX016987; Mon, 24 Jun 2013 02:39:57 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id C3FCE4169C; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:46 +0200
Message-Id: <1372055996-4072-4-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 03/13] qemu-socket: catch monitor_get_fd
	failures
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:12 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/qemu-sockets.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 35023a8..126cbb6 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -903,7 +903,7 @@ int socket_connect(SocketAddress *addr, Error **errp,
 
     case SOCKET_ADDRESS_KIND_FD:
         fd = monitor_get_fd(cur_mon, addr->fd->str, errp);
-        if (callback) {
+        if (fd >= 0 && callback) {
             qemu_set_nonblock(fd);
             callback(fd, opaque);
         }
-- 
1.7.9.7


