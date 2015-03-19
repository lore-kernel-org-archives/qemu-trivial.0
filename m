Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYXbW-0004W7-9A
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 06:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbU-0004Sg-7p
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbO-00071w-Vr
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:23:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYXb4-0006wS-4V; Thu, 19 Mar 2015 06:22:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1E2F741E5C;
	Thu, 19 Mar 2015 13:22:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1AE4092B;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 345 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:29 +0300
Message-Id: <46db7b862ab66d14679bb96563092e7ef76f1cfb.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 11/24] hmp: Fix definition of command quit
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
X-List-Received-Date: Thu, 19 Mar 2015 10:23:05 -0000

From: Markus Armbruster <armbru@redhat.com>

The command handler is a union of two function types.  If
cmd->user_print is set, handle_user_command() calls
cmd->mhandler.cmd_new(), else cmd->mhandler.cmd().

Command definitions must therefore either set both user_print() and
mhandler.cmd_new(), or only mhandler.cmd().

quit's sets user_print and mhandler.cmd().  handle_user_command()
calls hmp_quit() through mhandler.cmd_new() rather than
mhandler.cmd(), i.e. through a function pointer with a different type.
Broken in commit 7a7f325, v1.0.

Works in practice because hmp_quit() doesn't use its arguments, and
handle_user_command() ignores its function value.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hmp-commands.hx | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 328709d..6fd5336 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -47,7 +47,6 @@ ETEXI
         .args_type  = "",
         .params     = "",
         .help       = "quit the emulator",
-        .user_print = monitor_user_noop,
         .mhandler.cmd = hmp_quit,
     },
 
-- 
2.1.4


