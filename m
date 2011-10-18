Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDJQ-0007He-7c
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:18:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDJM-000758-8t
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDJK-0007XX-C2
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:18:44 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:61941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RGDJE-00078p-Ez; Tue, 18 Oct 2011 13:18:36 -0400
Received: by mail-bw0-f45.google.com with SMTP id t2so1174951bka.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=P87Eke4UpF7wC8CLuQPUd1c5wPDCSDnjzzn8fjx8bTc=;
	b=c25HuxsteLhFYfttnZLLau6nWfyNcP4jGFUrDHcfxQsHLClU8A9Wt9TN3Y7yYwZgxb
	5GtA3FVrJ4ecsWp7sU3dkIUlcCnMi088MIcI+AjpGoAWBPv1a7bqkNAsWM1QlyOaswe7
	FmkzBdGycAD1y7xNki0ds0XvVzIhmURJ0Kcds=
Received: by 10.204.144.155 with SMTP id z27mr2522785bku.72.1318958315984;
	Tue, 18 Oct 2011 10:18:35 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-3-205.pppoe.mtu-net.ru.
	[83.237.3.205])
	by mx.google.com with ESMTPS id j9sm2941112bkd.2.2011.10.18.10.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:18:34 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Oct 2011 21:18:22 +0400
Message-Id: <1318958302-14091-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vmdk: remove unneeded variable assignment
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
X-List-Received-Date: Tue, 18 Oct 2011 17:18:45 -0000

Spotted by Clang Analyzer

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
 block/vmdk.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 5d16ec4..3969131 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1387,7 +1387,6 @@ static int vmdk_create(const char *filename, QEMUOptionParameter *options)
             bdrv_delete(bs);
             return -EINVAL;
         }
-        filesize = bdrv_getlength(bs);
         parent_cid = vmdk_read_cid(bs, 0);
         bdrv_delete(bs);
         relative_path(parent_filename, sizeof(parent_filename),
-- 
1.7.0.4


