Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWbPq-0007Kp-2X
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 22:03:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWbPo-0007JI-AO
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 22:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWbPn-0002S6-Gy
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 22:03:00 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:15918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWbPi-0002QQ-Gu; Fri, 13 Mar 2015 22:02:55 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKT74269; Sat, 14 Mar 2015 09:59:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 14 Mar 2015 09:59:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 14 Mar 2015 09:59:13 +0800
Message-ID: <1426298353-8628-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, pbonzini@redhat.com,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2] hw/9pfs/virtio-9p-proxy: Fix possible
	overflow
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
X-List-Received-Date: Sat, 14 Mar 2015 02:03:01 -0000

It's detected by coverity. As max of sockaddr_un.sun_path is
sizeof(helper.sun_path), should check the length of source
and use strncpy instead of strcpy.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
    v1->v2: Still use strcpy [Paolo]
---
 hw/9pfs/virtio-9p-proxy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 59c7445..5ebfaf6 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1102,6 +1102,7 @@ static int connect_namedsocket(const char *path)
     int sockfd, size;
     struct sockaddr_un helper;
 
+    g_assert(strlen(path) < sizeof(helper.sun_path));
     sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sockfd < 0) {
         fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
-- 
1.8.3.1



