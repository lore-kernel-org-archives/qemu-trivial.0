Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUy5K-0003m2-5N
	for mharc-qemu-trivial@gnu.org; Sun, 04 Nov 2012 06:09:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUy5G-0003br-MU
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 06:09:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUy5F-0003jx-F2
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 06:09:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TUy5C-0003j3-Uh; Sun, 04 Nov 2012 06:09:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	543C3728002F; Sun,  4 Nov 2012 12:09:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qC7xQNJ3Ysmw; Sun,  4 Nov 2012 12:09:35 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 66B2D728003A; Sun,  4 Nov 2012 12:09:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  4 Nov 2012 12:09:34 +0100
Message-Id: <1352027374-30796-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block: Workaround for older versions of
	MinGW gcc
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
X-List-Received-Date: Sun, 04 Nov 2012 11:09:44 -0000

Versions before gcc-4.6 don't support unnamed fields in initializers
(see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10676).

Offset and OffsetHigh belong to an unnamed struct which is part of an
unnamed union. Therefore the original code does not work with older
versions of gcc.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is needed for Debian's amd64-mingw32msvc-gcc-4.4.4
which I use for MinGW-w64 cross compilation.

Regards
Stefan W.

 block/win32-aio.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/win32-aio.c b/block/win32-aio.c
index c34dc73..92f25a9 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -167,11 +167,11 @@ BlockDriverAIOCB *win32_aio_submit(BlockDriverState *bs,
         waiocb->is_linear = true;
     }
 
-    waiocb->ov = (OVERLAPPED) {
-        .Offset = (DWORD) offset,
-        .OffsetHigh = (DWORD) (offset >> 32),
-        .hEvent = event_notifier_get_handle(&aio->e)
-    };
+    memset(&waiocb->ov, 0, sizeof(waiocb->ov));
+    waiocb->ov.Offset = (DWORD)offset;
+    waiocb->ov.OffsetHigh = (DWORD)(offset >> 32);
+    waiocb->ov.hEvent = event_notifier_get_handle(&aio->e);
+
     aio->count++;
 
     if (type & QEMU_AIO_READ) {
-- 
1.7.10.4


