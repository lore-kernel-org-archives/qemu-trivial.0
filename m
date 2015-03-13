Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPCv-00022t-E9
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:00:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWPCt-000201-Ej
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 09:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWPCq-0004Wv-Fo
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 09:00:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YWP7v-0002mR-SP; Fri, 13 Mar 2015 08:55:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DCtdh0027753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 08:55:39 -0400
Received: from donizetti.redhat.com (ovpn-112-55.ams2.redhat.com
	[10.36.112.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DCtaSr027533; Fri, 13 Mar 2015 08:55:37 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Mar 2015 13:55:34 +0100
Message-Id: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, famz@redhat.com, zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH] vl: fix resource leak with
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
X-List-Received-Date: Fri, 13 Mar 2015 13:00:52 -0000

monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
command add_fd).  Free it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	v1->v2: line length [Fam], pass &error_abort [Shannon]
---
 vl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index eba5d4c..9eae8f9 100644
--- a/vl.c
+++ b/vl.c
@@ -1011,6 +1011,7 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     int fd, dupfd, flags;
     int64_t fdset_id;
     const char *fd_opaque = NULL;
+    AddfdInfo *fdinfo;
 
     fd = qemu_opt_get_number(opts, "fd", -1);
     fdset_id = qemu_opt_get_number(opts, "set", -1);
@@ -1060,8 +1061,10 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     }
 
     /* add the duplicate fd, and optionally the opaque string, to the fd set */
-    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
-                         fd_opaque, NULL);
+    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id,
+                                  fd_opaque ? true : false, fd_opaque,
+                                  &error_abort);
+    g_free(fdinfo);
 
     return 0;
 }
-- 
2.3.0


