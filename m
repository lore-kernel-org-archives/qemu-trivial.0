Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVX-0005eY-RP
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVU-0005V4-6u
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVT-0006Vc-DM
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:32 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:40055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVH-0006PC-KO; Tue, 24 Feb 2015 23:23:20 -0500
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ41228; Wed, 25 Feb 2015 12:23:14 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:07 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:28 +0800
Message-ID: <1424838157-5524-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 02/11] a9gtimer: remove superfluous '\n'
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:33 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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



