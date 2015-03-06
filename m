Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YToH0-0000j3-2a
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2015 04:10:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGs-0000SL-7a
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGn-0006i0-62
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YToGf-0006Q0-9U; Fri, 06 Mar 2015 04:10:01 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t269A0IN016501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 6 Mar 2015 04:10:00 -0500
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2699wJt013604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 6 Mar 2015 04:10:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 69544303FB53; Fri,  6 Mar 2015 10:09:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Mar 2015 10:09:58 +0100
Message-Id: <1425632998-616-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1425632998-616-1-git-send-email-armbru@redhat.com>
References: <1425632998-616-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] qmp: Drop unused .user_print from
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
X-List-Received-Date: Fri, 06 Mar 2015 09:10:20 -0000

.user_print isn't used with QMP commands, only with HMP commands.
Copied over when QMP got its own command table in commit 82a56f0.
Most of them have been dropped since, but a few stragglers remain.
Drop them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qmp-commands.hx | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index a85d847..2c05e87 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -276,7 +276,6 @@ EQMP
         .args_type  = "device:O",
         .params     = "driver[,prop=value][,...]",
         .help       = "add device, like -device on the command line",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = do_device_add,
     },
 
@@ -757,7 +756,6 @@ EQMP
         .args_type  = "protocol:s,hostname:s,port:i?,tls-port:i?,cert-subject:s?",
         .params     = "protocol hostname port tls-port cert-subject",
         .help       = "send migration info to spice/vnc client",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_async = client_migrate_info,
         .flags      = MONITOR_CMD_ASYNC,
     },
@@ -793,7 +791,6 @@ EQMP
         .args_type  = "paging:b,protocol:s,begin:i?,end:i?,format:s?",
         .params     = "-p protocol [begin] [length] [format]",
         .help       = "dump guest memory to file",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = qmp_marshal_input_dump_guest_memory,
     },
 
@@ -1833,7 +1830,6 @@ EQMP
         .args_type  = "",
         .params     = "",
         .help       = "enable QMP capabilities",
-        .user_print = monitor_user_noop,
         .mhandler.cmd_new = do_qmp_capabilities,
     },
 
-- 
1.9.3


