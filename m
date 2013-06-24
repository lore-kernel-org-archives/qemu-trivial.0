Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rs-000521-8e
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Re-0004V1-Ur
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rb-0007H5-TS
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RU-0006yA-2R; Mon, 24 Jun 2013 02:40:00 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxIN002229
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O6dwmd002283; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 6091941AC9; Mon, 24 Jun 2013 08:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:56 +0200
Message-Id: <1372055996-4072-14-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 13/13] qemu-socket: don't leak opts on
	error
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
 util/qemu-sockets.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 126cbb6..095716e 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -963,7 +963,7 @@ int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp)
 
     default:
         error_setg(errp, "socket type unsupported for datagram");
-        return -1;
+        fd = -1;
     }
     qemu_opts_del(opts);
     return fd;
-- 
1.7.9.7


