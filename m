Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWbO0-00063z-7a
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 22:01:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWbNx-0005pX-AU
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 22:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWbNw-00025u-HC
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 22:01:05 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:31654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWbNr-000243-Pp; Fri, 13 Mar 2015 22:01:00 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL68786; Sat, 14 Mar 2015 10:00:39 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 14 Mar 2015 10:00:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 14 Mar 2015 10:00:16 +0800
Message-ID: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, pbonzini@redhat.com,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2] fsdev/virtfs-proxy-helper: Fix possible
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
X-List-Received-Date: Sat, 14 Mar 2015 02:01:06 -0000

It's detected by coverity. As max of sockaddr_un.sun_path is
sizeof(helper.sun_path), should check the length of source
and use strncpy instead of strcpy.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
    v1->v2: Still use strcpy [Paolo]
---
 fsdev/virtfs-proxy-helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index bf2e5f3..13fe032 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
         return -1;
     }
 
+    g_assert(strlen(path) < sizeof(proxy.sun_path));
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
         do_perror("socket");
-- 
1.8.3.1



