Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YvGeQ-0000qd-Gz
	for mharc-qemu-trivial@gnu.org; Wed, 20 May 2015 22:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YvGeO-0000qV-Oz
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 22:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YvGeK-00084K-OW
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 22:56:00 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YvGeK-00083I-AP; Wed, 20 May 2015 22:55:56 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COD20403; Thu, 21 May 2015 10:54:54 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 21 May 2015 10:54:44 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 21 May 2015 10:54:35 +0800
Message-ID: <1432176875-5984-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH] qemu-error: make the timestamp more obvious
	and clear
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
X-List-Received-Date: Thu, 21 May 2015 02:56:01 -0000

From: Gonglei <arei.gonglei@huawei.com>

before:
   (qemu) 2015-05-21T02:07:43.695065Z qemu-system-x86_64: test....
after applying this patch:
   (qemu) [2015-05-21T02:21:46.023619Z UTC] qemu-system-x86_64: test....

Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/qemu-error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-error.c b/util/qemu-error.c
index 9bba5f5..0b91cbc 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -212,7 +212,7 @@ void error_vreport(const char *fmt, va_list ap)
     if (enable_timestamp_msg) {
         g_get_current_time(&tv);
         timestr = g_time_val_to_iso8601(&tv);
-        error_printf("%s ", timestr);
+        error_printf("[%s UTC] ", timestr);
         g_free(timestr);
     }
 
-- 
1.7.12.4



