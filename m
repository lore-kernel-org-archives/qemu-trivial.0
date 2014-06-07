Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJn0-0007vw-7j
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:48:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJmy-0007uZ-Er
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJmx-0000MY-NR
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:48:16 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJmt-0000Lg-Gl; Sat, 07 Jun 2014 12:48:11 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJml-0003Wv-Ib; Sat, 07 Jun 2014 17:48:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:48:03 +0100
Message-Id: <1402159683-13544-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] util/qemu-sockets.c: Avoid unused variable
	warnings
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
X-List-Received-Date: Sat, 07 Jun 2014 16:48:17 -0000

The 'on' variable is never used, and 'off' is only used
if IPV6_V6ONLY is defined; delete 'on' and move 'off' to
the point where it is used. This avoids warnings from
clang 3.4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/qemu-sockets.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 627e609..e3d29ee 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -30,8 +30,6 @@
 # define AI_ADDRCONFIG 0
 #endif
 
-static const int on=1, off=0;
-
 /* used temporarily until all users are converted to QemuOpts */
 QemuOptsList socket_optslist = {
     .name = "socket",
@@ -159,6 +157,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
 #ifdef IPV6_V6ONLY
         if (e->ai_family == PF_INET6) {
             /* listen on both ipv4 and ipv6 */
+            const int off = 0;
             qemu_setsockopt(slisten, IPPROTO_IPV6, IPV6_V6ONLY, &off,
                             sizeof(off));
         }
-- 
1.8.5.4


