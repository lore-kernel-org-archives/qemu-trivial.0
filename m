Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPrE-0000oD-OA
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWNVp-0007Z6-Uw
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 07:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWNVm-0000hA-Jq
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 07:12:17 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:39997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWNVS-0000aC-NJ; Fri, 13 Mar 2015 07:11:55 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDB29917; Fri, 13 Mar 2015 19:10:24 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 13 Mar 2015 19:10:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 13 Mar 2015 19:09:57 +0800
Message-ID: <1426244997-11392-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5502C5A1.0209, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 55f7f5c8d7ea3768d6c7da5d359b1d51
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Fri, 13 Mar 2015 09:42:30 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, pbonzini@redhat.com,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH] fsdev/virtfs-proxy-helper: Fix possible
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
X-List-Received-Date: Fri, 13 Mar 2015 11:12:19 -0000

It's detected by coverity. As max of sockaddr_un.sun_path is
sizeof(helper.sun_path), should check the length of source
and use strncpy instead of strcpy.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 fsdev/virtfs-proxy-helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index bf2e5f3..f12d7a0 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
         return -1;
     }
 
+    g_assert(strlen(path) < sizeof(proxy.sun_path));
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
         do_perror("socket");
@@ -748,7 +749,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
     umask(7);
 
     proxy.sun_family = AF_UNIX;
-    strcpy(proxy.sun_path, path);
+    strncpy(proxy.sun_path, path, sizeof(proxy.sun_path));
     if (bind(sock, (struct sockaddr *)&proxy,
             sizeof(struct sockaddr_un)) < 0) {
         do_perror("bind");
-- 
1.8.3.1



