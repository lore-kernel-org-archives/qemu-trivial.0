Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhN-0002e5-8R
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhI-0002Qt-7e
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhD-0007Wk-8y
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:38306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFhC-0007Vz-GC; Fri, 27 Feb 2015 02:50:51 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHS92345; Fri, 27 Feb 2015 15:50:36 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:26 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:11 +0800
Message-ID: <1425023419-12244-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 1/9] nbd: fix resource leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:57 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 2f3b9ad..b9955cb 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -273,6 +273,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      */
     sock = nbd_establish_connection(bs, errp);
     if (sock < 0) {
+        g_free(export);
         return sock;
     }
 
-- 
1.7.12.4



