Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWczX-0001tY-Jt
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 23:43:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWczV-0001tP-FX
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 23:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWczS-0008IJ-5e
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 23:43:57 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:31754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWczR-0008Gl-Fr; Fri, 13 Mar 2015 23:43:54 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKT79702; Sat, 14 Mar 2015 11:37:17 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 14 Mar 2015 11:37:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 14 Mar 2015 11:30:25 +0800
Message-ID: <1426303825-9040-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com,
	zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] qga/commands-posix: Fix resource leak
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
X-List-Received-Date: Sat, 14 Mar 2015 03:43:58 -0000

It's detected by coverity. Close the dirfd.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 qga/commands-posix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d5bb5cb..cbf1c80 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2285,6 +2285,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
     if (local_err) {
         g_free(buf);
+        close(dirfd);
         error_propagate(errp, local_err);
         return NULL;
     }
@@ -2293,6 +2294,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     info->size = strtol(buf, NULL, 16); /* the unit is bytes */
 
     g_free(buf);
+    close(dirfd);
 
     return info;
 }
-- 
1.8.3.1



