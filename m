Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm8ad-0006yp-N9
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 14:12:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aY-0006fm-9v
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aX-0002Mx-13
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:12:10 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:40569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1Qm8aW-0002Mq-Oz; Wed, 27 Jul 2011 14:12:08 -0400
Received: by wyf28 with SMTP id 28so1344394wyf.4
	for <multiple recipients>; Wed, 27 Jul 2011 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cboRRDCJ2c0CzYVL9M9W1ZdH91Z1NOfa+mbg27XDJls=;
	b=BVBNl+PJ/x7hlEVGCxUZ3CZItSJw2O2yILa6B6QlTzuJlIcOFnvCivN5uama2OFDOi
	bzD/Oo2nciU4MQN6d2gz+M7YZbIJ277DGmNVmgE1/m7B7YGMokzcxD13FZn+ys/5CnqR
	iQu2ZmbmNB0v0ZPNAuDQf5RuopXcIBw0AHrN8=
Received: by 10.216.137.215 with SMTP id y65mr81821wei.74.1311790327891;
	Wed, 27 Jul 2011 11:12:07 -0700 (PDT)
Received: from obol602.localdomain (net-2-37-106-50.cust.dsl.vodafone.it
	[2.37.106.50])
	by mx.google.com with ESMTPS id fn12sm108836wbb.38.2011.07.27.11.11.52
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 11:11:57 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2011 20:12:01 +0200
Message-Id: <1311790322-10889-3-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
References: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/3] block: typo fix
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
X-List-Received-Date: Wed, 27 Jul 2011 18:12:13 -0000


Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 block/raw-posix.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/raw-posix.c b/block/raw-posix.c
index cd89c83..275b41e 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -587,7 +587,7 @@ static BlockDriverAIOCB *raw_aio_submit(BlockDriverState *bs,
 
     /*
      * If O_DIRECT is used the buffer needs to be aligned on a sector
-     * boundary.  Check if this is the case or telll the low-level
+     * boundary.  Check if this is the case or tell the low-level
      * driver that it needs to copy the buffer.
      */
     if (s->aligned_buf) {
-- 
1.7.1


