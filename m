Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RinBF-0005t1-2k
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2012 08:16:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RinBC-0005ss-Tf
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 08:16:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RinB7-0006Ks-9E
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 08:16:26 -0500
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:57122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RinB7-0006KF-28
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 08:16:21 -0500
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Thu, 5 Jan 2012 13:16:19 -0000
Received: from d06nrmr1707.portsmouth.uk.ibm.com ([9.149.39.225])
	by e06smtp13.uk.ibm.com ([192.168.101.143]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Thu, 5 Jan 2012 13:16:17 -0000
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q05DGGFx1859646; Thu, 5 Jan 2012 13:16:17 GMT
Received: from d06av05.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q05DGGVO030277; Thu, 5 Jan 2012 06:16:16 -0700
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q05DGG8h030274; Thu, 5 Jan 2012 06:16:16 -0700
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  5 Jan 2012 13:16:07 +0000
Message-Id: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
x-cbid: 12010513-2966-0000-0000-000002CD4C0D
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.109
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Dr David Alan Gilbert <davidagilbert@uk.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] qemu-nbd: drop loop which can never loop
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
X-List-Received-Date: Thu, 05 Jan 2012 13:16:27 -0000

For some reason nbd_client_thread() has a do..while loop which can never
loop, the condition is bogus because we would take a goto instead.  Drop
the loop.

Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 qemu-nbd.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 155b058..eb61c33 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -202,12 +202,10 @@ static void *nbd_client_thread(void *arg)
     int ret;
     pthread_t show_parts_thread;
 
-    do {
-        sock = unix_socket_outgoing(sockpath);
-        if (sock == -1) {
-            goto out;
-        }
-    } while (sock == -1);
+    sock = unix_socket_outgoing(sockpath);
+    if (sock == -1) {
+        goto out;
+    }
 
     ret = nbd_receive_negotiate(sock, NULL, &nbdflags,
                                 &size, &blocksize);
-- 
1.7.7.3


