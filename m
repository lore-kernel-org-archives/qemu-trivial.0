Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVc-0002di-TK
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVX-0002Sx-90
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVS-0007nN-S3
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVJ-0007ih-GL; Thu, 19 Mar 2015 05:12:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AEEB841E47;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F14FC93E;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 373 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:42 +0300
Message-Id: <8ce1ee4618f4a557959f5a5731f6726b30416df5.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 24/24] qga/commands-posix: Fix resource leak
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:55 -0000

From: Shannon Zhao <zhaoshenglong@huawei.com>

It's detected by coverity. Close the dirfd.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


