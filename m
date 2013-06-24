Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rp-0004uO-36
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rb-0004MH-F3
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0RV-000721-Tm
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RS-0006xC-Ku; Mon, 24 Jun 2013 02:39:58 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dwqU011838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:58 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dvYW021474; Mon, 24 Jun 2013 02:39:57 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id A82BC41647; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:44 +0200
Message-Id: <1372055996-4072-2-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 01/13] qemu-socket: zero-initialize
	SocketAddress
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
 util/qemu-sockets.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 96eca2a..86fb09c 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -848,9 +848,9 @@ int unix_nonblocking_connect(const char *path,
 
 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-    SocketAddress *addr = NULL;
+    SocketAddress *addr;
 
-    addr = g_new(SocketAddress, 1);
+    addr = g_new0(SocketAddress, 1);
     if (strstart(str, "unix:", NULL)) {
         if (str[5] == '\0') {
             error_setg(errp, "invalid Unix socket address");
-- 
1.7.9.7


