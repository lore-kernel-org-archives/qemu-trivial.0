Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGZ-0006gz-Hb
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGR-0006RI-V0
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGN-0003vG-50
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:31 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:53373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iA-1o; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXD50452; Sat, 15 Nov 2014 18:06:59 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:40 +0800
Message-ID: <1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.546725C5.00BB, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8b7bbfb9bd50dfddefad30c0b8a45a34
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 1/9] l2tpv3: fix fd leak
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

In this false branch, fd will leak when it is zero.
Change the testing condition.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 net/l2tpv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 528d95b..b2b0fc0 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -746,7 +746,7 @@ int net_init_l2tpv3(const NetClientOptions *opts,
     return 0;
 outerr:
     qemu_del_net_client(nc);
-    if (fd > 0) {
+    if (fd != -1) {
         close(fd);
     }
     if (result) {
-- 
1.7.12.4



