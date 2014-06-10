Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPqM-0000UX-9Z
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 13:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqF-0000Gd-5d
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPq9-0000UU-U1
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPpy-0000Rf-Pi; Tue, 10 Jun 2014 13:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 870C6412A5;
	Tue, 10 Jun 2014 21:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 85C316D3;
	Tue, 10 Jun 2014 20:08:49 +0400 (MSK)
Received: (nullmailer pid 13309 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:27 +0400
Message-Id: <1402416523-13212-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/25] util/qemu-sockets.c: Avoid unused
	variable warnings
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
X-List-Received-Date: Tue, 10 Jun 2014 17:28:16 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The 'on' variable is never used, and 'off' is only used
if IPV6_V6ONLY is defined; delete 'on' and move 'off' to
the point where it is used. This avoids warnings from
clang 3.4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c |    3 +--
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
1.7.10.4


