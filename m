Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWikZ-0000aY-EQ
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 05:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWikW-0000aO-Om
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWikS-0005Pc-ME
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:52:52 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:35224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWikS-0005Oo-6f; Sat, 14 Mar 2015 05:52:48 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL94439; Sat, 14 Mar 2015 17:52:33 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 14 Mar 2015 17:52:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 14 Mar 2015 17:52:15 +0800
Message-ID: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com,
	zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
	sw@weilnetz.de, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH v2] qga/commands-posix: Fix resource leak
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
X-List-Received-Date: Sat, 14 Mar 2015 09:52:53 -0000

It's detected by coverity. Close the dirfd.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
    v1->v2: close after use [Stefan Weil]
---
 qga/commands-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d5bb5cb..ba8de62 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2283,6 +2283,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
 
     buf = g_malloc0(20);
     ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
+    close(dirfd);
     if (local_err) {
         g_free(buf);
         error_propagate(errp, local_err);
-- 
1.8.3.1



