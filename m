Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyjz-00065E-Lc
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjk-0005eH-Uv
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjh-0007m7-BE
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjb-0007iI-RY; Fri, 21 Jun 2013 06:38:28 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcR27031611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:27 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5LAcPaP026017; Fri, 21 Jun 2013 06:38:26 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 74CB64324C; Fri, 21 Jun 2013 12:38:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:14 +0200
Message-Id: <1371811105-730-3-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 02/13] qemu-socket: drop pointless allocation
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:42 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/qemu-sockets.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 364bd8c..d73c112 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -876,7 +876,6 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         }
     } else {
         addr->kind = SOCKET_ADDRESS_KIND_INET;
-        addr->inet = g_new(InetSocketAddress, 1);
         addr->inet = inet_parse(str, errp);
         if (addr->inet == NULL) {
             goto fail;
-- 
1.7.9.7


