Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDId-0005tU-BF
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:17:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIa-0005l8-TG
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIa-0007Jk-07
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:17:56 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:61941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RGDIT-00078p-7a; Tue, 18 Oct 2011 13:17:49 -0400
Received: by mail-bw0-f45.google.com with SMTP id t2so1174951bka.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Qk77+9//sEw9LkAcCtai7dFRqlRk2NQvG+wcgckyyBM=;
	b=ZzbawOquKqSan7p0LCmW+raA/LpKnX1qGNmNcDIeuMfHK0Ppu9UDXV/nSQeqFDJ3kw
	cMY/vPC4Gglukqu1fUWYpeCgxQ/prZp+YWpaxsPtgkPShyDqca1gjo9oRkwROue5aDPZ
	SdVTy95PkqyFA9q2+OiHNdlhG30CBkv2EjR/U=
Received: by 10.204.34.75 with SMTP id k11mr2492701bkd.68.1318958268710;
	Tue, 18 Oct 2011 10:17:48 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-3-205.pppoe.mtu-net.ru.
	[83.237.3.205])
	by mx.google.com with ESMTPS id j9sm2938797bkd.2.2011.10.18.10.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:17:47 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Oct 2011 21:17:35 +0400
Message-Id: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qed: don't pass NULL to memcpy
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
X-List-Received-Date: Tue, 18 Oct 2011 17:17:57 -0000

Spotted by Clang Analyzer

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
 block/qed.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index c3e45af..e6720db 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1424,8 +1424,10 @@ static int bdrv_qed_change_backing_file(BlockDriverState *bs,
     memcpy(buffer, &le_header, sizeof(le_header));
     buffer_len = sizeof(le_header);
 
-    memcpy(buffer + buffer_len, backing_file, backing_file_len);
-    buffer_len += backing_file_len;
+    if (backing_file) {
+        memcpy(buffer + buffer_len, backing_file, backing_file_len);
+        buffer_len += backing_file_len;
+    }
 
     /* Write new header */
     ret = bdrv_pwrite_sync(bs->file, 0, buffer, buffer_len);
-- 
1.7.0.4


