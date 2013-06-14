Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRjc-0000KF-L7
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 07:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRja-0000Jg-BK
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRjY-00075y-Co
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:59:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRjV-00075C-3l; Fri, 14 Jun 2013 06:59:53 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5E38541660;
	Fri, 14 Jun 2013 14:59:52 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 1678B525; Fri, 14 Jun 2013 14:50:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:38 +0400
Message-Id: <1371207042-17980-23-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alon Levy <alevy@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 22/26] libcacard/vscclient: fix leakage of
	socket on error paths
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
X-List-Received-Date: Fri, 14 Jun 2013 10:59:59 -0000

From: Alon Levy <alevy@redhat.com>

Spotted by Coverity.

Signed-off-by: Alon Levy <alevy@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vscclient.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index ac23647..5180d29 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -618,18 +618,22 @@ connect_to_qemu(
     if (ret != 0) {
         /* Error */
         fprintf(stderr, "getaddrinfo failed\n");
-        return -1;
+        goto cleanup_socket;
     }
 
     if (connect(sock, server->ai_addr, server->ai_addrlen) < 0) {
         /* Error */
         fprintf(stderr, "Could not connect\n");
-        return -1;
+        goto cleanup_socket;
     }
     if (verbose) {
         printf("Connected (sizeof Header=%zd)!\n", sizeof(VSCMsgHeader));
     }
     return sock;
+
+cleanup_socket:
+    closesocket(sock);
+    return -1;
 }
 
 int
@@ -759,5 +763,6 @@ main(
     g_io_channel_unref(channel_socket);
     g_byte_array_unref(socket_to_send);
 
+    closesocket(sock);
     return 0;
 }
-- 
1.7.10.4


