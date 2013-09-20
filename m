Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4ei-0000qj-Gd
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4eb-0000ci-IU
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4eW-0003fu-Ku
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4eM-0003dx-DG; Fri, 20 Sep 2013 13:37:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 604F9419CD;
	Fri, 20 Sep 2013 21:37:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EB839511;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32183 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:09 +0400
Message-Id: <1379696296-32105-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 10/17] vscclient: remove unnecessary use of
	uninitialized variable
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
X-List-Received-Date: Fri, 20 Sep 2013 17:38:10 -0000

Signed-off-by: Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vscclient.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 5180d29..a3cb776 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -645,7 +645,6 @@ main(
     GIOChannel *channel_stdin;
     char *qemu_host;
     char *qemu_port;
-    VSCMsgHeader mhHeader;
 
     VCardEmulOptions *command_line_options = NULL;
 
@@ -754,7 +753,7 @@ main(
         .magic = VSCARD_MAGIC,
         .capabilities = {0}
     };
-    send_msg(VSC_Init, mhHeader.reader_id, &init, sizeof(init));
+    send_msg(VSC_Init, 0, &init, sizeof(init));
 
     g_main_loop_run(loop);
     g_main_loop_unref(loop);
-- 
1.7.10.4


