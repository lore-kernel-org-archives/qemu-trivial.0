Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm8ad-0006zT-RI
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 14:12:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aa-0006pZ-W8
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:12:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aZ-0002NJ-Sf
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:12:12 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:40569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1Qm8aZ-0002Mq-E9; Wed, 27 Jul 2011 14:12:11 -0400
Received: by mail-wy0-f173.google.com with SMTP id 28so1344394wyf.4
	for <multiple recipients>; Wed, 27 Jul 2011 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=24xrfOD3B/snXPHgWUAlAVlJXW9qdomddKRpj42zUQ4=;
	b=KmlMDTp2tfRduoTIlV2R7Q/d+emtB78O8BJWW5sk9aRDGZsD21z0SMXTKw6h19dH49
	NUduOmjvXQ/AATm7Nkm8AXpbiusJnWm8QQH0c/TdR/R4+DyjBTb+2CD8+RuTU9eSMP7z
	X7iZsIkgDC1WyNj93njlLc4mSrCdnegAT6MkQ=
Received: by 10.227.174.201 with SMTP id u9mr96845wbz.53.1311790330861;
	Wed, 27 Jul 2011 11:12:10 -0700 (PDT)
Received: from obol602.localdomain (net-2-37-106-50.cust.dsl.vodafone.it
	[2.37.106.50])
	by mx.google.com with ESMTPS id fn12sm108836wbb.38.2011.07.27.11.12.07
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 11:12:09 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2011 20:12:02 +0200
Message-Id: <1311790322-10889-4-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
References: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/3] aio: always check paio_init result
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
X-List-Received-Date: Wed, 27 Jul 2011 18:12:14 -0000


Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 block/raw-posix.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/raw-posix.c b/block/raw-posix.c
index 275b41e..3c6bd4b 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -230,13 +230,15 @@ static int raw_open_common(BlockDriverState *bs, const char *filename,
         }
     }
 
+    /* We're falling back to POSIX AIO in some cases so init always */
+    if (paio_init() < 0) {
+        goto out_free_buf;
+    }
+
 #ifdef CONFIG_LINUX_AIO
     if ((bdrv_flags & (BDRV_O_NOCACHE|BDRV_O_NATIVE_AIO)) ==
                       (BDRV_O_NOCACHE|BDRV_O_NATIVE_AIO)) {
 
-        /* We're falling back to POSIX AIO in some cases */
-        paio_init();
-
         s->aio_ctx = laio_init();
         if (!s->aio_ctx) {
             goto out_free_buf;
@@ -245,9 +247,6 @@ static int raw_open_common(BlockDriverState *bs, const char *filename,
     } else
 #endif
     {
-        if (paio_init() < 0) {
-            goto out_free_buf;
-        }
 #ifdef CONFIG_LINUX_AIO
         s->use_aio = 0;
 #endif
-- 
1.7.1


