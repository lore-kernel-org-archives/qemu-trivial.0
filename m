Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THe2X-0001FU-FO
	for mharc-qemu-trivial@gnu.org; Fri, 28 Sep 2012 13:07:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THe2U-000183-KK
	for qemu-trivial@nongnu.org; Fri, 28 Sep 2012 13:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THe2T-00071U-IX
	for qemu-trivial@nongnu.org; Fri, 28 Sep 2012 13:07:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:52857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1THe2Q-0006y0-UI; Fri, 28 Sep 2012 13:07:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	180E5728003C; Fri, 28 Sep 2012 19:07:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1S5ZdmEx9I8w; Fri, 28 Sep 2012 19:07:40 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 79291728003D; Fri, 28 Sep 2012 19:07:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 28 Sep 2012 19:07:39 +0200
Message-Id: <1348852059-8678-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-sockets: Fix compiler warning
	(regression for MinGW)
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
X-List-Received-Date: Fri, 28 Sep 2012 17:07:48 -0000

setsockopt needs a type cast for MinGW. That type cast is missing in
a recent commit which results in a compiler warning.

Like for other socket related functions which have the same problem,
we add a 'qemu_setsockopt' macro which provides that type cast where
needed and use the new macro to avoid the warning.

A 'qemu_getsockopt' is also added and can be used for future
modifications.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-common.h  |   10 +++++++++-
 qemu-sockets.c |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index 4f0ed9e..14c5407 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -225,11 +225,19 @@ int qemu_pipe(int pipefd[2]);
 #endif
 
 #ifdef _WIN32
-/* MinGW needs a type cast for the 'buf' argument. */
+/* MinGW needs type casts for the 'buf' and 'optval' arguments. */
+#define qemu_getsockopt(sockfd, level, optname, optval, optlen) \
+    getsockopt(sockfd, level, optname, (void *)optval, optlen)
+#define qemu_setsockopt(sockfd, level, optname, optval, optlen) \
+    setsockopt(sockfd, level, optname, (const void *)optval, optlen)
 #define qemu_recv(sockfd, buf, len, flags) recv(sockfd, (void *)buf, len, flags)
 #define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
     sendto(sockfd, (const void *)buf, len, flags, destaddr, addrlen)
 #else
+#define qemu_getsockopt(sockfd, level, optname, optval, optlen) \
+    getsockopt(sockfd, level, optname, optval, optlen)
+#define qemu_setsockopt(sockfd, level, optname, optval, optlen) \
+    setsockopt(sockfd, level, optname, optval, optlen)
 #define qemu_recv(sockfd, buf, len, flags) recv(sockfd, buf, len, flags)
 #define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
     sendto(sockfd, buf, len, flags, destaddr, addrlen)
diff --git a/qemu-sockets.c b/qemu-sockets.c
index 1f14e8b..0f59490 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -282,7 +282,7 @@ static int inet_connect_addr(struct addrinfo *addr, bool *in_progress,
                 inet_strfamily(addr->ai_family), strerror(errno));
         return -1;
     }
-    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
+    qemu_setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
     if (connect_state != NULL) {
         socket_set_nonblock(sock);
     }
-- 
1.7.10


