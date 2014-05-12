Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk098-0005AH-91
	for mharc-qemu-trivial@gnu.org; Mon, 12 May 2014 20:00:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wjzl5-0000Hd-TA
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 19:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wjzkz-0007Dn-RA
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 19:35:47 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:39249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wjzkl-00077W-BG; Mon, 12 May 2014 19:35:27 -0400
Received: by mail-wg0-f41.google.com with SMTP id z12so7722205wgg.24
	for <multiple recipients>; Mon, 12 May 2014 16:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hs9UeCcl9cFKGvBXpywxynEylMtLNCGrC8m5YZ99fqI=;
	b=WvdiQimrxuXQh5OX6lF4o273T9Y35lDDdmne6biyoSqond7wII6ms8+KFgXzsJ4a1P
	jnH/d42dYBLk6Qg2x8XXjBAGOeGLyAfjdEcDw+q6sMn5SoH7j1kZE4fEortQPm6WXxrY
	fSh/ooZbx3btqXgupenEFcLlB2qfY6EsiSvKnqr7Go0MW5bEiN8MzJt2Leagom5b2DBY
	4+K/VwkM9Upfm+gqoG7595v8B7e/DkVcWO1gQJgxnd60EVb5uNzUE5Sn/ROnm9sFPZzu
	2fdRCfKRfiLamQJx8grY94FxyUG+Bztt9cf6iWDC7hpJz6lKzqjFSAri/TcWNKM1I/vX
	pE1A==
X-Received: by 10.181.13.137 with SMTP id ey9mr17760492wid.54.1399937726314;
	Mon, 12 May 2014 16:35:26 -0700 (PDT)
Received: from localhost.localdomain ([41.103.114.211])
	by mx.google.com with ESMTPSA id
	pj5sm18659355wic.20.2014.05.12.16.35.24 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 16:35:25 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 May 2014 00:35:16 +0100
Message-Id: <1399937716-6086-2-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
References: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kwolf@redhat.com,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] nbd: Miscellaneous typo fixes.
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
X-List-Received-Date: Tue, 13 May 2014 00:00:35 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 nbd.c         | 2 +-
 qemu-nbd.c    | 2 +-
 qemu-nbd.texi | 2 +-
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
1.8.3.2


