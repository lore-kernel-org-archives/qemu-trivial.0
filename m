Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmGxp-0000XC-OV
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 01:17:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxn-0000Sx-5e
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxm-0004qe-BJ
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:47 -0400
Received: from [222.73.24.84] (port=29638 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UmGxl-0004qU-VW; Tue, 11 Jun 2013 01:17:46 -0400
X-IronPort-AV: E=Sophos;i="4.87,842,1363104000"; 
   d="scan'208";a="7517751"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 11 Jun 2013 13:14:51 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5B5HhwV030103;
	Tue, 11 Jun 2013 13:17:44 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061113155323-2018060 ;
	Tue, 11 Jun 2013 13:15:53 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 11 Jun 2013 13:15:18 +0800
Message-Id: <1370927720-4348-3-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/11 13:15:53,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/11 13:15:53,
	Serialize complete at 2013/06/11 13:15:53
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH 3/5] qemu-char: pass bool parameter for
	qemu_opt_get_bool
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
X-List-Received-Date: Tue, 11 Jun 2013 05:17:48 -0000

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 qemu-char.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index d04b429..8092eb8 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2767,10 +2767,10 @@ static CharDriverState *qemu_chr_open_socket(QemuOpts *opts)
     int is_unix;
     int is_telnet;
 
-    is_listen      = qemu_opt_get_bool(opts, "server", 0);
-    is_waitconnect = qemu_opt_get_bool(opts, "wait", 1);
-    is_telnet      = qemu_opt_get_bool(opts, "telnet", 0);
-    do_nodelay     = !qemu_opt_get_bool(opts, "delay", 1);
+    is_listen      = qemu_opt_get_bool(opts, "server", false);
+    is_waitconnect = qemu_opt_get_bool(opts, "wait", true);
+    is_telnet      = qemu_opt_get_bool(opts, "telnet", false);
+    do_nodelay     = !qemu_opt_get_bool(opts, "delay", true);
     is_unix        = qemu_opt_get(opts, "path") != NULL;
     if (!is_listen)
         is_waitconnect = 0;
-- 
1.7.2.5


