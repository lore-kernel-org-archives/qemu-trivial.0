Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqFHA-0000SS-TK
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 00:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqFH5-0000S3-54
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqFH0-00010Y-Ba
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:54:55 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:25336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XqFGz-00010J-Jt; Mon, 17 Nov 2014 00:54:50 -0500
Received: from 172.24.2.119 (EHLO SZXEML455-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXF40388; Mon, 17 Nov 2014 13:54:43 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML455-HUB.china.huawei.com
	(10.82.67.198) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 17 Nov 2014 13:54:33 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 17 Nov 2014 13:54:05 +0800
Message-ID: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.54698DA3.00CF, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7b976e65ff387dbe65bd8034628618c9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] net: The third parameter of getsockname
	should be initialized
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
X-List-Received-Date: Mon, 17 Nov 2014 05:55:00 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 net/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/socket.c b/net/socket.c
index fb21e20..ca4b8ba 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -352,7 +352,7 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
 {
     struct sockaddr_in saddr;
     int newfd;
-    socklen_t saddr_len;
+    socklen_t saddr_len = sizeof(saddr);
     NetClientState *nc;
     NetSocketState *s;
 
-- 
1.7.12.4



