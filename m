Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csXqX-0006DW-JB
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2017 12:50:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1csXqV-0006C6-EY
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 12:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1csXqU-0007Rk-I8
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 12:50:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56180)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1csXqO-0007Pm-6n; Mon, 27 Mar 2017 12:50:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 656A285363;
	Mon, 27 Mar 2017 16:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 656A285363
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=stefanha@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 656A285363
Received: from localhost (unknown [10.36.118.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6E357D529;
	Mon, 27 Mar 2017 16:50:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	<qemu-block@nongnu.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 27 Mar 2017 17:50:05 +0100
Message-Id: <20170327165005.22038-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 27 Mar 2017 16:50:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] iscsi: drop unused IscsiAIOCB.qiov field
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Mar 2017 16:50:20 -0000

The IscsiAIOCB.qiov field has been unused since commit
063c3378a9e3c25cc0afac3c72e4823d0621e352 ("block/iscsi: introduce
bdrv_co_{readv, writev, flush_to_disk}") back in 2013.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/iscsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 75d8905..716e74a 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -103,7 +103,6 @@ typedef struct IscsiTask {
 
 typedef struct IscsiAIOCB {
     BlockAIOCB common;
-    QEMUIOVector *qiov;
     QEMUBH *bh;
     IscsiLun *iscsilun;
     struct scsi_task *task;
-- 
2.9.3


