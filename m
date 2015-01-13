Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YB1Na-0005pC-38
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jan 2015 08:19:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YB1NT-0005hf-Li
	for qemu-trivial@nongnu.org; Tue, 13 Jan 2015 08:19:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YB1NS-0002QG-5Z
	for qemu-trivial@nongnu.org; Tue, 13 Jan 2015 08:19:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YB1NM-0002NH-W2; Tue, 13 Jan 2015 08:19:17 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0DDJG4V022112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 13 Jan 2015 08:19:16 -0500
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0DDJEK6003609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 13 Jan 2015 08:19:15 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9BA1D3043FC9; Tue, 13 Jan 2015 14:19:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Jan 2015 14:19:13 +0100
Message-Id: <1421155153-14061-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vl: Fix bogus error message for implied mon
	ID clashing
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
X-List-Received-Date: Tue, 13 Jan 2015 13:19:28 -0000

monitor_parse() desugars --monitor, --qmp and -qmp-pretty to --mon.
The ID it picks can clash with a user-specified ID.  When it happens,
the error message is misleading.

Reproducer:

    $ qemu --mon id=compat_monitor0 --monitor stdio

Message before the patch:

    duplicate chardev: compat_monitor0

There's no "duplicate chardev" here.  The problem is a duplicate
monitor ID.  Moreover, the message provides no clue which option
caused the problem.  The patch changes the message to:

    qemu: --monitor stdio: Duplicate ID 'compat_monitor0' for mon

monitor_parse() is also used for creating a default monitor, but
that's not done when the user specifies a monitor, so an ID clash is
impossible then.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 7786b2f..1a36b78 100644
--- a/vl.c
+++ b/vl.c
@@ -2198,6 +2198,7 @@ static int mon_init_func(QemuOpts *opts, void *opaque)
 static void monitor_parse(const char *optarg, const char *mode, bool pretty)
 {
     static int monitor_device_index = 0;
+    Error *local_err = NULL;
     QemuOpts *opts;
     const char *p;
     char label[32];
@@ -2218,9 +2219,10 @@ static void monitor_parse(const char *optarg, const char *mode, bool pretty)
         }
     }
 
-    opts = qemu_opts_create(qemu_find_opts("mon"), label, 1, NULL);
+    opts = qemu_opts_create(qemu_find_opts("mon"), label, 1, &local_err);
     if (!opts) {
-        fprintf(stderr, "duplicate chardev: %s\n", label);
+        error_report("%s", error_get_pretty(local_err));
+        error_free(local_err);
         exit(1);
     }
     qemu_opt_set(opts, "mode", mode);
-- 
1.9.3


