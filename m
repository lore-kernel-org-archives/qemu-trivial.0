Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopD4-0005Rg-BG
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCy-0005Gm-C0
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCt-0007Ob-H8
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopCh-0007L1-Of; Mon, 26 May 2014 03:20:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E987E42FA5;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D8BF4651;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: (nullmailer pid 22994 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:52 +0400
Message-Id: <1401088811-22923-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hani Benhabiles <hani@linux.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>
Subject: [Qemu-trivial] [PULL 04/23] nbd: Miscellaneous typo fixes.
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
X-List-Received-Date: Mon, 26 May 2014 07:20:37 -0000

From: Hani Benhabiles <kroosec@gmail.com>

Signed-off-by: Hani Benhabiles <hani@linux.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 nbd.c         |    2 +-
 qemu-nbd.c    |    2 +-
 qemu-nbd.texi |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nbd.c b/nbd.c
index e5084b6..e0d032c 100644
--- a/nbd.c
+++ b/nbd.c
@@ -306,7 +306,7 @@ static int nbd_send_negotiate(NBDClient *client)
         [ 8 ..  15]   magic        (NBD_CLIENT_MAGIC)
         [16 ..  23]   size
         [24 ..  25]   server flags (0)
-        [24 ..  27]   export flags
+        [26 ..  27]   export flags
         [28 .. 151]   reserved     (0)
 
        Negotiation header with options, part 1:
diff --git a/qemu-nbd.c b/qemu-nbd.c
index f70e4b0..cd6bd50 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -294,7 +294,7 @@ static void *nbd_client_thread(void *arg)
     fd = open(device, O_RDWR);
     if (fd < 0) {
         /* Linux-only, we can use %m in printf.  */
-        fprintf(stderr, "Failed to open %s: %m", device);
+        fprintf(stderr, "Failed to open %s: %m\n", device);
         goto out_socket;
     }
 
diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 0a7e013..46fd483 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -15,7 +15,7 @@ Export QEMU disk image using NBD protocol.
 @item @var{filename}
  is a disk image filename
 @item -p, --port=@var{port}
-  port to listen on (default @samp{1024})
+  port to listen on (default @samp{10809})
 @item -o, --offset=@var{offset}
   offset into the image
 @item -b, --bind=@var{iface}
-- 
1.7.10.4


