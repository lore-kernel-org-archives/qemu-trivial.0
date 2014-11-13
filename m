Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XotLT-0007NG-WA
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 07:17:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLL-00078n-SX
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLG-0001ss-To
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:43 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:43071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XotL6-0001qA-FO; Thu, 13 Nov 2014 07:17:29 -0500
Received: from 172.24.2.119 (EHLO szxeml412-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXB33011; Thu, 13 Nov 2014 20:17:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml412-hub.china.huawei.com
	(10.82.67.91) with Microsoft SMTP Server id 14.3.158.1; Thu, 13 Nov 2014
	20:17:10 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 20:17:07 +0800
Message-ID: <1415881027-8112-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5464A151.017F, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6645e7b577138223d8bc3a07465f4d83
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	aneesh.kumar@linux.vnet.ibm.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 2/2] virtfs-proxy-helper: Fix handle leak to
	make Coverity happy
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
X-List-Received-Date: Thu, 13 Nov 2014 12:17:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Coverity report:
(94) Event open_fn:  Returning handle opened by function "proxy_socket(char const *, uid_t, gid_t)". [details]
(95) Event var_assign:  Assigning: "sock" = handle returned from "proxy_socket(sock_name, own_u, own_g)".
(103) Event leaked_handle:  Handle variable "sock" going out of scope leaks the handle.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 fsdev/virtfs-proxy-helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index c1da2d7..2d72def 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -1150,6 +1150,9 @@ int main(int argc, char **argv)
 
     process_requests(sock);
 error:
+    if (sock_name && sock >= 0) {
+        close(sock);
+    }
     do_log(LOG_INFO, "Done\n");
     closelog();
     return 0;
-- 
1.7.12.4



