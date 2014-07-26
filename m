Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XAwFp-0005gY-9q
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jul 2014 03:18:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XAwFi-0005TC-5v
	for qemu-trivial@nongnu.org; Sat, 26 Jul 2014 03:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XAwFd-0006zn-06
	for qemu-trivial@nongnu.org; Sat, 26 Jul 2014 03:18:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XAwFS-0006v5-Ob; Sat, 26 Jul 2014 03:18:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D9E545443;
	Sat, 26 Jul 2014 11:18:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6DDF16BD;
	Sat, 26 Jul 2014 11:18:22 +0400 (MSK)
Received: (nullmailer pid 17846 invoked by uid 1000);
	Sat, 26 Jul 2014 07:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 26 Jul 2014 11:18:21 +0400
Message-Id: <1406359101-17791-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406359101-17791-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1406359101-17791-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL] qemu-options: fix another allows-to for -net
	l2tpv3
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
X-List-Received-Date: Sat, 26 Jul 2014 07:18:51 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 9e54686..1549625 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1437,7 +1437,7 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
     "-net l2tpv3[,vlan=n][,name=str],src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6=on/off][,udp=on/off][,cookie64=on/off][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]\n"
     "                connect the VLAN to an Ethernet over L2TPv3 pseudowire\n"
     "                Linux kernel 3.3+ as well as most routers can talk\n"
-    "                L2TPv3. This transport allows to connect a VM to a VM,\n"
+    "                L2TPv3. This transport allows connecting a VM to a VM,\n"
     "                VM to a router and even VM to Host. It is a nearly-universal\n"
     "                standard (RFC3391). Note - this implementation uses static\n"
     "                pre-configured tunnels (same as the Linux kernel).\n"
-- 
1.7.10.4


