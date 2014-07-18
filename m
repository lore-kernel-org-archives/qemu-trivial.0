Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88r3-0007tk-V4
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qw-0007gK-Kx
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qr-0001mK-45
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001d5-23; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AA5854386A;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8914E6BC;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 627 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:09 +0400
Message-Id: <1405692553-564-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gernot Hillier <gernot.hillier@siemens.com>
Subject: [Qemu-trivial] [PULL 4/8] doc: slirp supports ICMP echo if enabled
	in Linux
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:43 -0000

From: Gernot Hillier <gernot.hillier@siemens.com>

Since QEMU 0.15, slirp (user mode networking) supports ping to the
Internet, see e6d43cfb1f9

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 551619a..2b232ae 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1205,9 +1205,16 @@ In order to check that the user mode network is working, you can ping
 the address 10.0.2.2 and verify that you got an address in the range
 10.0.2.x from the QEMU virtual DHCP server.
 
-Note that @code{ping} is not supported reliably to the internet as it
-would require root privileges. It means you can only ping the local
-router (10.0.2.2).
+Note that ICMP traffic in general does not work with user mode networking.
+@code{ping}, aka. ICMP echo, to the local router (10.0.2.2) shall work,
+however. If you're using QEMU on Linux >= 3.0, it can use unprivileged ICMP
+ping sockets to allow @code{ping} to the Internet. The host admin has to set
+the ping_group_range in order to grant access to those sockets. To allow ping
+for GID 100 (usually users group):
+
+@example
+echo 100 100 > /proc/sys/net/ipv4/ping_group_range
+@end example
 
 When using the built-in TFTP server, the router is also the TFTP
 server.
-- 
1.7.10.4


