Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjQV1-0003IM-IE
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 06:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjQUv-0003AW-AT
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 06:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjQUq-00057q-I5
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 06:29:01 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:62029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjQUg-00055J-6J; Wed, 29 Oct 2014 06:28:46 -0400
Received: from 172.24.2.119 (EHLO szxeml404-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDP65060; Wed, 29 Oct 2014 18:28:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml404-hub.china.huawei.com
	(10.82.67.59) with Microsoft SMTP Server id 14.3.158.1; Wed, 29 Oct 2014
	18:28:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 29 Oct 2014 18:28:20 +0800
Message-ID: <1414578500-10048-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	weidong.huang@huawei.com, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] dump: fix use-after-free for s->fd
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
X-List-Received-Date: Wed, 29 Oct 2014 10:29:06 -0000

From: Gonglei <arei.gonglei@huawei.com>

After commit 4c7e251a (), when dump memory completed,
the s->fd will be closed twice. We should return
directly when dump completed.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 dump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dump.c b/dump.c
index 06a4915..9d9a409 100644
--- a/dump.c
+++ b/dump.c
@@ -626,6 +626,7 @@ static void dump_iterate(DumpState *s, Error **errp)
         ret = get_next_block(s, block);
         if (ret == 1) {
             dump_completed(s);
+            return;
         }
     }
 }
-- 
1.7.12.4



