Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqV-0000CE-PR
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqP-00004u-QC
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005PM-PH
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqJ-0005Jt-8P; Wed, 12 Jul 2017 09:38:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F0D8940F67;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 69C16AC8;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: (nullmailer pid 29034 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:37:58 +0300
Message-Id: <3bcf7d7df552c8bd4fdfe70b753f45169407cacb.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/13] util/qemu-sockets: Drop unused helper
 socket_address_to_string()
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:23 -0000

From: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>

Signed-off-by: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/sockets.h | 15 ---------------
 util/qemu-sockets.c    | 34 ----------------------------------
 2 files changed, 49 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 5c326db232..ef6b5591f7 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -106,21 +106,6 @@ SocketAddress *socket_local_address(int fd, Error **errp);
 SocketAddress *socket_remote_address(int fd, Error **errp);
 
 /**
- * socket_address_to_string:
- * @addr: the socket address struct
- * @errp: pointer to uninitialized error object
- *
- * Get the string representation of the socket
- * address. A pointer to the char array containing
- * string format will be returned, the caller is
- * required to release the returned value when no
- * longer required with g_free.
- *
- * Returns: the socket address in string format, or NULL on error
- */
-char *socket_address_to_string(struct SocketAddress *addr, Error **errp);
-
-/**
  * socket_address_flatten:
  * @addr: the socket address to flatten
  *
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index d3e51089de..55b6c17f5f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1325,40 +1325,6 @@ SocketAddress *socket_remote_address(int fd, Error **errp)
     return socket_sockaddr_to_address(&ss, sslen, errp);
 }
 
-char *socket_address_to_string(struct SocketAddress *addr, Error **errp)
-{
-    char *buf;
-    InetSocketAddress *inet;
-
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        inet = &addr->u.inet;
-        if (strchr(inet->host, ':') == NULL) {
-            buf = g_strdup_printf("%s:%s", inet->host, inet->port);
-        } else {
-            buf = g_strdup_printf("[%s]:%s", inet->host, inet->port);
-        }
-        break;
-
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        buf = g_strdup(addr->u.q_unix.path);
-        break;
-
-    case SOCKET_ADDRESS_TYPE_FD:
-        buf = g_strdup(addr->u.fd.str);
-        break;
-
-    case SOCKET_ADDRESS_TYPE_VSOCK:
-        buf = g_strdup_printf("%s:%s",
-                              addr->u.vsock.cid,
-                              addr->u.vsock.port);
-        break;
-
-    default:
-        abort();
-    }
-    return buf;
-}
 
 SocketAddress *socket_address_flatten(SocketAddressLegacy *addr_legacy)
 {
-- 
2.11.0


