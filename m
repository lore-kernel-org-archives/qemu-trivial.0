Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJSv-0000e5-29
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:30:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSo-0000Z3-Ig
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSk-0002OY-2n
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJSX-0002Be-JD; Fri, 15 Aug 2014 11:30:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E80C94307C;
	Fri, 15 Aug 2014 19:30:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 40D866E3;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17908 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:54 +0400
Message-Id: <1408115711-17836-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Liming Wang <liming.wang@canonical.com>
Subject: [Qemu-trivial] [PULL 03/20] qemu-options.hx: fix a typo of chardev
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
X-List-Received-Date: Fri, 15 Aug 2014 15:30:51 -0000

From: Liming Wang <liming.wang@canonical.com>

Change host to port.

Signed-off-by: Liming Wang <liming.wang@canonical.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 96516c1..000cccd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1926,7 +1926,7 @@ ETEXI
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev null,id=id[,mux=on|off]\n"
-    "-chardev socket,id=id[,host=host],port=host[,to=to][,ipv4][,ipv6][,nodelay]\n"
+    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay]\n"
     "         [,server][,nowait][,telnet][,mux=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server][,nowait][,telnet],[mux=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
-- 
1.7.10.4


