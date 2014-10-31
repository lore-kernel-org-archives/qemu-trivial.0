Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDz3-0005RC-7f
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:19:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDxx-0005w3-OG
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:19:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk2Li-0005jL-Un
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 22:54:07 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:38705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk2Ld-0005ZF-DS; Thu, 30 Oct 2014 22:53:57 -0400
Received: from 172.24.2.119 (EHLO szxeml413-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWJ85605; Fri, 31 Oct 2014 10:53:51 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml413-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 10:53:41 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 31 Oct 2014 10:53:30 +0800
Message-ID: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5452F9C0.00E8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e4a4d99535f82993a2b9f51629e3947b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] tap_int.h: remove repeating macroinstruction
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
X-List-Received-Date: Fri, 31 Oct 2014 15:19:23 -0000

From: Gonglei <arei.gonglei@huawei.com>

DEFAULT_NETWORK_SCRIPT and DEFAULT_NETWORK_DOWN_SCRIPT
have been defined in net/net.h included in
tap.c, which is the only C file that using those two macro.
Let's remove the repeating macroinstruction.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 net/tap_int.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/tap_int.h b/net/tap_int.h
index 86bb224..79afdf2 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -29,9 +29,6 @@
 #include "qemu-common.h"
 #include "qapi-types.h"
 
-#define DEFAULT_NETWORK_SCRIPT "/etc/qemu-ifup"
-#define DEFAULT_NETWORK_DOWN_SCRIPT "/etc/qemu-ifdown"
-
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
              int vnet_hdr_required, int mq_required);
 
-- 
1.7.12.4



