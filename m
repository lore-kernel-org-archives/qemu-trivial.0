Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyk2-0006Bs-Mk
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjo-0005kL-7g
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjj-0007ng-MX
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjd-0007jE-6R; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcSt8031522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5LAcRIn024630; Fri, 21 Jun 2013 06:38:28 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 2B9444327A; Fri, 21 Jun 2013 12:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:25 +0200
Message-Id: <1371811105-730-14-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 13/13] qemu-socket: don't leak opts on error
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:45 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/qemu-sockets.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 7776016..29a3564 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -971,7 +971,7 @@ int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp)
 
     default:
         error_setg(errp, "socket type unsupported for datagram");
-        return -1;
+        fd = -1;
     }
     qemu_opts_del(opts);
     return fd;
-- 
1.7.9.7


