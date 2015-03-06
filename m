Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YToGy-0000gJ-EF
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2015 04:10:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGv-0000aW-4g
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGu-0006kj-9G
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YToGf-0006Pv-5I; Fri, 06 Mar 2015 04:10:01 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t269A08P025336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 6 Mar 2015 04:10:00 -0500
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2699wSv025472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 6 Mar 2015 04:10:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 591BF303FED2; Fri,  6 Mar 2015 10:09:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Mar 2015 10:09:57 +0100
Message-Id: <1425632998-616-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1425632998-616-1-git-send-email-armbru@redhat.com>
References: <1425632998-616-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] hmp: Fix definition of command quit
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
X-List-Received-Date: Fri, 06 Mar 2015 09:10:18 -0000

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
---
 hmp-commands.hx | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 81f276b..fa5679f 100644
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
1.9.3


