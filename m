Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWfM-0004wi-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:23:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfG-0004id-0f
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWf7-00031b-Qp
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWf1-0002ue-3T; Thu, 19 Mar 2015 05:22:39 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E10441E46;
	Thu, 19 Mar 2015 12:22:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3E7A791E;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 347 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:30 +0300
Message-Id: <293811f6c1630e3b37aa9d214c6596ce854ab2c7.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 12/24] qmp: Drop unused .user_print from
	command definitions
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
X-List-Received-Date: Thu, 19 Mar 2015 09:22:59 -0000

From: Markus Armbruster <armbru@redhat.com>

.user_print isn't used with QMP commands, only with HMP commands.
Copied over when QMP got its own command table in commit 82a56f0.
Most of them have been dropped since, but a few stragglers remain.
Drop them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 0663924..87f0f01 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -276,7 +276,6 @@ EQMP
         .args_type  = "device:O",
         .params     = "driver[,prop=value][,...]",
         .help       = "add device, like -device on the command line",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = do_device_add,
     },
 
@@ -786,7 +785,6 @@ EQMP
         .args_type  = "protocol:s,hostname:s,port:i?,tls-port:i?,cert-subject:s?",
         .params     = "protocol hostname port tls-port cert-subject",
         .help       = "send migration info to spice/vnc client",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_async = client_migrate_info,
         .flags      = MONITOR_CMD_ASYNC,
     },
@@ -822,7 +820,6 @@ EQMP
         .args_type  = "paging:b,protocol:s,begin:i?,end:i?,format:s?",
         .params     = "-p protocol [begin] [length] [format]",
         .help       = "dump guest memory to file",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = qmp_marshal_input_dump_guest_memory,
     },
 
@@ -1862,7 +1859,6 @@ EQMP
         .args_type  = "",
         .params     = "",
         .help       = "enable QMP capabilities",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = do_qmp_capabilities,
     },
 
-- 
2.1.4


