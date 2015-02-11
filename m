Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOff-0003sH-GY
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:13:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfR-0003Y2-4z
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfI-0004DY-To
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:49 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:23262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOfI-0004Bi-BD; Tue, 10 Feb 2015 23:12:40 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHD48408; Wed, 11 Feb 2015 12:12:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:05 +0800
Message-ID: <1423627934-11676-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 02/11] a9gtimer: remove superfluous '\n'
	around error_setg
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
X-List-Received-Date: Wed, 11 Feb 2015 04:12:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/timer/a9gtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 435142a..b087bbd 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -289,7 +289,7 @@ static void a9_gtimer_realize(DeviceState *dev, Error **errp)
     int i;
 
     if (s->num_cpu < 1 || s->num_cpu > A9_GTIMER_MAX_CPUS) {
-        error_setg(errp, "%s: num-cpu must be between 1 and %d\n",
+        error_setg(errp, "%s: num-cpu must be between 1 and %d",
                    __func__, A9_GTIMER_MAX_CPUS);
         return;
     }
-- 
1.7.12.4



