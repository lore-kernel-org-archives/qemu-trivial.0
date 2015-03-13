Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPrE-0000nD-74
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWIVF-0007h9-L0
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWIVE-0000Oq-OI
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:51:21 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:61984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWIV5-0000Fa-BY; Fri, 13 Mar 2015 01:51:12 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIK83421; Fri, 13 Mar 2015 13:50:18 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 13 Mar 2015 13:50:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 13 Mar 2015 13:48:07 +0800
Message-ID: <1426225687-12104-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Fri, 13 Mar 2015 09:42:30 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, pbonzini@redhat.com,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-posix-acl: Fix
	out-of-bounds access
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
X-List-Received-Date: Fri, 13 Mar 2015 05:51:22 -0000

It's detected by coverity. Fix out-of-bounds access of the function mp_dacl_listxattr.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/9pfs/virtio-9p-posix-acl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-posix-acl.c b/hw/9pfs/virtio-9p-posix-acl.c
index 803d9d9..09dad07 100644
--- a/hw/9pfs/virtio-9p-posix-acl.c
+++ b/hw/9pfs/virtio-9p-posix-acl.c
@@ -114,7 +114,7 @@ static ssize_t mp_dacl_listxattr(FsContext *ctx, const char *path,
     }
 
     /* len includes the trailing NUL */
-    memcpy(value, ACL_ACCESS, len);
+    memcpy(value, ACL_DEFAULT, len);
     return 0;
 }
 
-- 
1.8.3.1



