Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHoeW-0003MN-Uc
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 02:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XHoeQ-0003Ek-DG
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 02:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XHoeL-0005CH-Jg
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 02:36:42 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:6827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XHoe9-0004xY-By; Thu, 14 Aug 2014 02:36:26 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATB36181; Thu, 14 Aug 2014 14:36:11 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 14:36:01 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 14:35:48 +0800
Message-ID: <1407998148-3880-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.53EC58DD.0088,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 843b0360d04c50e2ff7eb72e0e95d51e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, weidong.huang@huawei.com,
	Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: fix typo about l2tpv3
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
X-List-Received-Date: Thu, 14 Aug 2014 06:36:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

two duplicate destport description.

s/destport/srcport/, s/destination/source/

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 96516c1..ebdffeb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1444,7 +1444,7 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
     "                use 'src=' to specify source address\n"
     "                use 'dst=' to specify destination address\n"
     "                use 'udp=on' to specify udp encapsulation\n"
-    "                use 'dstport=' to specify destination udp port\n"
+    "                use 'srcport=' to specify source udp port\n"
     "                use 'dstport=' to specify destination udp port\n"
     "                use 'ipv6=on' to force v6\n"
     "                L2TPv3 uses cookies to prevent misconfiguration as\n"
-- 
1.7.12.4



