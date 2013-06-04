Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjxmM-0001jd-Mz
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmG-0001WB-7P
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmA-0005u6-V8
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Ujxm1-0005ry-A9; Tue, 04 Jun 2013 16:24:05 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54KO41T010514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 16:24:04 -0400
Received: from garlic.sbx07344.newyony.wayport.net (vpn1-5-107.ams2.redhat.com
	[10.36.5.107])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54KNeZh022345; Tue, 4 Jun 2013 16:23:58 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Jun 2013 16:23:37 -0400
Message-Id: <1370377419-31788-3-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/5] libcacard/vscclient: fix leakage of
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
X-List-Received-Date: Tue, 04 Jun 2013 20:24:25 -0000

Spotted by Coverity.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 libcacard/vscclient.c | 9 +++++++--
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
1.8.2.1


