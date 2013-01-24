Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyR8R-0001HX-0p
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2013 13:02:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyR8J-0000vr-2c
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 13:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TyR8A-0008Tx-Ef
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 13:02:39 -0500
Received: from mail-pb0-f54.google.com ([209.85.160.54]:36553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>)
	id 1TyR7w-0008S9-Tf; Thu, 24 Jan 2013 13:02:17 -0500
Received: by mail-pb0-f54.google.com with SMTP id rr4so3754178pbb.41
	for <multiple recipients>; Thu, 24 Jan 2013 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=HkZoMm5U+rx9jQjIHjxUlU6dQkBWpz+0oNxEmFaYCLk=;
	b=YJBCJwhfrOujsIMtRJGrYYTCY0pZv80OGKiXGzWD41fN2JZKq2SNnhne1nlLwM3M9S
	PopcuGckm1ZLp7FuXXXZqY8mRvApBhJtrMTdpXoORsHwAAyQ/wF9uDDL/GSixhBQoaIX
	gM2bccvsHpmXZvI4WprlQDiPiE13NBoZevxeJCNCGo0qw1o3YYNboRuS9VvCzJnIn5CR
	ZmIVNarVvqicxYVNmJhak9ax4O5lKHfKbWoCVkYZGvIvQTtziXZDdpSaDZtht9i72J+O
	fR3CsTMxrFr7YrqiZv6OE/17wMDSKKRmiCtgipUhQJZa7IzdYGCGdIibTCBb6FbZHiaO
	pImQ==
X-Received: by 10.68.135.40 with SMTP id pp8mr7247222pbb.63.1359050535961;
	Thu, 24 Jan 2013 10:02:15 -0800 (PST)
Received: from localhost.localdomain
	(108-71-89-7.lightspeed.sntcca.sbcglobal.net. [108.71.89.7])
	by mx.google.com with ESMTPS id qt3sm15256963pbb.32.2013.01.24.10.02.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 10:02:15 -0800 (PST)
From: Vishvananda Ishaya <vishvananda@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2013 10:02:08 -0800
Message-Id: <1359050528-52668-1-git-send-email-vishvananda@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.54
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Vishvananda Ishaya <vishvananda@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: Fix is_allocated_above with resized
	files
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
X-List-Received-Date: Thu, 24 Jan 2013 18:02:44 -0000

In an image chain, if the base image is smaller than the current
image, we need to make sure to use the current images count of
unallocated blocks once we get to the end of the base image. Without
this change the code will return 0 blocks when it gets to the end
of the base image and mirror_run will fail its assertion.

Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
---
Fixes https://bugs.launchpad.net/qemu/+bug/1103868

 block.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 6fa7c90..6474d9e 100644
--- a/block.c
+++ b/block.c
@@ -2831,7 +2831,9 @@ int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
          *
          * [sector_num+x, nr_sectors] allocated.
          */
-        if (n > pnum_inter) {
+        if (n > pnum_inter &&
+            (intermediate == top ||
+             sector_num + pnum_inter < intermediate->total_sectors)) {
             n = pnum_inter;
         }
 
-- 
1.7.9.5


