Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdMx-00052X-6v
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:07:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMu-0004vg-80
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMp-0004Ti-9G
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:28 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:7665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YRdMo-0004TN-Uc; Sat, 28 Feb 2015 04:07:23 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHU78974; Sat, 28 Feb 2015 17:07:21 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:07:13 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 17:05:27 +0800
Message-ID: <1425114327-12136-6-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	eblake@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH RFC 5/5] savevm: Replace error_report() &
	error_free() with error_report_err()
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
X-List-Received-Date: Sat, 28 Feb 2015 09:07:29 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 savevm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/savevm.c b/savevm.c
index ce2b6a2..c4f8c39 100644
--- a/savevm.c
+++ b/savevm.c
@@ -932,8 +932,7 @@ int qemu_loadvm_state(QEMUFile *f)
     int ret;
 
     if (qemu_savevm_state_blocked(&local_err)) {
-        error_report("%s", error_get_pretty(local_err));
-        error_free(local_err);
+        error_report_err(local_err);
         return -EINVAL;
     }
 
-- 
1.7.12.4



