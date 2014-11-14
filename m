Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xp5uA-0000Tm-RR
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 20:42:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp5u4-0000Tg-AF
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 20:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp5tz-00024Y-AE
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 20:42:24 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:53126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xp5ty-00024H-Nh; Thu, 13 Nov 2014 20:42:19 -0500
Received: from 172.24.2.119 (EHLO SZXEML458-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCI24647; Fri, 14 Nov 2014 09:42:15 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML458-HUB.china.huawei.com
	(10.82.67.201) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 14 Nov 2014 09:42:07 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Fri, 14 Nov 2014 09:39:23 +0800
Message-ID: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
	stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] l2tpv3: fix possible double free
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
X-List-Received-Date: Fri, 14 Nov 2014 01:42:29 -0000

freeaddrinfo(result) does not assign result = NULL, after frees it.
There will be a double free when it goes error case.
It is reported by covertiy.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 net/l2tpv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 528d95b..f9e0c98 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -661,6 +661,7 @@ int net_init_l2tpv3(const NetClientOptions *opts,
         fd = -errno;
         error_report("l2tpv3_open : socket creation failed, errno = %d", -fd);
         freeaddrinfo(result);
+        result = NULL;
         goto outerr;
     }
     if (bind(fd, (struct sockaddr *) result->ai_addr, result->ai_addrlen)) {
-- 
1.7.12.4



