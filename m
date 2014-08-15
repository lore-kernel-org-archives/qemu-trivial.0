Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJE-0001hu-O2
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ6-0001aj-Kw
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ1-0007OE-Mm
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIr-0007Ic-Ix; Fri, 15 Aug 2014 11:20:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 03EEC4307B;
	Fri, 15 Aug 2014 19:20:29 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8B396E7;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17931 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:05 +0400
Message-Id: <1408115711-17836-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/20] qemu-options.hx: fix typo about l2tpv3
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:49 -0000

From: Gonglei <arei.gonglei@huawei.com>

two duplicate destport description.

s/destport/srcport/, s/destination/source/

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 000cccd..9d743e5 100644
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
1.7.10.4


