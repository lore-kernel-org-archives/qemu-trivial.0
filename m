Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6KTQ-0001cj-Rq
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:56:16 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTK-0001Ge-Mo
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTJ-0003zU-3g
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:10 -0400
Received: from nog.sh.bytemark.co.uk ([212.110.161.168]:57447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTG-0003xY-Ia; Wed, 21 Sep 2011 06:56:06 -0400
Received: from bytemail.bytemark.co.uk ([212.110.161.227])
	by nog.sh.bytemark.co.uk with esmtp (Exim 4.69)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTC-00023H-AZ; Wed, 21 Sep 2011 11:56:02 +0100
Received: from desk4.office.bytemark.co.uk ([89.16.168.152]
	helo=localhost.localdomain)
	by bytemail.bytemark.co.uk with esmtp (Exim 4.72)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTC-0004WD-0N; Wed, 21 Sep 2011 11:56:02 +0100
From: nick@bytemark.co.uk
To: nick@bytemark.co.uk,
	qemu-devel@nongnu.org
Date: Wed, 21 Sep 2011 11:55:49 +0100
Message-Id: <1316602550-13597-2-git-send-email-nick@bytemark.co.uk>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
References: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
Organization: Bytemark Computer Consulting Ltd.  The Raylor Centre,
	James Street, York YO10 3DW,
	UK. Company registered in England and Wales no. 4484629. VAT
	registration no. GB 804 6718 29.
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.110.161.168
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] block/curl: Implement a flush function
	on the fd handlers
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
X-List-Received-Date: Wed, 21 Sep 2011 10:56:13 -0000

From: Nick Thomas <nick@bytemark.co.uk>

Signed-off-by: Nick Thomas <nick@bytemark.co.uk>
---
 block/curl.c |   26 ++++++++++++++++++++++----
 1 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index f3f61cc..21fed93 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -76,6 +76,7 @@ typedef struct BDRVCURLState {
 
 static void curl_clean_state(CURLState *s);
 static void curl_multi_do(void *arg);
+static int curl_aio_flush(void *opaque);
 
 static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
                         void *s, void *sp)
@@ -83,14 +84,16 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
     switch (action) {
         case CURL_POLL_IN:
-            qemu_aio_set_fd_handler(fd, curl_multi_do, NULL, NULL, NULL, s);
+            qemu_aio_set_fd_handler(fd, curl_multi_do, NULL, curl_aio_flush,
+                                    NULL, s);
             break;
         case CURL_POLL_OUT:
-            qemu_aio_set_fd_handler(fd, NULL, curl_multi_do, NULL, NULL, s);
+            qemu_aio_set_fd_handler(fd, NULL, curl_multi_do, curl_aio_flush,
+                                    NULL, s);
             break;
         case CURL_POLL_INOUT:
-            qemu_aio_set_fd_handler(fd, curl_multi_do,
-                                    curl_multi_do, NULL, NULL, s);
+            qemu_aio_set_fd_handler(fd, curl_multi_do, curl_multi_do,
+                                    curl_aio_flush, NULL, s);
             break;
         case CURL_POLL_REMOVE:
             qemu_aio_set_fd_handler(fd, NULL, NULL, NULL, NULL, NULL);
@@ -412,6 +415,21 @@ out_noclean:
     return -EINVAL;
 }
 
+static int curl_aio_flush(void *opaque)
+{
+    BDRVCURLState *s = opaque;
+    int i, j;
+
+    for (i=0; i < CURL_NUM_STATES; i++) {
+        for(j=0; j < CURL_NUM_ACB; j++) {
+            if (s->states[i].acb[j]) {
+                return 1;
+            }
+        }
+    }
+    return 0;
+}
+
 static void curl_aio_cancel(BlockDriverAIOCB *blockacb)
 {
     // Do we have to implement canceling? Seems to work without...
-- 
1.7.0.4


