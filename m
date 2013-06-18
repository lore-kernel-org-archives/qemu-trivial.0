Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8V-0002Ud-0l
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uomum-0003ev-Ko
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uomul-0000xE-Px
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:04 -0400
Received: from [222.73.24.84] (port=15121 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uomul-0000x1-Fb; Mon, 17 Jun 2013 23:49:03 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584450"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 11:46:07 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I3n1hj016535;
	Tue, 18 Jun 2013 11:49:01 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061811465882-2222907 ;
	Tue, 18 Jun 2013 11:46:58 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 18 Jun 2013 11:45:35 +0800
Message-Id: <1371527137-16949-3-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 11:46:58,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 11:46:59,
	Serialize complete at 2013/06/18 11:46:59
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:26 -0400
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH v2 3/5] qemu-char: use bool in
	qemu_chr_open_socket
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
X-List-Received-Date: Tue, 18 Jun 2013 03:49:05 -0000

local variables is_* should be bool by usage,
and last parameter of qemu_opt_get_bool is bool,
so pass true/false for it.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 qemu-char.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2c3cfe6..0d695e0 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2679,16 +2679,16 @@ static CharDriverState *qemu_chr_open_socket(QemuOpts *opts)
     CharDriverState *chr = NULL;
     Error *local_err = NULL;
     int fd = -1;
-    int is_listen;
-    int is_waitconnect;
-    int do_nodelay;
-    int is_unix;
-    int is_telnet;
-
-    is_listen      = qemu_opt_get_bool(opts, "server", 0);
-    is_waitconnect = qemu_opt_get_bool(opts, "wait", 1);
-    is_telnet      = qemu_opt_get_bool(opts, "telnet", 0);
-    do_nodelay     = !qemu_opt_get_bool(opts, "delay", 1);
+    bool is_listen;
+    bool is_waitconnect;
+    bool do_nodelay;
+    bool is_unix;
+    bool is_telnet;
+
+    is_listen      = qemu_opt_get_bool(opts, "server", false);
+    is_waitconnect = qemu_opt_get_bool(opts, "wait", true);
+    is_telnet      = qemu_opt_get_bool(opts, "telnet", false);
+    do_nodelay     = !qemu_opt_get_bool(opts, "delay", true);
     is_unix        = qemu_opt_get(opts, "path") != NULL;
     if (!is_listen)
         is_waitconnect = 0;
-- 
1.7.2.5


