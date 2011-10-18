Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDJ2-0006kL-3W
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:18:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIv-0006QG-F9
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:18:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIt-0007M6-T5
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:18:17 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:61941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RGDIo-00078p-DZ; Tue, 18 Oct 2011 13:18:10 -0400
Received: by mail-bw0-f45.google.com with SMTP id t2so1174951bka.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=y3mSGrcC7/oKgIeJz/PqNVufqZTtQEuW8h/o6+6RQOU=;
	b=vOApeJxh8PH8Y2FOin2eUAkcAL/Ou+qWV2ShdJREkYreyFFEAX3YpdY8BoOXrSht6t
	04I9AnpWYiiK3PjeHpD/+oLhvH5qjhfPnnmZbsidlcAn+NyGWh2ujvMqk3mMNGur2YmZ
	SqlsJSKdYJPIWCoT04LeR7cQFRsfKpNPHJgZ4=
Received: by 10.204.129.193 with SMTP id p1mr2489964bks.19.1318958289977;
	Tue, 18 Oct 2011 10:18:09 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-3-205.pppoe.mtu-net.ru.
	[83.237.3.205])
	by mx.google.com with ESMTPS id j9sm2939801bkd.2.2011.10.18.10.18.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:18:08 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Oct 2011 21:17:56 +0400
Message-Id: <1318958276-14049-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qed: remove unneeded variable assignment
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
X-List-Received-Date: Tue, 18 Oct 2011 17:18:22 -0000

'ret' is unconditionally overwitten by qed_read_l1_table_sync()

Spotted by Clang Analyzer

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
 block/qed.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index e87dc4d..c3e45af 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -388,7 +388,6 @@ static int bdrv_qed_open(BlockDriverState *bs, int flags)
     if (ret < 0) {
         return ret;
     }
-    ret = 0; /* ret should always be 0 or -errno */
     qed_header_le_to_cpu(&le_header, &s->header);
 
     if (s->header.magic != QED_MAGIC) {
-- 
1.7.0.4


