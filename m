Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X5GTO-0000C2-Jf
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jul 2014 11:41:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gernot.hillier@siemens.com>) id 1X5Euz-0005V7-Ad
	for qemu-trivial@nongnu.org; Thu, 10 Jul 2014 10:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gernot.hillier@siemens.com>) id 1X5Eus-0000nH-MW
	for qemu-trivial@nongnu.org; Thu, 10 Jul 2014 10:01:49 -0400
Received: from thoth.sbs.de ([192.35.17.2]:51541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gernot.hillier@siemens.com>)
	id 1X5Eue-0000iw-Tp; Thu, 10 Jul 2014 10:01:29 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.14.3/8.14.3) with ESMTP id s6AE1Pr0001590;
	Thu, 10 Jul 2014 16:01:25 +0200
Received: from [139.25.40.180] (kepler2.mch.sbs.de [139.25.40.180] (may be
	forged))
	by mail1.siemens.de (8.14.3/8.14.3) with ESMTP id s6AE1PlR017192;
	Thu, 10 Jul 2014 16:01:25 +0200
Message-ID: <53BE9CB5.4060503@siemens.com>
Date: Thu, 10 Jul 2014 16:01:25 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
Organization: Siemens AG, GTF SA&P
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.2
X-Mailman-Approved-At: Thu, 10 Jul 2014 11:41:24 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] doc: slirp supports ICMP echo if enabled in
	Linux
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
X-List-Received-Date: Thu, 10 Jul 2014 14:01:56 -0000


Since QEMU 0.15, slirp (user mode networking) supports ping to the
Internet, see e6d43cfb1f9

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
---
  qemu-doc.texi | 14 +++++++++++---
  1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 551619a..fc6e57d 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1205,9 +1205,17 @@ In order to check that the user mode network is 
working, you can ping
  the address 10.0.2.2 and verify that you got an address in the range
  10.0.2.x from the QEMU virtual DHCP server.

-Note that @code{ping} is not supported reliably to the internet as it
-would require root privileges. It means you can only ping the local
-router (10.0.2.2).
+Note that ICMP traffic in general does not work with user mode networking.
+@code{ping}, aka. ICMP echo, to the local router (10.0.2.2) shall work,
+however. If you're using QEMU on Linux >= 3.0, it can use unprivileged ICMP
+ping sockets to allow @code{ping} to the Internet. The host admin has 
to set
+the ping_group_range in order to grant access to those sockets. To 
allow ping
+for the users group (GID 100):
+
+@example
+
+echo 100 100 > /proc/sys/net/ipv4/ping_group_range
+@end example

  When using the built-in TFTP server, the router is also the TFTP
  server.
-- 
1.8.4


