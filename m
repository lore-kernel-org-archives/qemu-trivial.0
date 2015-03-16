Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXJih-0008DC-MC
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 21:21:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXJif-00088b-C5
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 21:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXJie-0003O5-EX
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 21:21:25 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:20716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YXJiT-0003D2-S9; Sun, 15 Mar 2015 21:21:14 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDD18471; Mon, 16 Mar 2015 09:20:55 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 16 Mar 2015 09:20:44 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 16 Mar 2015 09:20:29 +0800
Message-ID: <1426468829-8024-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.55062FF8.0106, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 90bcac20401b93c3088ca3d69baea873
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, pbonzini@redhat.com,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH] fsdev/virtfs-proxy-helper: Fix improper use
	of negative value
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
X-List-Received-Date: Mon, 16 Mar 2015 01:21:26 -0000

It's detected by coverity. Check the return value of proxy_marshal.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 fsdev/virtfs-proxy-helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index c1da2d7..bf2e5f3 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -262,6 +262,9 @@ static int send_status(int sockfd, struct iovec *iovec, int status)
      */
     msg_size = proxy_marshal(iovec, 0, "ddd", header.type,
                              header.size, status);
+    if (msg_size < 0) {
+        return msg_size;
+    }
     retval = socket_write(sockfd, iovec->iov_base, msg_size);
     if (retval < 0) {
         return retval;
-- 
1.8.3.1



