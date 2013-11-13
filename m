Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaNj-0001Ns-AC
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:21:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNb-00019M-Nl
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNW-0005Pb-Ok
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaNL-0005NV-G8; Wed, 13 Nov 2013 08:20:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07F4E41706;
	Wed, 13 Nov 2013 17:20:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 919F5540;
	Wed, 13 Nov 2013 17:01:26 +0400 (MSK)
Received: (nullmailer pid 16067 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:20 +0400
Message-Id: <1384347680-15976-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, whitearchey <whitearchey@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 16/16] qga: Fix shutdown command of guest
	agent to work with SysV
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
X-List-Received-Date: Wed, 13 Nov 2013 13:21:17 -0000

From: whitearchey <whitearchey@gmail.com>

For now guest agent uses following command to shutdown system:
shutdown -P +0 "blabla"
but this syntax works only with shutdown command from systemd or upstart,
because SysV shutdown requires -h switch.

Following patch changes the command so it works with systemd, upstart and SysV

With upstart/systemd qga use one of thee commands, depending on 'mode' parameter:
  shutdown -P +0 "..."
  shutdown -H +0 "..."
  shutdown -r +0 "..."
SysV equivalents for these are:
  shutdown -h -P +0 "..."
  shutdown -h -H +0 "..."
  shutdown -h -r +0 "..."
and these retain their meaning with upstart/systemd.

According to FreeBSD manpages, shutdown does not accept -P and -H options. Commands should be:
  shutdown -p +0 "..."
  shutdown -h +0 "..."
  shutdown -r +0 "..."

shutdown in Solaris does not accept any of -hHpPr and does not accept time in "+0" format

Signed-off-by: Michael Avdienko <whitearchey@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-posix.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f453132..10682f5 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -99,7 +99,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **err)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
-        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char*)NULL, environ);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
-- 
1.7.10.4


