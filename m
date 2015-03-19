Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVa-0002Zo-L5
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVU-0002Nn-C3
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVT-0007nb-Mt
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVJ-0007id-GA; Thu, 19 Mar 2015 05:12:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E6A841E3E;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D948893C;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 361 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:36 +0300
Message-Id: <636a30a890c50f734c90ee929e16492fbc6c73e3.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/24] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:53 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
command add_fd).  Free it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 694deb4..69617d6 100644
--- a/vl.c
+++ b/vl.c
@@ -1012,6 +1012,7 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     int fd, dupfd, flags;
     int64_t fdset_id;
     const char *fd_opaque = NULL;
+    AddfdInfo *fdinfo;
 
     fd = qemu_opt_get_number(opts, "fd", -1);
     fdset_id = qemu_opt_get_number(opts, "set", -1);
@@ -1061,8 +1062,9 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     }
 
     /* add the duplicate fd, and optionally the opaque string, to the fd set */
-    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
-                         fd_opaque, NULL);
+    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
+                                  &error_abort);
+    g_free(fdinfo);
 
     return 0;
 }
-- 
2.1.4


