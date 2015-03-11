Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVbtq-0006Qq-8Y
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 04:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbtl-0006Gv-A7
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbtk-00074T-74
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:49 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YVbth-0006zB-Oa; Wed, 11 Mar 2015 04:21:46 -0400
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CII61954; Wed, 11 Mar 2015 16:21:24 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Mar 2015 16:21:12 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Mar 2015 16:21:01 +0800
Message-ID: <1426062061-12128-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
References: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] vnc: avoid possible file handler leak
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
X-List-Received-Date: Wed, 11 Mar 2015 08:21:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

vs->lsock may equal to 0, modify the check condition,
avoid possible vs->lsock leak.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 10a2724..259eca2 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3641,7 +3641,7 @@ void vnc_display_open(const char *id, Error **errp)
                 }
 
                 if (vs->lwebsock < 0) {
-                    if (vs->lsock) {
+                    if (vs->lsock != -1) {
                         close(vs->lsock);
                         vs->lsock = -1;
                     }
-- 
1.7.12.4



